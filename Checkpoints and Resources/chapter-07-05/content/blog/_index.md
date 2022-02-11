---
menu:
  main:
    name: Blog
    identifier: blog
    weight: 110
    post: From our editor
  footer:
    name: Blog
    weight: 100

cascade:
- _target:
    kind: page
  layout: blog
  type: modern
- _target:
    kind: section
  type: modern
  layout: list
---
The Acme Blog
============

Curated content about our teams and products.
