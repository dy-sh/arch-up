#!/usr/bin/env nu

cd ~/.config/nushell/

if not ('nupm' | path exists) {
  git clone https://github.com/nushell/nupm
}
