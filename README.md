[![Discord](https://discordapp.com/api/guilds/373468864098336768/embed.png)](https://ghostzero.me/discord)

TS3Viewer
=========

This is a tool made for streamers who want to display their TeamSpeak Cannel-Clients on their stream.

Current Version: 1.0 Beta

## Install the Plugin on TeamSpeak:

* Go to your Teamspeak program folder -> `plugins` -> `lua_plugin`
* Create a new folder, rename it to `TSViewer`
* Put this init.lua file in the `TSViewer` folder
* Adjust user config below to your needs
* Start Teamspeak, make sure the lua plugin is enabled in options->plugins
* Enter the plugin settings, enable the TSViewer script
* Create a folder in the AppData Path called TSViewer (`%appdata%/TSViewer`)
* Run Teamspeak and Talk to Create the `%appdata%/TSViewer/TSViewer.txt` file

## Setup the Text in OBS

* Add a `Text` to the Sources
* Select `Use Text From File`
* Set the File from `%appdata%/TSViewer/TSViewer.txt`

![Screenshot 1](http://i.imgur.com/gvINkvM.png)

![Screenshot 2](http://i.imgur.com/vazXIVn.png)
