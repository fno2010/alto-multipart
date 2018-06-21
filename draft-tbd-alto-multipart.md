---
docname: draft-tbd-alto-multipart-latest
title: Multiple ALTO Resources Query Using Multipart Message
abbrev: Multipart
category: exp

ipr: trust200902
area: General
workgroup: ALTO
keyword: Internet-Draft

stand_alone: yes
pi:
  strict: yes
  comments: yes
  inline: yes
  editing: no
  toc: yes
  tocompact: yes
  tocdepth: 3
  iprnotified: no
  sortrefs: yes
  symrefs: yes
  compact: yes
  subcompact: no

author:
 -
    ins: S. D. Chen
    name: Shiwei Dawn Chen
    organization: Tongji University
    email: dawn_chen_f@hotmail.com
    street: 4800 Cao'An Hwy
    city: Shanghai
    code: 201804
    country: China
 -
    ins: J. Zhang
    name: Jingxuan Jensen Zhang
    organization: Tongji University
    email: jingxuan.zhang@tongji.edu.cn
    street: 4800 Cao'An Hwy
    city: Shanghai
    code: 201804
    country: China

normative:
  RFC2119:
informative:
  RFC2387:
  RFC7285:
  I-D.ietf-alto-path-vector:
  I-D.ietf-alto-unified-props-new:
  W3CXQUERY:
    title: "XQuery 3.0: An XML query language"
    author:
      -
        ins: J. Robie
        name: Jonathan Robie
      -
        ins: D. Chamberlin
        name: Don Chamberlin
      -
        ins: M. Dyck
        name: Michael Dyck
      -
        ins: J. Snelson
        name: John Snelson
    date: 2014
    seriesinfo:
      W3C: Recommendation, W3C

--- abstract

An extension to support the multiple ALTO resources query.

--- middle

# Introduction

This document defines a new ALTO services for querying multiple ALTO resources
in a single request.

## Background

We need the multipart query service for three reasons:

- Clients may want to query multiple ALTO resources consistently, which means
  the server should guarantee the responses of all resources are generated at
  the same time.
- Some use cases need to query multiple ALTO resources with a joint relationship.
- Some use cases may need the server generates "anonymous" ALTO resources for
  the on-demand information. The "anonymous" ALTO resources usually cannot
  appear alone but need to bind with some "non-anonymous" ALTO resources.

## Terminologies

TBD.

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

# Overview of Approach

Key techniques:

- Multipart message {{?RFC2046}} for compound resources.
- XQuery {{W3CXQUERY}} for general query process and relational joint query

# Multipart Query Service

## Media Type

`multipart/mixed` {{RFC2046}} or `multipart/related` {{?RFC2387}}.

## HTTP Method

POST

## Accept Input Parameters {#mp-query-params}

`application/alto-multipartquery+json`.

## Capabilities

## Uses

Any available ALTO resources rather than the multipart query service resource.

## Response

# Examples

# Compatibility

# Misc Considerations

## Support Incremental Update

## Anonymous Resources

# Security Considerations

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
  `application/json` media type. See {{?RFC7159}}.

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

--- back
