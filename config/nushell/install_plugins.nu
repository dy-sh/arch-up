#!/usr/bin/env nu

# ----------- installing with nupm ---------------

use ~/.config/nushell/nupm/nupm/
cd ~/.config/nushell/nupm/
mkdir plugins-src
cd plugins-src


# https://github.com/FMotalleb/nu_plugin_audio_hook
if not ('nu_plugin_audio_hook' | path exists) {
  git clone https://github.com/FMotalleb/nu_plugin_audio_hook
  nupm install --path nu_plugin_audio_hook -f
}
 
# https://github.com/FMotalleb/nu_plugin_port_scan
if not ('nu_plugin_port_scan' | path exists) {
  git clone https://github.com/FMotalleb/nu_plugin_port_scan
  nupm install --path nu_plugin_port_scan -f
}

# https://github.com/FMotalleb/nu_plugin_port_list
if not ('nu_plugin_port_list' | path exists) {
  git clone https://github.com/FMotalleb/nu_plugin_port_list
  nupm install --path nu_plugin_port_list -f
}

# https://github.com/FMotalleb/nu_plugin_desktop_notifications
if not ('nu_plugin_desktop_notifications' | path exists) {
  git clone https://github.com/FMotalleb/nu_plugin_desktop_notifications
  nupm install --path nu_plugin_desktop_notifications -f
}

# https://github.com/FMotalleb/nu_plugin_clipboard
if not ('nu_plugin_clipboard' | path exists) {
  git clone https://github.com/FMotalleb/nu_plugin_clipboard
  nupm install --path nu_plugin_clipboard -f
}

# ------------- installing from source ----------------

cd ~/.config/nushell/
mkdir plugins
cd plugins

# https://github.com/fennewald/nu_plugin_net
if not ('nu_plugin_net' | path exists) {
  git clone https://github.com/fennewald/nu_plugin_net
  cd nu_plugin_net
  cargo build --release
  nu -c "register ./target/release/nu_plugin_net"
  cd ..
}



# https://github.com/Euphrasiologist/nu_plugin_plot
if not ('nu_plugin_plot' | path exists) {
  git clone https://github.com/Euphrasiologist/nu_plugin_plot
  cd nu_plugin_plot
  cargo build --release
  nu -c "register ./target/release/nu_plugin_plot"
  cd ..
}

# https://github.com/JosephTLyons/nu_plugin_units
if not ('nu_plugin_units' | path exists) {
  git clone https://github.com/JosephTLyons/nu_plugin_units
  cd nu_plugin_units
  cargo build --release
  nu -c "register ./target/release/nu_plugin_units"
  cd ..
}


# https://github.com/fdncred/nu_plugin_regex
# FAILED TO COMPILE !
# to compile it, open Cargo.toml and remove path from dependencies
# if not ('nu_plugin_regex' | path exists) {
#   git clone https://github.com/fdncred/nu_plugin_regex
#   cd nu_plugin_regex
#   cargo build --release
#   nu -c "register ./target/release/nu_plugin_regex"
# }


# https://github.com/cptpiepmatz/nu-plugin-highlight
# FAILED TO COMPILE !
# to compile it, open Cargo.toml and remove path from dependencies
# if not ('nu-plugin-highlight' | path exists) {
#   git clone https://github.com/cptpiepmatz/nu-plugin-highlight
#   cd nu-plugin-highlight
#   cargo build --release
#   nu -c "register ./target/release/nu_plugin_highlight"
#   cd ..
# }

# https://github.com/fdncred/nu_plugin_emoji
# FAILED TO COMPILE !
# to compile it, open Cargo.toml and remove path from dependencies
# if not ('nu_plugin_emoji' | path exists) {
#   git clone https://github.com/fdncred/nu_plugin_emoji
#   cd nu_plugin_emoji
#   cargo build --release
#   nu -c "register ./target/release/nu_plugin_emoji"
# }


# ------ FAILDED TO INSTALL --------


# https://github.com/Trivernis/nu-plugin-dialog
# FAILED TO REGISTER !
# if not ('nu-plugin-dialog' | path exists) {
#   git clone https://github.com/Trivernis/nu-plugin-dialog
#   cd nu-plugin-dialog
#   cargo build --release
#   nu -c "register ./target/release/nu_plugin_dialog"
#   cd ..
# }





