module.exports =
  id: "Prerequisite"
  anyOf: [{
    $ref: "Achievement"
  }, {
    $ref: "Resource"
  }, {
    $ref: "Challenge"
  }, {
    $ref: "Competency"
  }]
