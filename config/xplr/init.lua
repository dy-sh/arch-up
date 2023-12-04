version = "0.21.3"

-------------- PLUGINS ----------------------

-- plugin manager
local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

package.path = package.path .. ";" .. xpm_path .. "/?.lua;" .. xpm_path .. "/?/init.lua"

os.execute(string.format("[ -e '%s' ] || git clone '%s' '%s'", xpm_path, xpm_url, xpm_path))

require("xpm").setup({
	plugins = {
		"dtomvan/xpm.xplr", -- plugin manager
		-- "prncss-xyz/icons.xplr", -- icons
		-- "dtomvan/extra-icons.xplr", -- icons
		-- "gitlab:hartan/web-devicons.xplr", -- icons
		"sayanarijit/dua-cli.xplr", -- :D - disk usage
		"sayanarijit/fzf.xplr", -- c-f - fuzzy finder
		"sayanarijit/find.xplr", -- F - find files
		"Junker/nuke.xplr", -- Enter - open file in default app
		"dtomvan/ouch.xplr", -- :o - un/acruve file
		"sayanarijit/scp.xplr",
		"sayanarijit/xclip.xplr", -- y - copy file, p - paste
		"sayanarijit/zoxide.xplr", -- Z - zoxide
		"igorepst/context-switch.xplr", -- c-s - content swith
		"sayanarijit/map.xplr", -- M - map selected files
		"sayanarijit/registers.xplr", -- "a, "b... - put/swap selection to register
		-- 'sayanarijit/tri-pane.xplr',	-- ranger like tree
	},
	auto_install = true,
	auto_cleanup = true,
})

--------------  CONFIG ----------------------

-- enable mouse support
xplr.config.general.enable_mouse = true

--------------  KEY BINDINGS ----------------------

-- q - print pwd and quit
xplr.config.modes.builtin.default.key_bindings.on_key["q"] = {
	help = "quit",
	messages = {
		"PrintPwdAndQuit",
	},
}

-- xplr.config.modes.builtin.default.key_bindings.on_key["esc"] = {
-- 	help = "quit",
-- 	messages = {
-- 	  "PrintPwdAndQuit",
-- 	},
-- }

-- Q - quit without printing pwd
xplr.config.modes.builtin.default.key_bindings.on_key["Q"] = {
	help = "quit",
	messages = {
		"Quit",
	},
}

--------------  HACKS ----------------------

-- L - lazygit
xplr.config.modes.builtin.default.key_bindings.on_key["L"] = {
	help = "lazygit",
	messages = {
		{
			BashExec = [===[
       lazygit
     ]===],
		},
	},
}

-- N - neovim (current dir)
xplr.config.modes.builtin.default.key_bindings.on_key["N"] = {
	help = "nvim",
	messages = {
		{
			BashExec = [===[
       nvim
     ]===],
		},
	},
}

-- n - neovim (selected file)
xplr.config.modes.builtin.default.key_bindings.on_key["n"] = {
	help = "edit file in nvim",
	messages = {
		{
			BashExec = [===[
       nvim ${XPLR_FOCUS_PATH:?}
     ]===],
		},
	},
}

-- C - vscode (current dir)
xplr.config.modes.builtin.default.key_bindings.on_key["C"] = {
	help = "code",
	messages = {
		{
			BashExec = [===[
       code
     ]===],
		},
	},
}

-- c - vscode (selected file)
xplr.config.modes.builtin.default.key_bindings.on_key["c"] = {
	help = "edit file in nvim",
	messages = {
		{
			BashExec = [===[
       code ${XPLR_FOCUS_PATH:?}
     ]===],
		},
	},
}

-- E - execute in bash
xplr.config.modes.builtin.default.key_bindings.on_key["E"] = {
	help = "execute in bash",
	messages = {
		{
			BashExec = [===[
       bash ${XPLR_FOCUS_PATH:?}
       read -p "Press enter to continue"
     ]===],
		},
	},
}

