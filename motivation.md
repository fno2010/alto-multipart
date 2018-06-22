# Use Cases

We take the following potential use cases may requiring the multipart query
service.

## Simple Batch Query

The simplest use case is to query a batch of ALTO resources in a single request.

For example, the ALTO server provides a network map resource A and a dependent
cost map resource B. Both resources may change frequently. Assume the ALTO
client queries the network map first, and it gets the revision A1. When the
client queries the cost map, the network map may be already changed from A1 to
A2, and the client receives cost map B2 which depends on A2 not A1. So the
responded cost map B2 is not consistent with the previous network map A1.

This case requires the ALTO server to provide a way for the ALTO client to query
multiple ALTO resources in a single transaction.

## Properties Constrained Query

Some clients may need to query an endpoint property map first, and find
endpoints with some properties fitting some conditions. And then they query the
endpoint cost of these endpoints.

## Path Vector Query

{{I-D.ietf-alto-path-vector}} introduce an extension of ALTO to provide path
vector information by cost map and unified property map
{{I-D.ietf-alto-unified-props-new}}. The client using path vector extension
will usually query cost map and a generated dependent property map.

# Requirements

MPQ-Req1:
: Query multiple ALTO resources in a single request, and return the result in a
  single response.

MPQ-Req2:
: Provide general filter schema for any ALTO resources.

MPQ-Req3:
: Support joint query in some relationship.
