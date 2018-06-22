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
