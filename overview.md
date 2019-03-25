# Design Space of Multipart Resource in ALTO

This document discusses the solution of how to apply `multipart/*` (see
{{RFC2045}} and {{RFC2046}}) response to the ALTO protocol.

There are three cases applying Multipart response to ALTO:

Multipart Request and Multipart Response:
: In this case, an ALTO client can start a single request using Multipart
  encoding to query a batch of resources.

Single Request and Fixed-Layout Multipart Response:
: In this case, an ALTO server receives a non-Multipart request, e.g., the
  filtered costmap request or the endpoint cost request, but returns a
  Multipart response. The ALTO server MUST export the layout of the Multipart
  response in the IRD. A special example can be found in
  {{I-D.ietf-alto-path-vector}}.

Single Request and Flexible-Layout Multipart Response:
: This case extends the previous case to allows the Multipart response with
  flexible layout. The ALTO server receives the unified query request and
  generate the layout of the response based on the request. The ALTO client can
  even use general-purpose query language like XQuery {{W3CXQUERY}} and JSONiq
  {{JSONIQ}} for general query process and relational joint query.

The application about Multipart request to the single object response is out of
the scope of this document.
