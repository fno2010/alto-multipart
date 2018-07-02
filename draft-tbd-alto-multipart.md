---
docname: draft-tbd-alto-multipart-latest
title: Multiple ALTO Resources Query Using Multipart Message
abbrev: Multipart
category: exp

ipr: trust200902
area: Networks
workgroup: ALTO WG
keyword: ALTO, Internet-Draft

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
  RFC2387:
  RFC7285:
informative:
  RFC8189:
  I-D.ietf-alto-path-vector:
  I-D.ietf-alto-unified-props-new:
  I-D.ietf-alto-cost-calendar:
  I-D.ietf-alto-incr-update-sse:
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
  JSONIQ:
    title: "JSONiq - the SQL of NoSQL 1.0"
    author:
      -
        ins: J. Robie
        name: Jonathan Robie
      -
        ins: G. Fourny
        name: Ghislain Fourny
      -
        ins: M. Brantner
        name: Matthias Brantner
      -
        ins: D. Florescu
        name: Daniela Florescu
      -
        ins: T. Westmann
        name: Till Westmann
      -
        ins: M. Zaharioudakis
        name: Markos Zaharioudakis
    date: 2015
    seriesinfo:
      JSONiq:

--- abstract

Many ALTO use cases involve multiple ALTO information resources like network
map, cost map and property map to achieve their own goal. To make the ALTO
client query them one by one is not only inefficient but also possible to
introduce inconsistent issues. Further more, some ALTO information resources may
have correlation, which means one's input parameters may depends on another
one's response. So some advanced query schema is required. This document
proposes an extension to support the multiple ALTO resources query with HTTP
multipart message and the existing JSON query languages.

--- middle

{::include introduction.md}

{::include term.md}

{::include motivation.md}

{::include overview.md}

{::include specification.md}

{::include examples.md}

{::include others.md}

--- back

{::include appendix.md}
