-- written by https://github.com/r3n3pde

-- Author: René Preuß
-- Website: http://renepreuss.net
 
-- Installation:
-- Go to your Teamspeak program folder -> plugins -> lua_plugin
-- Create a new folder, rename it to "TSViewer"
-- Put this init.lua file in the "TSViewer" folder
-- Adjust user config below to your needs
-- Start Teamspeak, make sure the lua plugin is enabled in options->plugins
-- Enter the plugin settings, enable the TSViewer script

-- Copyright (c) 2014 René Preuß
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
require("ts3init")
require("ts3defs")
require("ts3errors")

talking = {}

function setContains(set, key)
    return set[key] ~= nil
end

function onTalkStatusChangeEvent(serverConnectionHandlerID, status, isReceivedWhisper, clientID)
	local name = ts3.getClientVariableAsString(serverConnectionHandlerID, clientID, ts3defs.ClientProperties.CLIENT_NICKNAME)
	local channelID = ts3.getChannelOfClient(serverConnectionHandlerID, clientID)
	local clientList = ts3.getChannelClientList(serverConnectionHandlerID, channelID)
	local file = io.open(os.getenv('APPDATA') .. "/TSViewer/TSViewer.txt", "w")
	
	talking[clientID] = status
		
	io.output(file)
	
	for i=1, #clientList do
		local tempClientId = clientList[i]
		local tempClientName = ts3.getClientVariableAsString(serverConnectionHandlerID, tempClientId, ts3defs.ClientProperties.CLIENT_NICKNAME)
		local tempClientTalking = 0
		
		if setContains(talking, tempClientId) then
			tempClientTalking = talking[tempClientId]
		end
		
		if tempClientTalking == 1 then
			io.write("[#] " .. tempClientName .. "\n")
		else
			io.write("[  ] " .. tempClientName .. "\n")
		end
	end
	
	io.close()
end
 
local registeredEvents = {
	["onTalkStatusChangeEvent"] = onTalkStatusChangeEvent
}
ts3RegisterModule(MODULE_NAME, registeredEvents)
 
-- test
notifier = {}
notifier.test = function(serverConnectionHandlerID)
	onClientMoveEvent(serverConnectionHandlerID,23,0,1,1,"Move It.")
end
