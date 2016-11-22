Cha = require 'cha'

module.exports = (robot) ->
  Cha.Framework.initHubot robot
  path = require("path").join __dirname, "./config.yaml"
  Cha.Framework.init(path, robot.adapterName)
  robot.Cha = Cha
