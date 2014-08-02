module.exports = {
  id: "Competency",
  prefixes: {
    "": "http://schema.org/",
  },
  context: "TODO",
  description: "A learning competency.",
  type: 'object',
  properties: {
    name: {
      context: "name",
      description: "The name of the learning competency.",
      type: "string",
    },
    description: {
      context: "description",
      description: "A short description of the learning competency.",
      type: "string",
    },
    challenges: {
      context: "TODO",
      description: "Challenges developing this competency",
      type: "array",
      items: {
        $ref: "Challenge",
      },
    },
  },
};
