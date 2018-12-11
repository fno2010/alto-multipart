# Introduction

<!-- ## Background -->

Application-Layer Traffic Optimization (ALTO) protocol {{RFC7285}} and its
extensions already define several types of information resources, like Network
Map, Cost Map and Property Map, to expose useful network informations to
applications. However, many applications do not only use a single information
resource to perform their traffic optimization. Retrieving multiple ALTO
information resources is very common in many ALTO use cases.

Using the current ALTO framework defined in {{RFC7285}}, the ALTO client can
only query multiple ALTO information resources one by one. It is not only
inefficient but also error-prone. Because of the network delay between different
requests and the frequent change of ALTO information resources, the responses
received by the ALTO client may be inconsistent.

Further more, some ALTO information resources have known dependencies, which
means the ALTO client may need one's response to decide another one's query
input parameters.

To be summarized, we need the multipart query service for three reasons:

- Clients may want to query multiple ALTO information resources in a single
  request to reduce the time consumption.
- Clients may want to query multiple ALTO resources consistently, which means
  the server should guarantee the responses of all resources are generated at
  the same time.
- Some use cases need to query multiple ALTO resources with a joint relationship.

This document defines a new ALTO services for: (1) querying multiple ALTO resources
in a single request/response, and (2) supporting general-purpose JSON query
languages to resolve the relational query.

