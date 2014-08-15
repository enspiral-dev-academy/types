module.exports =
  id: "Concept"
  prefixes:
    "": "http://schema.org/"
  context: "TODO"
  description: "A single concept"
  type: 'object'
  properties:
    name:
      context: "name"
      description: "The name of the concept"
      type: "string"
    
    description:
      context: "description"
      description: "A short description of the concept."
      type: "string"
    
    resources:
      context: "TODO"
      description: "Learning resources which explain this concept"
      type: "array"
      items:
        $ref: "Resource"
