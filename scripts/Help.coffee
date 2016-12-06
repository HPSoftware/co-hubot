module.exports = (robot) ->

  robot.respond /co help/i, (msg) ->
      nameTemplate = "kick_off"
      mode =
        #id: ""
        title2: "Description "
        severity2: "To get basic information about the VM"
        title3: "Syntax"
        severity3: "co showinfo {name_of_VM}"
        title4: "Example"
        severity4: "co showinfo ftvm"
      msgCha1 = new robot.Cha.Framework.Message nameTemplate, mode

      nameTemplate = "kick_off"
      mode =
        #id: ""
        title2: "Description "
        severity2: "To get location information of the VM like System Host Name, Cluster Name"
        title3: "Syntax"
        severity3: "co showlocation {name_of_VM}"
        title4: "Example"
        severity4: "co showlocation ftvm"
      msgCha2 = new robot.Cha.Framework.Message nameTemplate, mode

      nameTemplate = "kick_off"
      mode =
        id: "Available Commands"
        title2: "Description "
        severity2: "To get the health status of the VM"
        title3: "Syntax"
        severity3: "co showhealth {name_of_VM}"
        title4: "Example"
        severity4: "co showhealth ftvm"
      msgCha3 = new robot.Cha.Framework.Message nameTemplate, mode
      msg.send msgCha1
      msg.send msgCha2
      msg.send msgCha3
