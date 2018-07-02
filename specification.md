# Multipart Query Resource

## Media Type

`multipart/related` {{RFC2387}}.

## HTTP Method

An ALTO Multipart Query resource is requested using the HTTP POST method.

## Accept Input Parameters {#mp-query-params}

The input parameters for a Multipart Query request are supplied in the entity
body of the POST request. This document specifies the input parameters with
a data format indicated by the media type
`application/alto-multipartquery+alto`, which is a JSON object of type
ReqMultipartQuery:

~~~
    object {
      ResourceQuery   resources<1..*>;
      [JsonString     query-lang;]
    } ReqMultipartQuery;

    object {
      JsonString      resource-id;
      [JsonValue      input;]
    } ResourceQuery;
~~~

with fields:

resources:
: List of ResourceQuery objects for which resources are to be queried and how to
  query them. Each ResourceQuery object MUST include the `resource-id` field to
  indicate which resource is to be queried. If the queried resource requires the
  POST method, the `input` field MUST be specified. The value of the `input`
  field MUST be either a JSONString or a JSONObject. When its value is a
  JSONObject, its format MUST be as the accept input parameters of its resource.
  When its value is a JSONString, it MUST be a program written in the query
  language specified by the `query-lang` field.

query-lang:
: Optional. The value of the `query-lang` field MUST be one of values in the
  `query-langs` capability. If this field is not specified in the request, the
  ALTO client SHOULD NOT use any query language in the `input` field.

## Capabilities

The capabilities are defined by an object of type MultipartQueryCapabilities:

~~~
    object {
      JSONString query-langs<0..*>;
    } MultipartQueryCapabilities;
~~~

where `query-langs` is an array of JSONString to indicate which query languages
are supported by this resource.

## Uses

An array with the resource ID(s) of resource(s) which this multipart query
resource can compound. The used resource can be any available ALTO resources
except for the multipart query resource. If the `uses` field is not specified,
all the available ALTO resources can be queried except for the multipart query
resource.

## Response

The response of multipart query resource is a multipart message. Each part of
this multipart message is the response of a queried resource in the request.

# Protocol Errors

TODO: Need to define new error type to indicate errors caused by the queried
resources instead of the Multipart Query resource.
