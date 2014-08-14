module.exports =
  id: "Achievement"
  prefixes:
    "": "http://schema.org/"
  context: "TODO"
  description: "A recognition of achievement"
  type: 'object'
  properties:
    name:
      context: "name"
      description: "The name of the achievement."
      type: "string"
    description:
      context: "description"
      description: "A short description of the challenge."
      type: "string"
    badge:
      context: "image"
      description: "The badge for this achievment"
      type: "string"
    prerequisites:
      context: "TODO"
      description: "Prerequisites that make up this achievement"
      type: "array"
      items:
        $ref: "Prerequisite"
