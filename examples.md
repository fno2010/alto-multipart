# Examples

## IRD Example

Assume the root IRD is like the following:

~~~
  {
    "meta": {
        "path-vector": {
          "cost-mode": "array",
          "cost-metric": "ane-path"
        },
        "num-routingcost": {
          "cost-mode": "numerical",
          "cost-metric": "routingcost"
        },
        "num-hopcount": {
          "cost-mode": "numerical",
          "cost-metric": "hopcount"
        }
    },
    "resources": {
      "my-default-networkmap": {
        "uri": "http://alto.example.com/networkmap",
        "media-type": "application/alto-networkmap+json"
      },
      "my-default-costmap": {
        "uri": "http://alto.example.com/costmap",
        "media-type": "application/alto-costmap+json",
        "capabilities": {
          "cost-type-names": [ "num-routingcost" ]
        },
        "uses": [ "my-default-networkmap" ]
      },
      "my-filtered-costmap": {
        "uri": "http://alto.example.com/costmap/filtered",
        "media-type": "application/alto-costmap+json",
        "accepts": "application/alto-costmapfilter+json",
        "capabilities": {
          "cost-type-names": [ "num-hopcount" ]
        },
        "uses": [ "my-default-networkmap" ]
      },
      "endpoint-path-vector": {
        "uri": "http://alto.exmaple.com/endpointcost",
        "media-type": "application/alto-endpointcost+json",
        "accepts": "application/alto-endpointcostparams+json",
        "capabilities": {
          "cost-constraints": true,
          "cost-type-names": [ "path-vector" ],
        },
        "property-map": "propmap-availbw"
      },
      "propmap-availbw-delay": {
        "uri": "http://alto.exmaple.com/propmap/availbw",
        "media-type": "application/alto-propmap+json",
        "accepts": "application/alto-propmapparams+json",
        "capabilities": {
          "domain-types": [ "ane" ],
          "prop-types": [ "availbw" ]
        }
      },
      "propmap-location": {
        "uri": "http://alto.exmaple.com/propmap/location",
        "media-type": "application/alto-propmap+json",
        "accepts": "application/alto-propmapparams+json",
        "capabilities": {
          "domain-types": [ "pid" ],
          "prop-types": [ "country", "state" ]
        }
      },
      "multipart-query": {
        "uri": "http://alto.example.com/multipart",
        "media-type": "multipart/related",
        "accepts": "application/alto-multipartquery+json",
        "capabilities": {
          "query-langs": [ "xquery", "jsoniq" ]
        }
      }
    }
  }
~~~

## Example 1: Simple Batch Query

~~~
POST /multipart HTTP/1.1
Host: alto.example.com
Accept: multipart/related, application/alto-error+json
Content-Lenght: [TBD]
Content-Type: application/alto-multipartquery+json

{
  "resources": [
    {
      "resource-id": "my-default-networkmap"
    },
    {
      "resource-id": "my-default-costmap"
    }
  ]
}
~~~

~~~
HTTP/1.1 200 OK
Content-Lenght: [TBD]
Content-Type: multipart/related; boundary=simple-batch-query

--simple-batch-query
Content-Type: application/alto-networkmap+json

{
  "meta": {
    "vtag": {
      "resource-id": "my-default-networkmap",
      "tag": "75ed013b3cb58f896e839582504f622838ce670f"
    }
  },
  "network-map": {
    "PID1" : {
      "ipv4" : [
        "192.0.2.0/24",
        "198.51.100.0/25"
      ]
    },
    "PID2" : {
      "ipv4" : [
        "198.51.100.128/25"
      ]
    },
    "PID3" : {
      "ipv4" : [
        "0.0.0.0/0"
      ],
      "ipv6" : [
        "::/0"
      ]
    }
  }
}

--simple-batch-query
Content-Type: application/alto-costmap+json

{
  "meta": {
    "dependent-vtags": [
      {
        "resource-id": "my-default-networkmap",
        "tag": "75ed013b3cb58f896e839582504f622838ce670f"
      }
    ],
    "cost-type": {
      "cost-mode": "numerical",
      "cost-metric": "routingcost"
    }
  },
  "cost-map": {
    "PID1": { "PID1": 1,  "PID2": 5,  "PID3": 10 },
    "PID2": { "PID1": 5,  "PID2": 1,  "PID3": 15 },
    "PID3": { "PID1": 20, "PID2": 15  }
  }
}
~~~

## Example 2: Properties Constrained Query

