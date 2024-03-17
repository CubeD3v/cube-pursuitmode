------------------------------------------------------------------------------------------------------------------
 -- Cube Development | Container Robbery
------------------------------------------------------------------------------------------------------------------


fx_version 'cerulean'
game { 'gta5' }

version '1.0.0'
name 'cube-pursuitmode'
description 'Cube Development - FiveM Pursuit Mode'
author 'LukeeeChan'

shared_scripts {
    'config.lua'
    '@ox_lib/init.lua',
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

lua54 'yes'