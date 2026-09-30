fx_version 'cerulean'
game 'gta5'

description 'GTA Online Progression System'
version '1.0.0'

author 'EnderDevelopment'

dependencies {
    'es_extended',
    'ox_lib',
    'ox_inventory',
    'ox_target'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

shared_scripts {
    'config.lua'
}

files {
    'html/*.html',
    'html/*.css',
    'html/*.js'
}

ui_page 'html/index.html'