-- nuke plugin
-- Junker/nuke.xplr
-- open files by their mime type
require("nuke").setup({
	pager = "more", -- default: less -R
	open = {
		run_executables = true, -- default: false
		custom = {
			-- {extension = "jpg", command = "sxiv {}"},
			-- {mime = "video/mp4", command = "mpv {}"},
			{ mime_regex = ".*", command = "xdg-open {}" },
		},
	},
	view = {
		show_line_numbers = true, -- default: false
	},
	smart_view = {
		custom = {
			{ extension = "so", command = "ldd -r {} | less" },
		},
	},
})
local key = xplr.config.modes.builtin.default.key_bindings.on_key
key.v = {
	help = "nuke",
	messages = { "PopMode", { SwitchModeCustom = "nuke" } },
}
key["f3"] = xplr.config.modes.custom.nuke.key_bindings.on_key.v
key["enter"] = xplr.config.modes.custom.nuke.key_bindings.on_key.o

-- Bookmark
-- Bookmark files using m and fuzzy search bookmarks using backtick
-- https://xplr.dev/en/awesome-hacks#bookmark
-- require:
-- pacman -S fzf

xplr.config.modes.builtin.default.key_bindings.on_key.B = {
	help = "bookmark",
	messages = {
		{
			BashExecSilently0 = [===[
        PTH="${XPLR_FOCUS_PATH:?}"
        PTH_ESC=$(printf %q "$PTH")
        if echo "${PTH:?}" >> "${XPLR_SESSION_PATH:?}/bookmarks"; then
          "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC added to bookmarks"
        else
          "$XPLR" -m 'LogError: %q' "Failed to bookmark $PTH_ESC"
        fi
      ]===],
		},
	},
}
xplr.config.modes.builtin.default.key_bindings.on_key["m"] = {
	help = "go to bookmark",
	messages = {
		{
			BashExec0 = [===[
        PTH=$(cat "${XPLR_SESSION_PATH:?}/bookmarks" | fzf --no-sort)
        PTH_ESC=$(printf %q "$PTH")
        if [ "$PTH" ]; then
          "$XPLR" -m 'FocusPath: %q' "$PTH"
        fi
      ]===],
		},
	},
}

-- Persistent, multi-session bookmark
-- A bookmark mode that allows for a bookmark file to be used throughout multiples sessions. It is set to the environment variable $XPLR_BOOKMARK_FILE. A bookmark can be added, deleted, or jumped to.
-- https://xplr.dev/en/awesome-hacks#persistent-multi-session-bookmark
-- required:
-- pacman -S sd

xplr.config.modes.builtin.default.key_bindings.on_key["b"] = {
	help = "bookmark mode",
	messages = {
		{ SwitchModeCustom = "bookmark" },
	},
}
xplr.config.modes.custom.bookmark = {
	name = "bookmark",
	key_bindings = {
		on_key = {
			m = {
				help = "bookmark dir",
				messages = {
					{
						BashExecSilently0 = [[
              PTH="${XPLR_FOCUS_PATH:?}"
              if [ -d "${PTH}" ]; then
                PTH="${PTH}"
              elif [ -f "${PTH}" ]; then
                PTH=$(dirname "${PTH}")
              fi
              PTH_ESC=$(printf %q "$PTH")
              if echo "${PTH:?}" >> "$HOME/.xplr-bookmarks"; then
                "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC added to bookmarks"
              else
                "$XPLR" -m 'LogError: %q' "Failed to bookmark $PTH_ESC"
              fi
            ]],
					},
					"PopMode",
				},
			},
			g = {
				help = "go to bookmark",
				messages = {
					{
						BashExec0 = [===[
              PTH=$(cat "$HOME/.xplr-bookmarks" | fzf --no-sort)
              if [ "$PTH" ]; then
                "$XPLR" -m 'FocusPath: %q' "$PTH"
              fi
            ]===],
					},
					"PopMode",
				},
			},
			d = {
				help = "delete bookmark",
				messages = {
					{
						BashExec0 = [[
              PTH=$(cat "$HOME/.xplr-bookmarks" | fzf --no-sort)
              sd "$PTH\n" "" "$HOME/.xplr-bookmarks"
            ]],
					},
					"PopMode",
				},
			},
			esc = {
				help = "cancel",
				messages = {
					"PopMode",
				},
			},
		},
	},
}

