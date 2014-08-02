module.exports = {
  id: "Concept",
  prefixes: {
    "": "http://schema.org/",
  },
  context: "TODO",
  description: "A concept that can be learned.",
  type: 'object',
  properties: {
    name: {
      context: "name",
      description: "The name of the concept.",
      type: "string",
    },
    summary: {
      context: "description",
      description: "A short summary of the concept.",
      type: "string",
    },
    dependencies: {
      context: "TODO",
      description: "Prerequisite concepts for this concept.",
      type: "array",
      items: {
        $ref: "Concept",
      },
    },
    resources: {
      context: "TODO",
      description: "Resources to help learn this concept.",
      type: "array",
      items: {
        $ref: "Resource",
      },
    },
    /*
    related: {
      context: "TODO",
      description: "Concepts that are related to this concept.",
      type: "array",
      items: {
        $ref: "ConceptRelation",
      },
    },
    */
  },
};
