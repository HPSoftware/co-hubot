module.exports = (robot) ->

  robot.respond /co need help/i, (msg) ->
      nameTemplate = "kick_off"
      mode =
        #id: ""
        title2: "Description "
        severity2: "To get some basic information of VM"
        title3: "Syntax"
        severity3: "co basic info {name_of_VM}"
        title4: "Example"
        severity4: "co basic info ftvm"
      msgCha1 = new robot.Cha.Framework.Message nameTemplate, mode

      nameTemplate = "kick_off"
      mode =
        #id: ""
        title2: "Description "
        severity2: "To get some more information of VM like System Host Name, Cluster Name"
        title3: "Syntax"
        severity3: "co more info {name_of_VM}"
        title4: "Example"
        severity4: "co more info ftvm"
      msgCha2 = new robot.Cha.Framework.Message nameTemplate, mode

      nameTemplate = "kick_off"
      mode =
        id: "Available Commands"
        title2: "Description "
        severity2: "To get the health status of VM"
        title3: "Syntax"
        severity3: "co show health {name_of_VM}"
        title4: "Example"
        severity4: "co show health ftvm"
      msgCha3 = new robot.Cha.Framework.Message nameTemplate, mode
      msg.send msgCha1
      msg.send msgCha2
      msg.send msgCha3
      # nameTemplate = "kick_off"
      # mode =
      #   #id: ""
      #   title1: "Description "
      #   description1: "To get some basic information of VM"
      #   title2: "Description "
      #   description2: "To get some basic information of VM"
      #   title3: "Syntax"
      #   description3: "basicInfo {name_of_VM}"
      #   # title4: "Example"
      #   # severity4: "basicInfo ftvm"
      # msgCha1 = new robot.Cha.Framework.Message nameTemplate, mode
      # #msg.send msgCha
      #
      # nameTemplate = "kick_off"
      # mode =
      #   #id: ""
      #   title1: "Description "
      #   description1: "To get some more information of VM like System Host Name, Cluster Name"
      #   title2: "Description "
      #   description2: "To get some basic information of VM"
      #   title3: "Syntax"
      #   description3: "basicInfo {name_of_VM}"
      #   # title3: "Syntax"
      #   # severity3: "moreInfo {name_of_VM}"
      #   # title4: "Example"
      #   # severity4: "moreInfo ftvm"
      # msgCha2 = new robot.Cha.Framework.Message nameTemplate, mode
      # #msg.send msgCha
      #
      # nameTemplate = "kick_off"
      # mode =
      #   # id: "Available Commands"
      #   title1: "Description "
      #   description1: "To get the health status of VM"
      #   title2: "Description "
      #   description2: "To get some basic information of VM"
      #   title3: "Syntax"
      #   description3: "basicInfo {name_of_VM}"
      #   # title3: "Syntax"
      #   # severity3: "health {name_of_VM}"
      #   # title4: "Example"
      #   # severity4: "health ftvm"
      # msgCha3 = new robot.Cha.Framework.Message nameTemplate, mode
      # #msgCha = msgCha1 + msgCha2 + msgCha3
      # msg.send msgCha1
      # msg.send msgCha2
      # msg.send msgCha3
