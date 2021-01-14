---
docname: draft-zhang-alto-multipart-latest
title: Multiple ALTO Resources Query Using Multipart Message
abbrev: Multipart
category: std

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
    ins: J. Zhang
    name: Jingxuan Jensen Zhang
    organization: Tongji University
    email: jingxuan.n.zhang@gmail.com
    street: 4800 Cao'An Hwy
    city: Shanghai
    code: 201804
    country: China
 -
    ins:  Y. R. Yang
    name: Yang Richard Yang
    street: 51 Prospect Street
    city: New Haven
    code: CT
    country: USA
    org: Yale University
    email: yry@cs.yale.edu

normative:
  RFC2045:
  RFC2046:
  RFC2119:
  RFC2387:
  RFC7285:
  RFC7540:
  RFC8895:
informative:
  RFC8189:
  RFC8896:
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

Many ALTO use cases involve multiple ALTO information resources like different
network maps, cost maps and property maps to achieve their own specific goals.
To make the ALTO client query them one by one is not only inefficient but also
error-prone. The inconsistent responses can be performed because of the unstable
communication environment, and finally conduct the unexpected traffic
optimization. Further more, some ALTO information resources may have
correlation, which means one's input parameters may depends on another one's
response. To address those issues, some advanced query schema is required. This
document proposes an ALTO extension to support the multiple ALTO resources query
in the single request using the HTTP multipart message and the existing JSON
query languages.

--- note_Requirements_Language

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD",
"SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be
interpreted as described in {{RFC2119}}.

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
