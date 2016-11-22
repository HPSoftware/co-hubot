module.exports = (robot) ->

  robot.respond /hello|hi|hey|ola/i, (res) ->
    res.send "Hey, what's up?"

  robot.respond /who are you/i, (res) ->
    res.reply "I am #{robot.name}. As name suggests, I work for CO product. I'll help you in solving your problem."
