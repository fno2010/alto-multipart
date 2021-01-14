# Compatibility

## Compatibility with Legacy ALTO Clients/Servers ##

The multipart query service is a new ALTO service using the new media type. So
the legacy ALTO client cannot identify this service from the IRD of the ALTO
server supporting it. And the legacy ALTO server also cannot interpret the
request of a multipart query service sent by the ALTO client.

## Compatibility with Existing Protocol Extensions ##

The multipart query service can use any ALTO resources exchanging JSON data in
request/response mechanism. So all the known ALTO extensions like ALTO Calendar
{{RFC8896}}, Multi-Cost {{RFC8189}} and the Path Vector
{{I-D.ietf-alto-path-vector}} extension, which does not change the
request/response mechanism, are compatible with the multipart query service.

<!--
## Compatibility with New Communication Mechanism ##

Since the multipart query service use multipart messages as the response
instead of the JSON data, the incremental update service defined in
{{I-D.ietf-alto-incr-update-sse}} does not support it. If the update service
does not notify the incremental change to the ALTO client but only notify the
full replacement, it can still work. But it is very inefficient. So an
extension to integrate multipart query and the incremental update smoothly is
required. HTTP/2 may be a candidate solution to this problem.
-->

# Misc Considerations

## Return ALTO Information Resources over HTTP/2

HTTP/2 {{RFC7540}} provides new features like streams and multiplexing that
can essentially reduce the web interface communication latency. As the growth
of deployment of HTTP/2, it is valuable to consider how to transit the ALTO
information resources over HTTP/2.

The multipart query service defined in this document includes two parts: the
multiple-resource query schema and the multipart response schema.

By leveraging HTTP/2 multiplexing in the scope of this document, the
multipart response schema can be replaced with sending multiple HTTP/2
streams using HTTP/2 server push. Each stream only needs to include a single
ALTO information resource. The benefit is that the Server can include
additional meta information in the HTTP HEADERS frame of each stream. And the
Client can parse each ALTO information resource in parallel.
However, the multiple-resource query schema is required to be reused to keep
the consistent request semantics. If the Client wants to receive consistent
query results, it should send a single multiple-resource query request over
the HTTP/2 stream to enforce the Server to generate the response to
different ALTO information resources based on the same database snapshot.

## Support Incremental Update

According to Section 5.2 of {{RFC8895}}, the update
stream service can use concatenation of the substream-id, the '.' separator
and a Content-ID to identify the update to each part of a multipart response.
Thus, each part of a multiple-resource query response MUST include a
Content-ID, if the Server provides an update stream service defined in
{{RFC8895}} for this multiple-resource query service.

<!-- Because the response body entry of the multipart query resource is not a single
JSON object, it may not be compatible with the current incremental update
representation used in {{I-D.ietf-alto-incr-update-sse}}. -->

## Anonymous Resources

Some use cases may need the server generates "anonymous" ALTO resources for the
on-demand information. The "anonymous" ALTO resources usually cannot appear
alone but need to bind with some "non-anonymous" ALTO resources.

# Security Considerations

Allow the ALTO clients to upload the query language script may not be safe. The
code injection and many potential attacks can be conducted. The security issue
should be discussed and considered.

To avoid the attacks like the code injection, this document recommends the
following approaches:

Database Isolation:
: Some clients may attempt to access the secure database inside the server.
  Isolate the data into the different databases can reduce the risk of the
  information leak.

Application Container Isolation:
: Attackers may inject harmful code into the input query programs to attempt to
  access the system control. To avoid this, each query process is recommended to
  be isolated using the application container.

Resource Limit:
: Even attackers cannot get the permission to crack the data or the system, they
  can still inject some heavy-load programs to consume the server resources.
  Thus, limiting the memory usage and execution time of each query process is
  highly recommended.

# IANA Considerations

## application/alto-* Media Types

This document registers an additional ALTO media type, listed in [](#tbl-media-types).

| Type        | Subtype                  | Specification        |
|:------------|:-------------------------|:---------------------|
| application | alto-multipartquery+json | [](#mp-query-params) |
{: #tbl-media-types title="Additional ALTO Media Type."}

Type name:
: application

Subtype name:
: This document registers multiple subtypes, as listed in [](#tbl-media-types).

Required parameters:
: n/a

Optional parameters:
: n/a

Encoding considerations:
: Encoding considerations are identical to those specified for the
  `application/json` media type. See {{?RFC8259}}.

Security considerations:
: Security considerations related to the generation and consumption of ALTO
  Protocol messages are discussed in Section 15 of {{RFC7285}}.

Interoperability considerations:
: This document specifies formats of conforming messages and the interpretation
  thereof.

Published specification:
: This document is the specification for these media types; see
  [](#tbl-media-types) for the section documenting each media type.

Applications that use this media type:
: ALTO servers and ALTO clients either stand alone or are embedded within other
  applications.

Additional information:
: Magic number(s):
  : n/a

  File extension(s):
  : This document uses the mime type to refer to protocol messages and thus does
    not require a file extension.

  Macintosh file type code(s):
  : n/a

Person &amp; email address to contact for further information:
: See Authors' Addresses section.

Intended usage:
: COMMON

Restrictions on usage:
: n/a

Author:
: See Authors' Addresses section.

Change controller:
: Internet Engineering Task Force (mailto:iesg@ietf.org).

# Acknowledgements