-- Fuzzy search history
-- Fuzzy search the last visited directories.
-- https://xplr.dev/en/awesome-hacks#fuzzy-search-history
-- require:
-- pacman -S fzf

xplr.config.modes.builtin.go_to.key_bindings.on_key.h = {
	help = "history",
	messages = {
		"PopMode",
		{
			BashExec0 = [===[
        PTH=$(cat "${XPLR_PIPE_HISTORY_OUT:?}" | sort -z -u | fzf --read0)
        if [ "$PTH" ]; then
          "$XPLR" -m 'ChangeDirectory: %q' "$PTH"
        fi
      ]===],
		},
	},
}

-- Batch rename
-- Batch rename the selected or visible files and directories in $PWD.
-- https://xplr.dev/en/awesome-hacks#batch-rename
-- require:
-- yay -S vim-renamer-git

xplr.config.modes.builtin.default.key_bindings.on_key.R = {
	help = "batch rename",
	messages = {
		{
			BashExec = [===[
       SELECTION=$(cat "${XPLR_PIPE_SELECTION_OUT:?}")
       NODES=${SELECTION:-$(cat "${XPLR_PIPE_DIRECTORY_NODES_OUT:?}")}
       if [ "$NODES" ]; then
         echo -e "$NODES" | renamer
         "$XPLR" -m ExplorePwdAsync
       fi
     ]===],
		},
	},
}

-- Serve $PWD
-- Serve $PWD using a static web server via LAN.
-- https://xplr.dev/en/awesome-hacks#serve-pwd
-- requere:
-- pacman -S fzf
-- yay -S sfz-bin

xplr.config.modes.builtin.default.key_bindings.on_key.W = {
	help = "serve $PWD in web",
	messages = {
		{
			BashExec0 = [===[
        IP=$(ip addr | grep -w inet | cut -d/ -f1 | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | fzf --prompt 'Select IP > ')
        echo "IP: ${IP:?}"
        read -p "Port (default 5000): " PORT
        echo
        sfz --all --cors --no-ignore --bind ${IP:?} --port ${PORT:-5000} . &
        sleep 1 && read -p '[press enter to exit]'
        kill -9 %1
      ]===],
		},
	},
}

--------------------- STYLE -----------------------

-- selection color
xplr.config.general.selection_ui.style = { bg = "Magenta", fg = "Black" }
xplr.config.general.focus_selection_ui.style = { bg = "Magenta", fg = "LightYellow" }
xplr.config.general.focus_ui.style = { fg = "LightYellow" }

-- icons
xplr.config.node_types.directory.meta.icon = " "
-- xplr.config.node_types.directory.meta.icon = "📁"
xplr.config.node_types.directory.style = { fg = { Rgb = { 164, 189, 239 } } }
xplr.config.node_types.file.meta.icon = " "
-- xplr.config.node_types.mime_essence = {
-- 	["text"] = {
-- 		["plain"] = {
-- 			meta = { icon = "📄" },
-- 		},
-- 	},
-- }

