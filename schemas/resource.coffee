module.exports =
  id: "Resource"
  prefixes:
    "": "http://schema.org/"
  context: "TODO"
  description: "A learning resource."
  type: 'object'
  properties:
    name:
      context: "name"
      description: "The name of the learning resource."
      type: "string"
    description:
      context: "description"
      description: "A short description of the learning resource."
      type: "string"
    url:
      context: "url"
      description: "Url of the learning resource"
      type: "string"
    version:
      context: "TODO"
      description: "The semantic version of the learning resource."
      type: "string"
      pattern: /TODO/
    concepts:
      context: "TODO"
      description: "Concepts taught by this resource."
      type: "array"
      items:
        reverse: "resources"
        $ref: "Concept"
