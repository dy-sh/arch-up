# Copyright 2023 Dmitry Savosh

# keys:
# https://lazka.github.io/pgi-docs/Gdk-3.0/constants.html


from gi.repository import Gdk

from quodlibet import _
from quodlibet import app
from quodlibet.plugins.events import EventPlugin
from quodlibet.qltk import Icons


class KeyboardControlPlugin(EventPlugin):
    PLUGIN_ID = "KeyboardControl"
    PLUGIN_NAME = _("KeyboardControl")
    PLUGIN_DESC = _("Plugin for controlling quod libet with keybord.")
    PLUGIN_ICON = Icons.EDIT

    def enabled(self):
        window = app.window

        def on_key_press(widget, event):
            if event.keyval == Gdk.KEY_F2: # if event.keyval in (Gdk.KEY_Alt_L, Gdk.KEY_Alt_R)
                position = app.player.get_position()
                isSeekable = app.player.seekable
                if isSeekable:
                    app.player.seek(position-10000)
            if event.keyval == Gdk.KEY_F4: 
                position = app.player.get_position()
                isSeekable = app.player.seekable
                if isSeekable:
                    app.player.seek(position+30000)
            if event.keyval == Gdk.KEY_F3: 
                app.player.playpause()            
            if event.keyval == Gdk.KEY_F7: 
                self.change_rating(0.8)
                app.player.next()  
                app.player.seek(45000)   
            if event.keyval == Gdk.KEY_F8: 
                self.change_rating(0.6)
                app.player.next()  
                app.player.seek(45000)     
            if event.keyval == Gdk.KEY_F9: 
                self.change_rating(0.4)
                app.player.next()  
                app.player.seek(45000)    
            if event.keyval == Gdk.KEY_F12:
                self.change_rating(0.2)
                app.player.next()  
                app.player.seek(45000)  


        self._key_release_handler = \
            window.connect('key_release_event', on_key_press)

    def disabled(self):
        window = app.window
        window.disconnect(self._key_release_handler)
        del self._key_release_handler

    def change_rating(self, rating):
        song = app.player.song
        if not song:
            return

        song["~#rating"] = max(0.0, min(1.0, rating))
        song._needs_write = True
        app.library.changed([song])