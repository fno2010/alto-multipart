# Introduction

## Background

Application-Layer Traffic Optimization (ALTO) protocol {{RFC7285}} and its
extensions already define several kinds of information resources, like network
map, cost map, property map, to expose useful network informations to
applications. However, many applications cannot only use a single information
resource to achieve their optimization goal. Retrieving multiple ALTO
information resources is very common in many ALTO use cases.

Although the ALTO client can query multiple ALTO information resources one by
one, it is not inefficient. And because the network delay between different
requests and the frequent change of ALTO information resources, the responses
may be inconsistent.

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
- Some use cases may need the server generates "anonymous" ALTO resources for
  the on-demand information. The "anonymous" ALTO resources usually cannot
  appear alone but need to bind with some "non-anonymous" ALTO resources.

This document defines a new ALTO services for: (1) querying multiple ALTO resources
in a single request/response, and (2) supporting general-purpose JSON query
languages to resolve the relational query.

## Requirements Language

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD",
"SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be
interpreted as described in {{RFC2119}}.
