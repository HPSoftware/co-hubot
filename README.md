#Bot for HPE Cloud Optimizer (CO)

This is a project to enable CO users to connect CO to Slack. It contains the source code of a npm package for a Hubot integration. Currently, the integration covers three use cases:

1. co show health #{name_of_VM} : This command will give health status of VM you want. This will give health status, memory status, power status, cpu status, instance URL

2. co basic info #{name of VM}: This command will give basic information of VM you want. This will give memory size, CPU size and it will also show what is the current CPU Allocation and what is the recommended CPU Allocation.

3. co more info  #{name of VM}: This command will give more information about VM like cluster name, system host name.

Note: {co need help} will display all the available commands.

Note, that is an open source project. Feel free to fork, contribute or submit issues.

#Installation and configuration

Download and install node and npm on the system that should run the CO bot. (* Please install the latest version)

#Start the CO bot

If you haven’t already, add a new Hubot integration to your slack team and name it co_bot, then save the TOKEN.

In the hubot directory on the hubot system, run the following commands:

set HUBOT_SLACK_TOKEN=xoxb-…</br>

.\bin\hubot -a slack
