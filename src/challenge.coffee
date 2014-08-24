module.exports =
  id: "Challenge"
  prefixes:
    "": "http://schema.org/"
  context: "TODO"
  description: "A learning challenge."
  type: 'object'
  properties:
    name:
      context: "name"
      description: "The name of the challenge."
      type: "string"
    description:
      context: "description"
      description: "A short description of the challenge."
      type: "string"
    url:
      context: "url"
      description: "Url of the challenge"
      type: "string"
    version:
      context: "TODO"
      description: "The semantic version of the challenge."
      type: "string"
      pattern: "^v?((\d+)\.(\d+)\.(\d+))(?:-([\dA-Za-z\-]+(?:\.[\dA-Za-z\-]+)*))?(?:\+([\dA-Za-z\-]+(?:\.[\dA-Za-z\-]+)*))?$"
    languages:
      context: "TODO"
      description: "The languages this challenge is available in"
      type: "array"
      items:
        context: "TODO"
        description: "language code"
        type: "string"
    competencies:
      context: "TODO"
      description: "The competencies developed by the challenge"
      type: "array"
      items:
        reverse: "challenges"
        $ref: "Competency"
    prerequisites:
      context: "TODO"
      description: "Prerequisites for the challenge"
      type: "array"
      items:
        $ref: "Prerequisite"
