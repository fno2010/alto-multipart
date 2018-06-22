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
        "uri": "http://alto.exmaple.com/propmap/delay",
        "media-type": "application/alto-propmap+json",
        "accepts": "application/alto-propmapparams+json",
        "capabilities": {
          "domain-types": [ "pid" ],
          "prop-types": [ "location" ]
        }
      },
      "multipart-query": {
        "uri": "http://alto.example.com/multipart",
        "media-type": "multipart/related",
        "accepts": "application/alto-multipartquery+json",
        "capabilities": {
          "query-langs": [ "xquery" ]
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
      "resource-id": "default-network-map"
    },
    {
      "resource-id": "default-cost-map"
    }
  ]
}

~~~

## Example 2: Properties Constrained Query

## Example 3: Path Vector Query
