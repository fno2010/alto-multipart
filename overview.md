# Overview of Approach

This document uses two key techniques to realize the general multiple resources
query:

- Use Multipart message {{?RFC2046}} to deliver compound resources.
- Accept JSON Query Language like XQuery {{W3CXQUERY}} and JSONiq {{JSONIQ}} for
  general query process and relational joint query.
