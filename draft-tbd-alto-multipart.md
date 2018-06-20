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

The ALTO server provides a network map resource A and a dependent cost map
resource B. Both resources may change frequently. If the ALTO client queries the
network map first, when it queries the cost map, the network map may change so
that the responded cost map is not consistent with the previous network map.

## Properties Constrained Query

## Path Vector Query

# Requirements

# Overview of Approach

Key techniques:

- Multipart message in HTTP/1.1 for compound resources.
- XQuery for general json process and relational joint query

# Multipart Query Service

## Media Type

`multipart/mixed` or `multipart/related`.

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
