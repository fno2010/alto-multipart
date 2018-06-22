# Multipart Query Resource

## Media Type

`multipart/mixed` {{RFC2046}} or `multipart/related` {{?RFC2387}}.

## HTTP Method

An ALTO Multipart Query resource is requested using the HTTP POST method.

## Accept Input Parameters {#mp-query-params}

`application/alto-multipartquery+json`.

~~~
    object {
      JsonString      resource-id;
      [JsonObject     input;]
    } ResourceQuery;

    object {
      ResourceQuery   resources<1..*>;
      [JsonString     query-lang;]
    } ReqMultipartQuery;
~~~

## Capabilities

~~~
    object {
      JsonString query-langs<0..*>;
    } MultipartQueryCapabilities;
~~~

## Uses

Any available ALTO resources rather than the multipart query service resource.

## Response

# Protocol Errors

TODO: We need to define new error type to indicate errors caused by the queried
resources instead of the Multipart Query resource.