xplr.config.node_types.extension = {
	xml = { meta = { icon = "󰗀 " } },
	conf = { meta = { icon = " " } },
	sh = { meta = { icon = " " } },
	md = { meta = { icon = " " } },
	doc = { meta = { icon = " " } },
	iso = { meta = { icon = " " } },
	key = { meta = { icon = " " } },
	txt = { meta = { icon = " " } },
	cmake = { meta = { icon = " " } },
	ninja = { meta = { icon = "󰝴 " } },
	c = { meta = { icon = " " } },
	cpp = { meta = { icon = " " } },
	h = { meta = { icon = " " } },
	png = { meta = { icon = " " } },
	bmp = { meta = { icon = " " } },
	jpg = { meta = { icon = " " } },
	jpeg = { meta = { icon = " " } },
	svg = { meta = { icon = " " } },
	gif = { meta = { icon = " " } },
	tiff = { meta = { icon = " " } },
	psd = { meta = { icon = " " } },
	pdf = { meta = { icon = " " } },
	so = { meta = { icon = " " } },
	bin = { meta = { icon = " " } },
	json = { meta = { icon = " " } },
	js = { meta = { icon = " " } },
	bat = { meta = { icon = " " } },
	cs = { meta = { icon = "󰌛 " } },
	csv = { meta = { icon = " " } },
	dll = { meta = { icon = " " } },
	exe = { meta = { icon = " " } },
	gz = { meta = { icon = " " } },
	ini = { meta = { icon = " " } },
	py = { meta = { icon = " " } },
	rar = { meta = { icon = " " } },
	yaml = { meta = { icon = " " } },
	zip = { meta = { icon = " " } },
	tar = { meta = { icon = " " } },
	xz = { meta = { icon = " " } },
	bz2 = { meta = { icon = " " } },
	lhz = { meta = { icon = " " } },
	z = { meta = { icon = " " } },
	pem = { meta = { icon = " " } },
	qcow2 = { meta = { icon = " " } },
	avi = { meta = { icon = " " } },
	mp4 = { meta = { icon = " " } },
	mkv = { meta = { icon = " " } },
	mov = { meta = { icon = " " } },
	wmv = { meta = { icon = " " } },
	flv = { meta = { icon = " " } },
	webm = { meta = { icon = " " } },
	mpg = { meta = { icon = " " } },
	mpeg = { meta = { icon = " " } },
	srt = { meta = { icon = "󰨖 " } },
	mp3 = { meta = { icon = " " } },
	wav = { meta = { icon = " " } },
	ogg = { meta = { icon = " " } },
	flac = { meta = { icon = " " } },
	aac = { meta = { icon = " " } },
	m4a = { meta = { icon = " " } },
	wma = { meta = { icon = " " } },
	ape = { meta = { icon = " " } },
	au = { meta = { icon = " " } },
	aif = { meta = { icon = " " } },
	apk = { meta = { icon = " " } },
	css = { meta = { icon = " " } },
	db = { meta = { icon = " " } },
	deb = { meta = { icon = " " } },
	docx = { meta = { icon = " " } },
	html = { meta = { icon = " " } },
	java = { meta = { icon = " " } },
	log = { meta = { icon = " " } },
	rpm = { meta = { icon = " " } },
	rtf = { meta = { icon = " " } },
	sql = { meta = { icon = " " } },
	dart = { meta = { icon = " " } },
	desktop = { meta = { icon = "desktop" } },
	ejs = { meta = { icon = " " } },
	go = { meta = { icon = " " } },
	jar = { meta = { icon = " " } },
	jsx = { meta = { icon = " " } },
	rb = { meta = { icon = " " } },
	scss = { meta = { icon = " " } },
	service = { meta = { icon = " " } },
	ts = { meta = { icon = " " } },
	tsx = { meta = { icon = " " } },
	vue = { meta = { icon = "󰡄 " } },
	yml = { meta = { icon = " " } },
	lua = { meta = { icon = " " } },
}

------------ FIX FOR SELECTED FILES COLOR ----------------
-- https://github.com/sayanarijit/xplr/issues/651
-- https://github.com/sayanarijit/xplr/pull/656

xplr.fn.builtin.fmt_general_table_row_cols_1 = function(m)
	local nl = xplr.util.paint("\\n", { add_modifiers = { "Italic", "Dim" } })
	local r = m.tree .. m.prefix

	-- start of edited part

	local style = m.style
	-- local style = xplr.util.lscolor(m.absolute_path)
	-- style = xplr.util.style_mix({ style, m.style })

	-- end of edited part

	if m.meta.icon == nil then
		r = r .. ""
	else
		r = r .. m.meta.icon .. " "
	end

	local rel = m.relative_path
	if m.is_dir then
		rel = rel .. "/"
	end
	r = r .. xplr.util.paint(xplr.util.shell_escape(rel), style)

	r = r .. m.suffix .. " "

	if m.is_symlink then
		r = r .. "-> "

		if m.is_broken then
			r = r .. "×"
		else
			local symlink_path = xplr.util.shorten(m.symlink.absolute_path, { base = m.parent })
			if m.symlink.is_dir then
				symlink_path = symlink_path .. "/"
			end
			r = r .. symlink_path:gsub("\n", nl)
		end
	end

	return r
end
