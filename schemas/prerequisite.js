module.exports = {
  id: "Prerequisite",
  prefixes: {
    "": "http://schema.org/",
  },
  context: "TODO",
  description: "A prerequisite",
  type: 'object',
  properties: {
    name: {
      context: "name",
      description: "The name of the prerequisite",
      type: "string",
    },
    description: {
      context: "description",
      description: "A short description of the prerequisite",
      type: "string",
    },
  },
};
