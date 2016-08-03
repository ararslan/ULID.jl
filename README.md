# ULID.jl

This package provides the ability to generate Alizain Feerasta's Universally Unique Lexicographically
Sortable Identifiers (ULID) in Julia.
It's based on the original MIT-licensed [JavaScript implementation](https://github.com/alizain/ulid).
More information about ULIDs is available in the linked repository.

## Functions

One function is exported: `ulid`.
Calling `ulid()` will generate a random 26-character ULID as a `String`.
