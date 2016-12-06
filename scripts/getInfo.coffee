module.exports = (robot) ->
#First part will give some basic information of VM like Instance Resource Path, BootTime ,CPU Size, etc

   # ------------ DEPENDENCIES ------------ */
   config = require('../co-conf.json')

    # ------------ CONFIGURATION ------------ */
   COLogin           = config.COLogin
   COPassword        = config.COPassword
   COHost            = config.COHost
   COPort            = config.COPort
   COContextRoot     = config.COContextRoot
   COProtocol        = config.COProtocol
   rejectUnauthorized = config.rejectUnauthorized
   configTargetServer = COProtocol + "://" + COHost + ":" + COPort + "/PV/api/v1/" ;

   robot.hear /co showinfo (.*)/i, (msg) ->
      search = msg.match[1]
      process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
      msg.http(configTargetServer +  "vm/?name=#{search}")
        .get() (err, res, body) ->
          try
            data = JSON.parse(body)
            nameTemplate = "kick_off"
            mode =
              id: "Basic Information of " + search
              title1: "Memory Size"
              severity1: data.instances[0].MemSize
              title2: "CPU Size"
              severity2: data.instances[0].CPUSize
              title3: "Current CPU Allocation"
              severity3: data.instances[0].sizing.NumCpu
              title4: "Recommended CPU Allocation"
              severity4: data.instances[0].sizing.RecommendedNumCPU
            msgCha = new robot.Cha.Framework.Message nameTemplate, mode
            msg.send msgCha

          catch error
              msg.send "Error:" + error



#More Info like SystemHostName and CLusterName
    robot.hear /co showlocation (.*)/i, (msg) ->
      search = msg.match[1]
      process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
      msg.http(configTargetServer +  "vm/?name=#{search}")
        .get() (err, res, body) ->
          try
            data = JSON.parse(body)
            str = "Cluster Name : " + data.instances[0].properties.ClusterName
            str1 = "System Host Name: " + data.instances[0].properties.SystemHostName
            msg.send str1
            msg.send str
          catch error
            msg.send "Error:" + error


# Health Status of VM
    robot.hear /co showhealth (.*)/i, (msg) ->
      process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
      name = msg.match[1]
      data = JSON.stringify ({
        "servers": [
           {
             "identifier": {
               "name": "SystemName",
               "value": name
               }
           }
         ]
      }
      )
      robot.http(configTargetServer + "vmstatus")
      .header('Content-Type', 'application/json')
      .post(data) (err, res, body) ->
        result = JSON.parse(body)
        nameTemplate = "kick_off_warroom"
        mode =
          id: name
          title1: "Health Status"
          severity1: result.servers[0].healthStatus
          title2: "Memory Status"
          severity2: result.servers[0].memoryStatus
          title3: "Power Status"
          severity3: result.servers[0].powerStatus
          title4: "CPU Status"
          severity4: result.servers[0].cpuStatus
          title5: "InstanceURL :" + COProtocol + "://" + COHost + ":" + COPort + "/" +  result.servers[0].instanceURL
          
        msgCha = new robot.Cha.Framework.Message nameTemplate, mode
        msg.send msgCha