NOTE: In this example, we use the "\`" block to express the raw string with
unescaped characters like `\n` and `\"`. It is not valid HTTP body, but only
used to better present. When the request is sent to the ALTO server, the "\`"
block should be escaped.

~~~
POST /multipart HTTP/1.1
Host: alto.example.com
Accept: multipart/related, application/alto-error+json
Content-Lenght: [TBD]
Content-Type: application/alto-multipartquery+json

{
  "query-lang": "jsoniq",
  "resources": [
    {
      "resource-id": "propmap-location"
    },
    {
      "resource-id": "my-default-costmap",
      "input": `
        let $propmap := collection("propmap-location")
                        .("property-map")
        return {
          "cost-type": {
            "cost-mode": "numerical",
            "cost-metric": "hopcount"
          },
          "pids": {
            "srcs": [
              for $pid in keys($propmap)
              where $propmap.$pid.country eq "US"
              return substring-after($pid, "PID:")
            ],
            "dsts": [
              for $pid in keys($propmap)
              where $propmap.$pid.country eq "CA"
              return substring-after($pid, "PID:")
            ]
          }
        }
      `
    }
  ]
}
~~~

~~~
HTTP/1.1 200 OK
Content-Lenght: [TBD]
Content-Type: multipart/related; boundary=prop-const-query

--prop-const-query
Content-Type: application/alto-propmap+json

{
  "property-map": {
    "pid:PID1": {
      "country": "US",
      "state": "CA"
    },
    "pid:PID2": {
      "country": "US",
      "state": "CT"
    },
    "pid:PID3": {
      "country": "CA",
      "state": "QC"
    },
    "pid:PID4": {
      "country": "CA",
      "state": "NT"
    },
    "pid:PID5": {
      "country": "FR"
    }
  }
}

--prop-const-query
Content-Type: application/alto-costmap+json

{
  "meta": {
    "cost-type": {
      "cost-mode": "numerical",
      "cost-metric": "hopcount"
    }
  },
  "cost-map": {
    "PID1": {
      "PID3": 5,
      "PID4": 7
    },
    "PID2": {
      "PID3": 8,
      "PID4": 4
    }
  }
}
~~~

## Example 3: Path Vector Query

~~~
POST /multipart HTTP/1.1
Host: alto.example.com
Accept: multipart/related, application/alto-error+json
Content-Lenght: [TBD]
Content-Type: application/alto-multipartquery+json

{
  "query-lang": "jsoniq",
  "resources": [
    {
      "resource-id": "endpoint-path-vector",
      "input": {
        "cost-type": {
          "cost-mode": "array",
          "cost-metric": "ane-path"
        },
        "endpoints": {
          "srcs": [ "ipv4:192.0.2.2" ],
          "dsts": [ "ipv4:192.0.2.89",
                    "ipv4:203.0.113.45" ]
        }
      }
    },
    {
      "resource-id": "propmap-availbw",
      "input": `
        let $propmap := collection("endpiont-path-vector")
                        .("endpoint-cost-map")
        return {
          "entities": [
            distinct-values(flatten(
              for $src in keys($propmap)
              let $dsts := $propmap.$src
              return flatten(
                for $dst in keys($dsts)
                return $dsts.$dst
              )
            ))
          ],
          "properties": [ "availbw" ]
        }
      `
    }
  ]
}
~~~

~~~
HTTP/1.1 200 OK
Content-Length: [TBD]
Content-Type: multipart/related; boundary=path-vector-query

--path-vector-query
Content-Type: application/alto-endpointcost+json

{
  "meta": {
    "cost-type": {
      "cost-mode": "array",
      "cost-metric": "ane-path"
    }
  },
  "endpoint-cost-map": {
    "ipv4:192.0.2.2": {
      "ipv4:192.0.2.89":   [ "ane:L001", "ane:L003", "ane:L004" ],
      "ipv4:203.0.113.45": [ "ane:L001", "ane:L004", "ane:L005" ],
      "ipv6:2001:db8::10": [ "ane:L001", "ane:L005", "ane:L007" ]
    }
  }
}

--path-vector-query
Content-Type: application/alto-propmap+json

{
  "property-map": {
    "ane:L001": { "availbw": 50 },
    "ane:L003": { "availbw": 48 },
    "ane:L004": { "availbw": 55 },
    "ane:L005": { "availbw": 60 },
    "ane:L007": { "availbw": 35 }
  }
}
~~~