-- copyringt Dmitry Savosh (d.savosh@gmail.com)

--[[
    Add bindings to input.conf :
    Alt+1 script-message-to move_to_subdir move-file 1
    Alt+2 script-message-to move_to_subdir move-file 2
    Alt+3 script-message-to move_to_subdir move-file 3
    Alt+4 script-message-to move_to_subdir move-file 4
    Alt+5 script-message-to move_to_subdir move-file 5
]]--


utils = require "mp.utils"

movings = {}


function file_exists(name)
    local f = io.open(name, "r")

    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end


function move_file(path, subdir)
    if file_exists(path) then
        local dir, filename = utils.split_path(path)
        dir = dir..""..subdir

        if not utils.file_info(dir) then
            os.execute("mkdir '"..dir.."'")
            print("created folder '"..dir.."'")
        end

        local new_path = utils.join_path(dir, filename)

        if path:lower() ~= new_path:lower() then
            os.rename(path, new_path)
        end
    end
end


function move_all_files()
    for path, mov in pairs(movings) do
        move_file(path, mov)
    end
    movings = {}
end

mp.register_event("shutdown", function ()
    move_all_files()
end)

mp.register_event("end-file", function()
    move_all_files()
end)

mp.register_script_message("move-file", function (mov)
    local path = mp.get_property("path")

    if file_exists(path) then        
        --move_file(path, mov) -- dont move while file is playing
        movings[path] = mov
        mp.command('show-text "Move file to ' .. mov .. '"')
    end
end)
