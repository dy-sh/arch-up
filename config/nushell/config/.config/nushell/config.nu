# Nushell Config File
#
# version = "0.88.0"

# For more information on defining custom themes, see
# https://www.nushell.sh/book/coloring_and_theming.html
# And here is the theme collection
# https://github.com/nushell/nu_scripts/tree/main/themes
let dark_theme = {
    # color for nushell primitives
    separator: white
    leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
    header: green_bold
    empty: blue
    # Closures can be used to choose colors for specific values.
    # The value (in this case, a bool) is piped into the closure.
    # eg) {|| if $in { 'light_cyan' } else { 'light_gray' } }
    bool: light_cyan
    int: white
    filesize: cyan
    duration: white
    date: purple
    range: white
    float: white
    string: white
    nothing: white
    binary: white
    cell-path: white
    row_index: green_bold
    record: white
    list: white
    block: white
    hints: dark_gray
    search_result: {bg: red fg: white}
    shape_and: purple_bold
    shape_binary: purple_bold
    shape_block: blue_bold
    shape_bool: light_cyan
    shape_closure: green_bold
    shape_custom: green
    shape_datetime: cyan_bold
    shape_directory: cyan
    shape_external: cyan
    shape_externalarg: green_bold
    shape_external_resolved: light_yellow_bold
    shape_filepath: cyan
    shape_flag: blue_bold
    shape_float: purple_bold
    # shapes are used to change the cli syntax highlighting
    shape_garbage: { fg: white bg: red attr: b}
    shape_globpattern: cyan_bold
    shape_int: purple_bold
    shape_internalcall: cyan_bold
    shape_keyword: cyan_bold
    shape_list: cyan_bold
    shape_literal: blue
    shape_match_pattern: green
    shape_matching_brackets: { attr: u }
    shape_nothing: light_cyan
    shape_operator: yellow
    shape_or: purple_bold
    shape_pipe: purple_bold
    shape_range: yellow_bold
    shape_record: cyan_bold
    shape_redirection: purple_bold
    shape_signature: green_bold
    shape_string: green
    shape_string_interpolation: cyan_bold
    shape_table: blue_bold
    shape_variable: purple
    shape_vardecl: purple
}

let light_theme = {
    # color for nushell primitives
    separator: dark_gray
    leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
    header: green_bold
    empty: blue
    # Closures can be used to choose colors for specific values.
    # The value (in this case, a bool) is piped into the closure.
    # eg) {|| if $in { 'dark_cyan' } else { 'dark_gray' } }
    bool: dark_cyan
    int: dark_gray
    filesize: cyan_bold
    duration: dark_gray
    date: purple
    range: dark_gray
    float: dark_gray
    string: dark_gray
    nothing: dark_gray
    binary: dark_gray
    cell-path: dark_gray
    row_index: green_bold
    record: dark_gray
    list: dark_gray
    block: dark_gray
    hints: dark_gray
    search_result: {fg: white bg: red}
    shape_and: purple_bold
    shape_binary: purple_bold
    shape_block: blue_bold
    shape_bool: light_cyan
    shape_closure: green_bold
    shape_custom: green
    shape_datetime: cyan_bold
    shape_directory: cyan
    shape_external: cyan
    shape_externalarg: green_bold
    shape_external_resolved: light_purple_bold
    shape_filepath: cyan
    shape_flag: blue_bold
    shape_float: purple_bold
    # shapes are used to change the cli syntax highlighting
    shape_garbage: { fg: white bg: red attr: b}
    shape_globpattern: cyan_bold
    shape_int: purple_bold
    shape_internalcall: cyan_bold
    shape_keyword: cyan_bold
    shape_list: cyan_bold
    shape_literal: blue
    shape_match_pattern: green
    shape_matching_brackets: { attr: u }
    shape_nothing: light_cyan
    shape_operator: yellow
    shape_or: purple_bold
    shape_pipe: purple_bold
    shape_range: yellow_bold
    shape_record: cyan_bold
    shape_redirection: purple_bold
    shape_signature: green_bold
    shape_string: green
    shape_string_interpolation: cyan_bold
    shape_table: blue_bold
    shape_variable: purple
    shape_vardecl: purple
}


# --------------- COMPLETERS ----------------


let fish_completer = {|spans|
    fish --command $'complete "--do-complete=($spans | str join " ")"'
    | $"value(char tab)description(char newline)" + $in
    | from tsv --flexible --no-infer
}

let zoxide_completer = {|spans|
    $spans | skip 1 | zoxide query -l $in | lines | where {|x| $x != $env.PWD}
}


let carapace_completer = {|spans: list<string>|
    carapace $spans.0 nushell $spans
    | from json
    | if ($in | default [] | where value =~ '^-.*ERR$' | is-empty) { $in } else { null }
}


# This completer will use carapace by default
let external_completer = {|spans|

     # if the current command is an alias, get it's expansion
    let expanded_alias = (scope aliases | where name == $spans.0 | get -i 0 | get -i expansion)

    # overwrite
    let spans = (if $expanded_alias != null  {
        # put the first word of the expanded alias first in the span
        $spans | skip 1 | prepend ($expanded_alias | split row " ")
    } else { $spans })



    match $spans.0 {
        nu => $fish_completer
        git => $fish_completer
        z => $zoxide_completer
        zi => $zoxide_completer
        _ => $carapace_completer
    } | do $in $spans
}


# -------------------- GLOBAL CONFIGURATION ----------------

# The default config record. This is where much of your global configuration is setup.
$env.config = {
    show_banner: false # true or false to enable or disable the welcome banner at startup

    ls: {
        use_ls_colors: true # use the LS_COLORS environment variable to colorize output
        clickable_links: true # enable or disable clickable links. Your terminal has to support links.
    }

    rm: {
        always_trash: true # always act as if -t was given. Can be overridden with -p
    }

    table: {
        mode: rounded # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
        index_mode: always # "always" show indexes, "never" show indexes, "auto" = show indexes when a table has "index" column
        show_empty: true # show 'empty list' and 'empty record' placeholders for command output
        padding: { left: 1, right: 1 } # a left right padding of each column in a table
        trim: {
            methodology: wrapping # wrapping or truncating
            wrapping_try_keep_words: true # A strategy used by the 'wrapping' methodology
            truncating_suffix: "..." # A suffix used by the 'truncating' methodology
        }
        header_on_separator: false # show header text on separator/border line
        # abbreviated_row_count: 10 # limit data rows from top and bottom after reaching a set point
    }

    error_style: "fancy" # "fancy" or "plain" for screen reader-friendly error messages

    # datetime_format determines what a datetime rendered in the shell would look like.
    # Behavior without this configuration point will be to "humanize" the datetime display,
    # showing something like "a day ago."
    datetime_format: {
        # normal: '%a, %d %b %Y %H:%M:%S %z'    # shows up in displays of variables or other datetime's outside of tables
        # table: '%m/%d/%y %I:%M:%S%p'          # generally shows up in tabular outputs such as ls. commenting this out will change it to the default human readable datetime format
    }

    explore: {
        status_bar_background: {fg: "#1D1F21", bg: "#C4C9C6"},
        command_bar_text: {fg: "#C4C9C6"},
        highlight: {fg: "black", bg: "yellow"},
        status: {
            error: {fg: "white", bg: "red"},
            warn: {}
            info: {}
        },
        table: {
            split_line: {fg: "#404040"},
            selected_cell: {bg: light_blue},
            selected_row: {},
            selected_column: {},
        },
    }

    history: {
        max_size: 100_000 # Session has to be reloaded for this to take effect
        sync_on_enter: true # Enable to share history between multiple sessions, else you have to close the session to write history to file
        file_format: "plaintext" # "sqlite" or "plaintext"
        isolation: false # only available with sqlite file_format. true enables history isolation, false disables it. true will allow the history to be isolated to the current session using up/down arrows. false will allow the history to be shared across all sessions.
    }

    completions: {
        case_sensitive: false # set to true to enable case-sensitive completions
        quick: true    # set this to false to prevent auto-selecting completions when only one remains
        partial: true    # set this to false to prevent partial filling of the prompt
        algorithm: "fuzzy"    # prefix or fuzzy
        external: {
            enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up may be very slow
            max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
            completer: $external_completer # check 'carapace_completer' above as an example
        }
    }

    filesize: {
        metric: false # true => KB, MB, GB (ISO standard), false => KiB, MiB, GiB (Windows standard)
        format: "auto" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, auto
    }

    cursor_shape: {
        emacs: line # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (line is the default)
        vi_insert: block # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (block is the default)
        vi_normal: underscore # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (underscore is the default)
    }

    color_config: $dark_theme # if you want a more interesting theme, you can replace the empty record with `$dark_theme`, `$light_theme` or another custom record
    use_grid_icons: true
    footer_mode: "25" # always, never, number_of_rows, auto
    float_precision: 2 # the precision for displaying floats in tables
    buffer_editor: "" # command that will be used to edit the current line buffer with ctrl+o, if unset fallback to $env.EDITOR and $env.VISUAL
    use_ansi_coloring: true
    bracketed_paste: true # enable bracketed paste, currently useless on windows
    edit_mode: emacs # emacs, vi
    shell_integration: false # enables terminal shell integration. Off by default, as some terminals have issues with this.
    render_right_prompt_on_last_line: false # true or false to enable or disable right prompt to be rendered on last line of the prompt.
    use_kitty_protocol: false # enables keyboard enhancement protocol implemented by kitty console, only if your terminal support this.
    highlight_resolved_externals: true # true enables highlighting of external commands in the repl resolved by which.

    hooks: {
        pre_prompt: [{ null }] # run before the prompt is shown
        pre_execution: [{ null }] # run before the repl input is run
        env_change: {
            PWD: [{|before, after| null }] # run if the PWD environment is different since the last repl input
        }
        display_output: "if (term size).columns >= 100 { table -e } else { table }" # run to display the output of a pipeline
        command_not_found: { null } # return an error message when a command is not found
    }

    menus: [
        # Configuration for default nushell menus
        # Note the lack of source parameter
        {
            name: completion_menu
            only_buffer_difference: false
            marker: "| "
            type: {
                layout: columnar
                columns: 4
                col_width: 20     # Optional value. If missing all the screen width is used to calculate column width
                col_padding: 2
            }
            style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
            }
        }
        {
            name: history_menu
            only_buffer_difference: true
            marker: "? "
            type: {
                layout: list
                page_size: 10
            }
            style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
            }
        }
        {
            name: help_menu
            only_buffer_difference: true
            marker: "? "
            type: {
                layout: description
                columns: 4
                col_width: 20     # Optional value. If missing all the screen width is used to calculate column width
                col_padding: 2
                selection_rows: 4
                description_rows: 10
            }
            style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
            }
        }
    ]

    keybindings: [
        {
            name: custom_add_sudo
            modifier: alt
            keycode: char_s
            mode: emacs
            event:[
                {
                  send: executehostcommand
                  cmd: 'commandline -c 0; commandline -i "sudo "; commandline -e'
                }
            ]
        }
        {
            name: custom_alt_enter_broot
            modifier: alt
            keycode: enter
            mode: emacs
            event:[
                { edit: Clear }
                { edit: InsertString,
                  value: "br"
                }
                { send: Enter }
            ]
        }
        {
            name: custom_yazi
            modifier: alt
            keycode: char_q
            mode: emacs
            event:[
                { edit: Clear }
                { edit: InsertString,
                  value: "yazi"
                }
                { send: Enter }
            ]
        }
        {
            name: custom_walk
            modifier: alt
            keycode: char_w
            mode: emacs
            event:[
                { edit: Clear }
                { edit: InsertString,
                  value: "walk"
                }
                { send: Enter }
            ]
        }
        {
            name: custom_zoxide
            modifier: alt
            keycode: char_z
            mode: emacs
            event:[
                { edit: Clear }
                { edit: InsertString,
                  value: "zi"
                }
                { send: Enter }
            ]
        }
        {
            name: custom_xplr
            modifier: alt
            keycode: char_x
            mode: emacs
            event:[
                { edit: Clear }
                { edit: InsertString,
                  value: "xplr"
                }
                { send: Enter }
            ]
        }
        {
            name: completion_menu
            modifier: none
            keycode: tab
            mode: [emacs vi_normal vi_insert]
            event: {
                until: [
                    { send: menu name: completion_menu }
                    { send: menunext }
                    { edit: complete }
                ]
            }
        }
        {
            name: history_menu
            modifier: control
            keycode: char_r
            mode: [emacs, vi_insert, vi_normal]
            event: { send: menu name: history_menu }
        }
        {
            name: help_menu
            modifier: none
            keycode: f1
            mode: [emacs, vi_insert, vi_normal]
            event: { send: menu name: help_menu }
        }
        {
            name: completion_previous_menu
            modifier: shift
            keycode: backtab
            mode: [emacs, vi_normal, vi_insert]
            event: { send: menuprevious }
        }
        {
            name: next_page_menu
            modifier: control
            keycode: char_x
            mode: emacs
            event: { send: menupagenext }
        }
        {
            name: undo_or_previous_page_menu
            modifier: control
            keycode: char_z
            mode: emacs
            event: {
                until: [
                    { send: menupageprevious }
                    { edit: undo }
                ]
            }
        }
        {
            name: escape
            modifier: none
            keycode: escape
            mode: [emacs, vi_normal, vi_insert]
            event: { send: esc }    # NOTE: does not appear to work
        }
        {
            name: cancel_command
            modifier: control
            keycode: char_c
            mode: [emacs, vi_normal, vi_insert]
            event: { send: ctrlc }
        }
        {
            name: quit_shell
            modifier: control
            keycode: char_d
            mode: [emacs, vi_normal, vi_insert]
            event: { send: ctrld }
        }
        {
            name: clear_screen
            modifier: control
            keycode: char_l
            mode: [emacs, vi_normal, vi_insert]
            event: { send: clearscreen }
        }
        {
            name: search_history
            modifier: control
            keycode: char_q
            mode: [emacs, vi_normal, vi_insert]
            event: { send: searchhistory }
        }
        {
            name: open_command_editor
            modifier: control
            keycode: char_o
            mode: [emacs, vi_normal, vi_insert]
            event: { send: openeditor }
        }
        {
            name: move_up
            modifier: none
            keycode: up
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    {send: menuup}
                    {send: up}
                ]
            }
        }
        {
            name: move_down
            modifier: none
            keycode: down
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    {send: menudown}
                    {send: down}
                ]
            }
        }
        {
            name: move_left
            modifier: none
            keycode: left
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    {send: menuleft}
                    {send: left}
                ]
            }
        }
        {
            name: move_right_or_take_history_hint
            modifier: none
            keycode: right
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    {send: historyhintcomplete}
                    {send: menuright}
                    {send: right}
                ]
            }
        }
        {
            name: move_one_word_left
            modifier: control
            keycode: left
            mode: [emacs, vi_normal, vi_insert]
            event: {edit: movewordleft}
        }
        {
            name: move_one_word_right_or_take_history_hint
            modifier: control
            keycode: right
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    {send: historyhintwordcomplete}
                    {edit: movewordright}
                ]
            }
        }
        {
            name: move_to_line_start
            modifier: none
            keycode: home
            mode: [emacs, vi_normal, vi_insert]
            event: {edit: movetolinestart}
        }
        {
            name: move_to_line_start
            modifier: control
            keycode: char_a
            mode: [emacs, vi_normal, vi_insert]
            event: {edit: movetolinestart}
        }
        {
            name: move_to_line_end_or_take_history_hint
            modifier: none
            keycode: end
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    {send: historyhintcomplete}
                    {edit: movetolineend}
                ]
            }
        }
        {
            name: move_to_line_end_or_take_history_hint
            modifier: control
            keycode: char_e
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    {send: historyhintcomplete}
                    {edit: movetolineend}
                ]
            }
        }
        {
            name: move_to_line_start
            modifier: control
            keycode: home
            mode: [emacs, vi_normal, vi_insert]
            event: {edit: movetolinestart}
        }
        {
            name: move_to_line_end
            modifier: control
            keycode: end
            mode: [emacs, vi_normal, vi_insert]
            event: {edit: movetolineend}
        }
        {
            name: move_up
            modifier: control
            keycode: char_p
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    {send: menuup}
                    {send: up}
                ]
            }
        }
        {
            name: move_down
            modifier: control
            keycode: char_t
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    {send: menudown}
                    {send: down}
                ]
            }
        }
        {
            name: delete_one_character_backward
            modifier: none
            keycode: backspace
            mode: [emacs, vi_insert]
            event: {edit: backspace}
        }
        {
            name: delete_one_word_backward
            modifier: control
            keycode: backspace
            mode: [emacs, vi_insert]
            event: {edit: backspaceword}
        }
        {
            name: delete_one_character_forward
            modifier: none
            keycode: delete
            mode: [emacs, vi_insert]
            event: {edit: delete}
        }
        {
            name: delete_one_character_forward
            modifier: control
            keycode: delete
            mode: [emacs, vi_insert]
            event: {edit: delete}
        }
        {
            name: delete_one_character_forward
            modifier: control
            keycode: char_h
            mode: [emacs, vi_insert]
            event: {edit: backspace}
        }
        {
            name: delete_one_word_backward
            modifier: control
            keycode: char_w
            mode: [emacs, vi_insert]
            event: {edit: backspaceword}
        }
        {
            name: move_left
            modifier: none
            keycode: backspace
            mode: vi_normal
            event: {edit: moveleft}
        }
        {
            name: newline_or_run_command
            modifier: none
            keycode: enter
            mode: emacs
            event: {send: enter}
        }
        {
            name: move_left
            modifier: control
            keycode: char_b
            mode: emacs
            event: {
                until: [
                    {send: menuleft}
                    {send: left}
                ]
            }
        }
        {
            name: move_right_or_take_history_hint
            modifier: control
            keycode: char_f
            mode: emacs
            event: {
                until: [
                    {send: historyhintcomplete}
                    {send: menuright}
                    {send: right}
                ]
            }
        }
        {
            name: redo_change
            modifier: control
            keycode: char_g
            mode: emacs
            event: {edit: redo}
        }
        {
            name: undo_change
            modifier: control
            keycode: char_z
            mode: emacs
            event: {edit: undo}
        }
        {
            name: paste_before
            modifier: control
            keycode: char_y
            mode: emacs
            event: {edit: pastecutbufferbefore}
        }
        {
            name: cut_word_left
            modifier: control
            keycode: char_w
            mode: emacs
            event: {edit: cutwordleft}
        }
        {
            name: cut_line_to_end
            modifier: control
            keycode: char_k
            mode: emacs
            event: {edit: cuttoend}
        }
        {
            name: cut_line_from_start
            modifier: control
            keycode: char_u
            mode: emacs
            event: {edit: cutfromstart}
        }
        {
            name: swap_graphemes
            modifier: control
            keycode: char_t
            mode: emacs
            event: {edit: swapgraphemes}
        }
        {
            name: move_one_word_left
            modifier: alt
            keycode: left
            mode: emacs
            event: {edit: movewordleft}
        }
        {
            name: move_one_word_right_or_take_history_hint
            modifier: alt
            keycode: right
            mode: emacs
            event: {
                until: [
                    {send: historyhintwordcomplete}
                    {edit: movewordright}
                ]
            }
        }
        {
            name: move_one_word_left
            modifier: alt
            keycode: char_b
            mode: emacs
            event: {edit: movewordleft}
        }
        {
            name: move_one_word_right_or_take_history_hint
            modifier: alt
            keycode: char_f
            mode: emacs
            event: {
                until: [
                    {send: historyhintwordcomplete}
                    {edit: movewordright}
                ]
            }
        }
        {
            name: delete_one_word_forward
            modifier: alt
            keycode: delete
            mode: emacs
            event: {edit: deleteword}
        }
        {
            name: delete_one_word_backward
            modifier: alt
            keycode: backspace
            mode: emacs
            event: {edit: backspaceword}
        }
        {
            name: delete_one_word_backward
            modifier: alt
            keycode: char_m
            mode: emacs
            event: {edit: backspaceword}
        }
        {
            name: cut_word_to_right
            modifier: alt
            keycode: char_d
            mode: emacs
            event: {edit: cutwordright}
        }
        {
            name: upper_case_word
            modifier: alt
            keycode: char_u
            mode: emacs
            event: {edit: uppercaseword}
        }
        {
            name: lower_case_word
            modifier: alt
            keycode: char_l
            mode: emacs
            event: {edit: lowercaseword}
        }
        {
            name: capitalize_char
            modifier: alt
            keycode: char_c
            mode: emacs
            event: {edit: capitalizechar}
        }
    ]
}


# ------------------------- THEME ----------------------

# colors for ls command
# vivid themes - https://github.com/sharkdp/vivid/tree/master/themes
# $env.LS_COLORS = (vivid generate nord | str trim)
# $env.LS_COLORS = (vivid generate one-dark | str trim)

# $env.LS_COLORS = (vivid generate iceberg-dark | str trim)
$env.LS_COLORS = "*~=0;38;2;107;112;137:bd=0;38;2;137;184;194;48;2;54;56;74:ca=0:cd=0;38;2;173;160;211;48;2;54;56;74:di=0;38;2;132;160;198:do=0;38;2;30;33;50;48;2;173;160;211:ex=1;38;2;226;120;120:fi=0:ln=0;38;2;173;160;211:mh=0:mi=0;38;2;30;33;50;48;2;226;120;120:no=0:or=0;38;2;30;33;50;48;2;226;120;120:ow=0:pi=0;38;2;30;33;50;48;2;132;160;198:rs=0:sg=0:so=0;38;2;30;33;50;48;2;173;160;211:st=0:su=0:tw=0:*.a=1;38;2;226;120;120:*.c=0;38;2;180;190;130:*.d=0;38;2;180;190;130:*.h=0;38;2;180;190;130:*.m=0;38;2;180;190;130:*.o=0;38;2;107;112;137:*.p=0;38;2;180;190;130:*.r=0;38;2;180;190;130:*.t=0;38;2;180;190;130:*.z=4;38;2;137;184;194:*.7z=4;38;2;137;184;194:*.as=0;38;2;180;190;130:*.bc=0;38;2;107;112;137:*.bz=4;38;2;137;184;194:*.cc=0;38;2;180;190;130:*.cp=0;38;2;180;190;130:*.cr=0;38;2;180;190;130:*.cs=0;38;2;180;190;130:*.di=0;38;2;180;190;130:*.el=0;38;2;180;190;130:*.ex=0;38;2;180;190;130:*.fs=0;38;2;180;190;130:*.go=0;38;2;180;190;130:*.gv=0;38;2;180;190;130:*.gz=4;38;2;137;184;194:*.hh=0;38;2;180;190;130:*.hi=0;38;2;107;112;137:*.hs=0;38;2;180;190;130:*.jl=0;38;2;180;190;130:*.js=0;38;2;180;190;130:*.ko=1;38;2;226;120;120:*.kt=0;38;2;180;190;130:*.la=0;38;2;107;112;137:*.ll=0;38;2;180;190;130:*.lo=0;38;2;107;112;137:*.md=0;38;2;226;164;120:*.ml=0;38;2;180;190;130:*.mn=0;38;2;180;190;130:*.nb=0;38;2;180;190;130:*.pl=0;38;2;180;190;130:*.pm=0;38;2;180;190;130:*.pp=0;38;2;180;190;130:*.ps=0;38;2;226;120;120:*.py=0;38;2;180;190;130:*.rb=0;38;2;180;190;130:*.rm=0;38;2;173;160;211:*.rs=0;38;2;180;190;130:*.sh=0;38;2;180;190;130:*.so=1;38;2;226;120;120:*.td=0;38;2;180;190;130:*.ts=0;38;2;180;190;130:*.ui=0;38;2;226;164;120:*.vb=0;38;2;180;190;130:*.wv=0;38;2;173;160;211:*.xz=4;38;2;137;184;194:*.aif=0;38;2;173;160;211:*.ape=0;38;2;173;160;211:*.apk=4;38;2;137;184;194:*.arj=4;38;2;137;184;194:*.asa=0;38;2;180;190;130:*.aux=0;38;2;107;112;137:*.avi=0;38;2;173;160;211:*.awk=0;38;2;180;190;130:*.bag=4;38;2;137;184;194:*.bak=0;38;2;107;112;137:*.bat=1;38;2;226;120;120:*.bbl=0;38;2;107;112;137:*.bcf=0;38;2;107;112;137:*.bib=0;38;2;226;164;120:*.bin=4;38;2;137;184;194:*.blg=0;38;2;107;112;137:*.bmp=0;38;2;173;160;211:*.bsh=0;38;2;180;190;130:*.bst=0;38;2;226;164;120:*.bz2=4;38;2;137;184;194:*.c++=0;38;2;180;190;130:*.cfg=0;38;2;226;164;120:*.cgi=0;38;2;180;190;130:*.clj=0;38;2;180;190;130:*.com=1;38;2;226;120;120:*.cpp=0;38;2;180;190;130:*.css=0;38;2;180;190;130:*.csv=0;38;2;226;164;120:*.csx=0;38;2;180;190;130:*.cxx=0;38;2;180;190;130:*.deb=4;38;2;137;184;194:*.def=0;38;2;180;190;130:*.dll=1;38;2;226;120;120:*.dmg=4;38;2;137;184;194:*.doc=0;38;2;226;120;120:*.dot=0;38;2;180;190;130:*.dox=0;38;2;180;190;130:*.dpr=0;38;2;180;190;130:*.elc=0;38;2;180;190;130:*.elm=0;38;2;180;190;130:*.epp=0;38;2;180;190;130:*.eps=0;38;2;173;160;211:*.erl=0;38;2;180;190;130:*.exe=1;38;2;226;120;120:*.exs=0;38;2;180;190;130:*.fls=0;38;2;107;112;137:*.flv=0;38;2;173;160;211:*.fnt=0;38;2;173;160;211:*.fon=0;38;2;173;160;211:*.fsi=0;38;2;180;190;130:*.fsx=0;38;2;180;190;130:*.gif=0;38;2;173;160;211:*.git=0;38;2;107;112;137:*.gvy=0;38;2;180;190;130:*.h++=0;38;2;180;190;130:*.hpp=0;38;2;180;190;130:*.htc=0;38;2;180;190;130:*.htm=0;38;2;226;164;120:*.hxx=0;38;2;180;190;130:*.ico=0;38;2;173;160;211:*.ics=0;38;2;226;120;120:*.idx=0;38;2;107;112;137:*.ilg=0;38;2;107;112;137:*.img=4;38;2;137;184;194:*.inc=0;38;2;180;190;130:*.ind=0;38;2;107;112;137:*.ini=0;38;2;226;164;120:*.inl=0;38;2;180;190;130:*.ipp=0;38;2;180;190;130:*.iso=4;38;2;137;184;194:*.jar=4;38;2;137;184;194:*.jpg=0;38;2;173;160;211:*.kex=0;38;2;226;120;120:*.kts=0;38;2;180;190;130:*.log=0;38;2;107;112;137:*.ltx=0;38;2;180;190;130:*.lua=0;38;2;180;190;130:*.m3u=0;38;2;173;160;211:*.m4a=0;38;2;173;160;211:*.m4v=0;38;2;173;160;211:*.mid=0;38;2;173;160;211:*.mir=0;38;2;180;190;130:*.mkv=0;38;2;173;160;211:*.mli=0;38;2;180;190;130:*.mov=0;38;2;173;160;211:*.mp3=0;38;2;173;160;211:*.mp4=0;38;2;173;160;211:*.mpg=0;38;2;173;160;211:*.nix=0;38;2;226;164;120:*.odp=0;38;2;226;120;120:*.ods=0;38;2;226;120;120:*.odt=0;38;2;226;120;120:*.ogg=0;38;2;173;160;211:*.org=0;38;2;226;164;120:*.otf=0;38;2;173;160;211:*.out=0;38;2;107;112;137:*.pas=0;38;2;180;190;130:*.pbm=0;38;2;173;160;211:*.pdf=0;38;2;226;120;120:*.pgm=0;38;2;173;160;211:*.php=0;38;2;180;190;130:*.pid=0;38;2;107;112;137:*.pkg=4;38;2;137;184;194:*.png=0;38;2;173;160;211:*.pod=0;38;2;180;190;130:*.ppm=0;38;2;173;160;211:*.pps=0;38;2;226;120;120:*.ppt=0;38;2;226;120;120:*.pro=0;38;2;180;190;130:*.ps1=0;38;2;180;190;130:*.psd=0;38;2;173;160;211:*.pyc=0;38;2;107;112;137:*.pyd=0;38;2;107;112;137:*.pyo=0;38;2;107;112;137:*.rar=4;38;2;137;184;194:*.rpm=4;38;2;137;184;194:*.rst=0;38;2;226;164;120:*.rtf=0;38;2;226;120;120:*.sbt=0;38;2;180;190;130:*.sql=0;38;2;180;190;130:*.sty=0;38;2;107;112;137:*.svg=0;38;2;173;160;211:*.swf=0;38;2;173;160;211:*.swp=0;38;2;107;112;137:*.sxi=0;38;2;226;120;120:*.sxw=0;38;2;226;120;120:*.tar=4;38;2;137;184;194:*.tbz=4;38;2;137;184;194:*.tcl=0;38;2;180;190;130:*.tex=0;38;2;180;190;130:*.tgz=4;38;2;137;184;194:*.tif=0;38;2;173;160;211:*.tml=0;38;2;226;164;120:*.tmp=0;38;2;107;112;137:*.toc=0;38;2;107;112;137:*.tsx=0;38;2;180;190;130:*.ttf=0;38;2;173;160;211:*.txt=0;38;2;226;164;120:*.vcd=4;38;2;137;184;194:*.vim=0;38;2;180;190;130:*.vob=0;38;2;173;160;211:*.wav=0;38;2;173;160;211:*.wma=0;38;2;173;160;211:*.wmv=0;38;2;173;160;211:*.xcf=0;38;2;173;160;211:*.xlr=0;38;2;226;120;120:*.xls=0;38;2;226;120;120:*.xml=0;38;2;226;164;120:*.xmp=0;38;2;226;164;120:*.yml=0;38;2;226;164;120:*.zip=4;38;2;137;184;194:*.zsh=0;38;2;180;190;130:*.zst=4;38;2;137;184;194:*TODO=1:*hgrc=0;38;2;180;190;130:*.bash=0;38;2;180;190;130:*.conf=0;38;2;226;164;120:*.dart=0;38;2;180;190;130:*.diff=0;38;2;180;190;130:*.docx=0;38;2;226;120;120:*.epub=0;38;2;226;120;120:*.fish=0;38;2;180;190;130:*.flac=0;38;2;173;160;211:*.h264=0;38;2;173;160;211:*.hgrc=0;38;2;180;190;130:*.html=0;38;2;226;164;120:*.java=0;38;2;180;190;130:*.jpeg=0;38;2;173;160;211:*.json=0;38;2;226;164;120:*.less=0;38;2;180;190;130:*.lisp=0;38;2;180;190;130:*.lock=0;38;2;107;112;137:*.make=0;38;2;180;190;130:*.mpeg=0;38;2;173;160;211:*.opus=0;38;2;173;160;211:*.orig=0;38;2;107;112;137:*.pptx=0;38;2;226;120;120:*.psd1=0;38;2;180;190;130:*.psm1=0;38;2;180;190;130:*.purs=0;38;2;180;190;130:*.rlib=0;38;2;107;112;137:*.sass=0;38;2;180;190;130:*.scss=0;38;2;180;190;130:*.tbz2=4;38;2;137;184;194:*.tiff=0;38;2;173;160;211:*.toml=0;38;2;226;164;120:*.webm=0;38;2;173;160;211:*.webp=0;38;2;173;160;211:*.woff=0;38;2;173;160;211:*.xbps=4;38;2;137;184;194:*.xlsx=0;38;2;226;120;120:*.yaml=0;38;2;226;164;120:*.cabal=0;38;2;180;190;130:*.cache=0;38;2;107;112;137:*.class=0;38;2;107;112;137:*.cmake=0;38;2;180;190;130:*.dyn_o=0;38;2;107;112;137:*.ipynb=0;38;2;180;190;130:*.mdown=0;38;2;226;164;120:*.patch=0;38;2;180;190;130:*.scala=0;38;2;180;190;130:*.shtml=0;38;2;226;164;120:*.swift=0;38;2;180;190;130:*.toast=4;38;2;137;184;194:*.xhtml=0;38;2;226;164;120:*README=0;38;2;22;24;33;48;2;226;164;120:*passwd=0;38;2;226;164;120:*shadow=0;38;2;226;164;120:*.config=0;38;2;226;164;120:*.dyn_hi=0;38;2;107;112;137:*.flake8=0;38;2;180;190;130:*.gradle=0;38;2;180;190;130:*.groovy=0;38;2;180;190;130:*.ignore=0;38;2;180;190;130:*.matlab=0;38;2;180;190;130:*COPYING=0;38;2;130;133;151:*INSTALL=0;38;2;22;24;33;48;2;226;164;120:*LICENSE=0;38;2;130;133;151:*TODO.md=1:*.desktop=0;38;2;226;164;120:*.gemspec=0;38;2;180;190;130:*Doxyfile=0;38;2;180;190;130:*Makefile=0;38;2;180;190;130:*TODO.txt=1:*setup.py=0;38;2;180;190;130:*.DS_Store=0;38;2;107;112;137:*.cmake.in=0;38;2;180;190;130:*.fdignore=0;38;2;180;190;130:*.kdevelop=0;38;2;180;190;130:*.markdown=0;38;2;226;164;120:*.rgignore=0;38;2;180;190;130:*COPYRIGHT=0;38;2;130;133;151:*README.md=0;38;2;22;24;33;48;2;226;164;120:*configure=0;38;2;180;190;130:*.gitconfig=0;38;2;180;190;130:*.gitignore=0;38;2;180;190;130:*.localized=0;38;2;107;112;137:*.scons_opt=0;38;2;107;112;137:*CODEOWNERS=0;38;2;180;190;130:*Dockerfile=0;38;2;226;164;120:*INSTALL.md=0;38;2;22;24;33;48;2;226;164;120:*README.txt=0;38;2;22;24;33;48;2;226;164;120:*SConscript=0;38;2;180;190;130:*SConstruct=0;38;2;180;190;130:*.gitmodules=0;38;2;180;190;130:*.synctex.gz=0;38;2;107;112;137:*.travis.yml=0;38;2;180;190;130:*INSTALL.txt=0;38;2;22;24;33;48;2;226;164;120:*LICENSE-MIT=0;38;2;130;133;151:*MANIFEST.in=0;38;2;180;190;130:*Makefile.am=0;38;2;180;190;130:*Makefile.in=0;38;2;107;112;137:*.applescript=0;38;2;180;190;130:*.fdb_latexmk=0;38;2;107;112;137:*CONTRIBUTORS=0;38;2;22;24;33;48;2;226;164;120:*appveyor.yml=0;38;2;180;190;130:*configure.ac=0;38;2;180;190;130:*.clang-format=0;38;2;180;190;130:*.gitattributes=0;38;2;180;190;130:*.gitlab-ci.yml=0;38;2;180;190;130:*CMakeCache.txt=0;38;2;107;112;137:*CMakeLists.txt=0;38;2;180;190;130:*LICENSE-APACHE=0;38;2;130;133;151:*CONTRIBUTORS.md=0;38;2;22;24;33;48;2;226;164;120:*.sconsign.dblite=0;38;2;107;112;137:*CONTRIBUTORS.txt=0;38;2;22;24;33;48;2;226;164;120:*requirements.txt=0;38;2;180;190;130:*package-lock.json=0;38;2;107;112;137:*.CFUserTextEncoding=0;38;2;107;112;137"

# $env.LS_COLORS = (vivid generate jellybeans | str trim)
# $env.LS_COLORS = "*~=3;38;2;136;136;136:bd=0;38;2;207;106;76:ca=0:cd=0;38;2;207;106;76:di=0;38;2;198;182;238:do=0;38;2;240;160;192:ex=1;38;2;255;185;100:fi=0:ln=0;38;2;250;208;122:mh=0:mi=0;38;2;250;208;122;48;2;144;32;32:no=0:or=0;38;2;250;208;122;48;2;144;32;32:ow=0:pi=0;38;2;240;160;192:rs=0:sg=0:so=0;38;2;240;160;192:st=0:su=0:tw=0:*.a=1;38;2;255;185;100:*.c=0;38;2;129;151;191:*.d=0;38;2;129;151;191:*.h=0;38;2;129;151;191:*.m=0;38;2;129;151;191:*.o=3;38;2;136;136;136:*.p=0;38;2;129;151;191:*.r=0;38;2;129;151;191:*.t=0;38;2;129;151;191:*.z=4;38;2;250;208;122:*.7z=4;38;2;250;208;122:*.as=0;38;2;129;151;191:*.bc=3;38;2;136;136;136:*.bz=4;38;2;250;208;122:*.cc=0;38;2;129;151;191:*.cp=0;38;2;129;151;191:*.cr=0;38;2;129;151;191:*.cs=0;38;2;129;151;191:*.di=0;38;2;129;151;191:*.el=0;38;2;129;151;191:*.ex=0;38;2;129;151;191:*.fs=0;38;2;129;151;191:*.go=0;38;2;129;151;191:*.gv=0;38;2;129;151;191:*.gz=4;38;2;250;208;122:*.hh=0;38;2;129;151;191:*.hi=3;38;2;136;136;136:*.hs=0;38;2;129;151;191:*.jl=0;38;2;129;151;191:*.js=0;38;2;129;151;191:*.ko=1;38;2;255;185;100:*.kt=0;38;2;129;151;191:*.la=3;38;2;136;136;136:*.ll=0;38;2;129;151;191:*.lo=3;38;2;136;136;136:*.md=0;38;2;102;135;153:*.ml=0;38;2;129;151;191:*.mn=0;38;2;129;151;191:*.nb=0;38;2;129;151;191:*.pl=0;38;2;129;151;191:*.pm=0;38;2;129;151;191:*.pp=0;38;2;129;151;191:*.ps=0;38;2;102;135;153:*.py=0;38;2;129;151;191:*.rb=0;38;2;129;151;191:*.rm=0;38;2;218;208;133:*.rs=0;38;2;129;151;191:*.sh=0;38;2;129;151;191:*.so=1;38;2;255;185;100:*.td=0;38;2;129;151;191:*.ts=0;38;2;129;151;191:*.ui=0;38;2;153;173;106:*.vb=0;38;2;129;151;191:*.wv=0;38;2;218;208;133:*.xz=4;38;2;250;208;122:*.aif=0;38;2;218;208;133:*.ape=0;38;2;218;208;133:*.apk=4;38;2;250;208;122:*.arj=4;38;2;250;208;122:*.asa=0;38;2;129;151;191:*.aux=3;38;2;136;136;136:*.avi=0;38;2;218;208;133:*.awk=0;38;2;129;151;191:*.bag=4;38;2;250;208;122:*.bak=3;38;2;136;136;136:*.bat=1;38;2;255;185;100:*.bbl=3;38;2;136;136;136:*.bcf=3;38;2;136;136;136:*.bib=0;38;2;153;173;106:*.bin=4;38;2;250;208;122:*.blg=3;38;2;136;136;136:*.bmp=0;38;2;218;208;133:*.bsh=0;38;2;129;151;191:*.bst=0;38;2;153;173;106:*.bz2=4;38;2;250;208;122:*.c++=0;38;2;129;151;191:*.cfg=0;38;2;153;173;106:*.cgi=0;38;2;129;151;191:*.clj=0;38;2;129;151;191:*.com=1;38;2;255;185;100:*.cpp=0;38;2;129;151;191:*.css=0;38;2;129;151;191:*.csv=0;38;2;102;135;153:*.csx=0;38;2;129;151;191:*.cxx=0;38;2;129;151;191:*.deb=4;38;2;250;208;122:*.def=0;38;2;129;151;191:*.dll=1;38;2;255;185;100:*.dmg=4;38;2;250;208;122:*.doc=0;38;2;102;135;153:*.dot=0;38;2;129;151;191:*.dox=0;38;2;118;151;214:*.dpr=0;38;2;129;151;191:*.elc=0;38;2;129;151;191:*.elm=0;38;2;129;151;191:*.epp=0;38;2;129;151;191:*.eps=0;38;2;218;208;133:*.erl=0;38;2;129;151;191:*.exe=1;38;2;255;185;100:*.exs=0;38;2;129;151;191:*.fls=3;38;2;136;136;136:*.flv=0;38;2;218;208;133:*.fnt=0;38;2;218;208;133:*.fon=0;38;2;218;208;133:*.fsi=0;38;2;129;151;191:*.fsx=0;38;2;129;151;191:*.gif=0;38;2;218;208;133:*.git=3;38;2;136;136;136:*.gvy=0;38;2;129;151;191:*.h++=0;38;2;129;151;191:*.hpp=0;38;2;129;151;191:*.htc=0;38;2;129;151;191:*.htm=0;38;2;102;135;153:*.hxx=0;38;2;129;151;191:*.ico=0;38;2;218;208;133:*.ics=0;38;2;102;135;153:*.idx=3;38;2;136;136;136:*.ilg=3;38;2;136;136;136:*.img=4;38;2;250;208;122:*.inc=0;38;2;129;151;191:*.ind=3;38;2;136;136;136:*.ini=0;38;2;153;173;106:*.inl=0;38;2;129;151;191:*.ipp=0;38;2;129;151;191:*.iso=4;38;2;250;208;122:*.jar=4;38;2;250;208;122:*.jpg=0;38;2;218;208;133:*.kex=0;38;2;102;135;153:*.kts=0;38;2;129;151;191:*.log=3;38;2;136;136;136:*.ltx=0;38;2;129;151;191:*.lua=0;38;2;129;151;191:*.m3u=0;38;2;218;208;133:*.m4a=0;38;2;218;208;133:*.m4v=0;38;2;218;208;133:*.mid=0;38;2;218;208;133:*.mir=0;38;2;129;151;191:*.mkv=0;38;2;218;208;133:*.mli=0;38;2;129;151;191:*.mov=0;38;2;218;208;133:*.mp3=0;38;2;218;208;133:*.mp4=0;38;2;218;208;133:*.mpg=0;38;2;218;208;133:*.nix=0;38;2;153;173;106:*.odp=0;38;2;102;135;153:*.ods=0;38;2;102;135;153:*.odt=0;38;2;102;135;153:*.ogg=0;38;2;218;208;133:*.org=0;38;2;102;135;153:*.otf=0;38;2;218;208;133:*.out=3;38;2;136;136;136:*.pas=0;38;2;129;151;191:*.pbm=0;38;2;218;208;133:*.pdf=0;38;2;102;135;153:*.pgm=0;38;2;218;208;133:*.php=0;38;2;129;151;191:*.pid=3;38;2;136;136;136:*.pkg=4;38;2;250;208;122:*.png=0;38;2;218;208;133:*.pod=0;38;2;129;151;191:*.ppm=0;38;2;218;208;133:*.pps=0;38;2;102;135;153:*.ppt=0;38;2;102;135;153:*.pro=0;38;2;118;151;214:*.ps1=0;38;2;129;151;191:*.psd=0;38;2;218;208;133:*.pyc=3;38;2;136;136;136:*.pyd=3;38;2;136;136;136:*.pyo=3;38;2;136;136;136:*.rar=4;38;2;250;208;122:*.rpm=4;38;2;250;208;122:*.rst=0;38;2;102;135;153:*.rtf=0;38;2;102;135;153:*.sbt=0;38;2;129;151;191:*.sql=0;38;2;129;151;191:*.sty=3;38;2;136;136;136:*.svg=0;38;2;218;208;133:*.swf=0;38;2;218;208;133:*.swp=3;38;2;136;136;136:*.sxi=0;38;2;102;135;153:*.sxw=0;38;2;102;135;153:*.tar=4;38;2;250;208;122:*.tbz=4;38;2;250;208;122:*.tcl=0;38;2;129;151;191:*.tex=0;38;2;129;151;191:*.tgz=4;38;2;250;208;122:*.tif=0;38;2;218;208;133:*.tml=0;38;2;153;173;106:*.tmp=3;38;2;136;136;136:*.toc=3;38;2;136;136;136:*.tsx=0;38;2;129;151;191:*.ttf=0;38;2;218;208;133:*.txt=0;38;2;121;157;106:*.vcd=4;38;2;250;208;122:*.vim=0;38;2;129;151;191:*.vob=0;38;2;218;208;133:*.wav=0;38;2;218;208;133:*.wma=0;38;2;218;208;133:*.wmv=0;38;2;218;208;133:*.xcf=0;38;2;218;208;133:*.xlr=0;38;2;102;135;153:*.xls=0;38;2;102;135;153:*.xml=0;38;2;102;135;153:*.xmp=0;38;2;153;173;106:*.yml=0;38;2;153;173;106:*.zip=4;38;2;250;208;122:*.zsh=0;38;2;129;151;191:*.zst=4;38;2;250;208;122:*TODO=0;38;2;112;185;80:*hgrc=0;38;2;118;151;214:*.bash=0;38;2;129;151;191:*.conf=0;38;2;153;173;106:*.dart=0;38;2;129;151;191:*.diff=0;38;2;129;151;191:*.docx=0;38;2;102;135;153:*.epub=0;38;2;102;135;153:*.fish=0;38;2;129;151;191:*.flac=0;38;2;218;208;133:*.h264=0;38;2;218;208;133:*.hgrc=0;38;2;118;151;214:*.html=0;38;2;102;135;153:*.java=0;38;2;129;151;191:*.jpeg=0;38;2;218;208;133:*.json=0;38;2;153;173;106:*.less=0;38;2;129;151;191:*.lisp=0;38;2;129;151;191:*.lock=3;38;2;136;136;136:*.make=0;38;2;118;151;214:*.mpeg=0;38;2;218;208;133:*.opus=0;38;2;218;208;133:*.orig=3;38;2;136;136;136:*.pptx=0;38;2;102;135;153:*.psd1=0;38;2;129;151;191:*.psm1=0;38;2;129;151;191:*.purs=0;38;2;129;151;191:*.rlib=3;38;2;136;136;136:*.sass=0;38;2;129;151;191:*.scss=0;38;2;129;151;191:*.tbz2=4;38;2;250;208;122:*.tiff=0;38;2;218;208;133:*.toml=0;38;2;153;173;106:*.webm=0;38;2;218;208;133:*.webp=0;38;2;218;208;133:*.woff=0;38;2;218;208;133:*.xbps=4;38;2;250;208;122:*.xlsx=0;38;2;102;135;153:*.yaml=0;38;2;153;173;106:*.cabal=0;38;2;129;151;191:*.cache=3;38;2;136;136;136:*.class=3;38;2;136;136;136:*.cmake=0;38;2;118;151;214:*.dyn_o=3;38;2;136;136;136:*.ipynb=0;38;2;129;151;191:*.mdown=0;38;2;102;135;153:*.patch=0;38;2;129;151;191:*.scala=0;38;2;129;151;191:*.shtml=0;38;2;102;135;153:*.swift=0;38;2;129;151;191:*.toast=4;38;2;250;208;122:*.xhtml=0;38;2;102;135;153:*README=1;38;2;101;194;84:*passwd=0;38;2;153;173;106:*shadow=0;38;2;153;173;106:*.config=0;38;2;153;173;106:*.dyn_hi=3;38;2;136;136;136:*.flake8=0;38;2;118;151;214:*.gradle=0;38;2;129;151;191:*.groovy=0;38;2;129;151;191:*.ignore=0;38;2;118;151;214:*.matlab=0;38;2;129;151;191:*COPYING=3;38;2;153;173;106:*INSTALL=1;38;2;101;194;84:*LICENSE=3;38;2;153;173;106:*TODO.md=0;38;2;112;185;80:*.desktop=0;38;2;153;173;106:*.gemspec=0;38;2;118;151;214:*Doxyfile=0;38;2;118;151;214:*Makefile=0;38;2;118;151;214:*TODO.txt=0;38;2;112;185;80:*setup.py=0;38;2;118;151;214:*.DS_Store=3;38;2;136;136;136:*.cmake.in=0;38;2;118;151;214:*.fdignore=0;38;2;118;151;214:*.kdevelop=0;38;2;118;151;214:*.markdown=0;38;2;102;135;153:*.rgignore=0;38;2;118;151;214:*COPYRIGHT=3;38;2;153;173;106:*README.md=1;38;2;101;194;84:*configure=0;38;2;118;151;214:*.gitconfig=0;38;2;118;151;214:*.gitignore=0;38;2;118;151;214:*.localized=3;38;2;136;136;136:*.scons_opt=3;38;2;136;136;136:*CODEOWNERS=0;38;2;118;151;214:*Dockerfile=0;38;2;153;173;106:*INSTALL.md=1;38;2;101;194;84:*README.txt=1;38;2;101;194;84:*SConscript=0;38;2;118;151;214:*SConstruct=0;38;2;118;151;214:*.gitmodules=0;38;2;118;151;214:*.synctex.gz=3;38;2;136;136;136:*.travis.yml=0;38;2;143;191;220:*INSTALL.txt=1;38;2;101;194;84:*LICENSE-MIT=3;38;2;153;173;106:*MANIFEST.in=0;38;2;118;151;214:*Makefile.am=0;38;2;118;151;214:*Makefile.in=3;38;2;136;136;136:*.applescript=0;38;2;129;151;191:*.fdb_latexmk=3;38;2;136;136;136:*CONTRIBUTORS=1;38;2;101;194;84:*appveyor.yml=0;38;2;143;191;220:*configure.ac=0;38;2;118;151;214:*.clang-format=0;38;2;118;151;214:*.gitattributes=0;38;2;118;151;214:*.gitlab-ci.yml=0;38;2;143;191;220:*CMakeCache.txt=3;38;2;136;136;136:*CMakeLists.txt=0;38;2;118;151;214:*LICENSE-APACHE=3;38;2;153;173;106:*CONTRIBUTORS.md=1;38;2;101;194;84:*.sconsign.dblite=3;38;2;136;136;136:*CONTRIBUTORS.txt=1;38;2;101;194;84:*requirements.txt=0;38;2;118;151;214:*package-lock.json=3;38;2;136;136;136:*.CFUserTextEncoding=3;38;2;136;136;136"

# https://github.com/nordtheme/dircolors
# $env.LS_COLORS = "no=00:rs=0:fi=00:di=01;34:ln=36:mh=04;36:pi=04;01;36:so=04;33:do=04;01;36:bd=01;33:cd=33:or=31:mi=01;37;41:ex=01;36:su=01;04;37:sg=01;04;37:ca=01;37:tw=01;37;44:ow=01;04;34:st=04;37;44:*.7z=01;32:*.ace=01;32:*.alz=01;32:*.arc=01;32:*.arj=01;32:*.bz=01;32:*.bz2=01;32:*.cab=01;32:*.cpio=01;32:*.deb=01;32:*.dz=01;32:*.ear=01;32:*.gz=01;32:*.jar=01;32:*.lha=01;32:*.lrz=01;32:*.lz=01;32:*.lz4=01;32:*.lzh=01;32:*.lzma=01;32:*.lzo=01;32:*.rar=01;32:*.rpm=01;32:*.rz=01;32:*.sar=01;32:*.t7z=01;32:*.tar=01;32:*.taz=01;32:*.tbz=01;32:*.tbz2=01;32:*.tgz=01;32:*.tlz=01;32:*.txz=01;32:*.tz=01;32:*.tzo=01;32:*.tzst=01;32:*.war=01;32:*.xz=01;32:*.z=01;32:*.Z=01;32:*.zip=01;32:*.zoo=01;32:*.zst=01;32:*.aac=32:*.au=32:*.flac=32:*.m4a=32:*.mid=32:*.midi=32:*.mka=32:*.mp3=32:*.mpa=32:*.mpeg=32:*.mpg=32:*.ogg=32:*.opus=32:*.ra=32:*.wav=32:*.3des=01;35:*.aes=01;35:*.gpg=01;35:*.pgp=01;35:*.doc=32:*.docx=32:*.dot=32:*.odg=32:*.odp=32:*.ods=32:*.odt=32:*.otg=32:*.otp=32:*.ots=32:*.ott=32:*.pdf=32:*.ppt=32:*.pptx=32:*.xls=32:*.xlsx=32:*.app=01;36:*.bat=01;36:*.btm=01;36:*.cmd=01;36:*.com=01;36:*.exe=01;36:*.reg=01;36:*~=02;37:*.bak=02;37:*.BAK=02;37:*.log=02;37:*.log=02;37:*.old=02;37:*.OLD=02;37:*.orig=02;37:*.ORIG=02;37:*.swo=02;37:*.swp=02;37:*.bmp=32:*.cgm=32:*.dl=32:*.dvi=32:*.emf=32:*.eps=32:*.gif=32:*.jpeg=32:*.jpg=32:*.JPG=32:*.mng=32:*.pbm=32:*.pcx=32:*.pgm=32:*.png=32:*.PNG=32:*.ppm=32:*.pps=32:*.ppsx=32:*.ps=32:*.svg=32:*.svgz=32:*.tga=32:*.tif=32:*.tiff=32:*.xbm=32:*.xcf=32:*.xpm=32:*.xwd=32:*.xwd=32:*.yuv=32:*.anx=32:*.asf=32:*.avi=32:*.axv=32:*.flc=32:*.fli=32:*.flv=32:*.gl=32:*.m2v=32:*.m4v=32:*.mkv=32:*.mov=32:*.MOV=32:*.mp4=32:*.mpeg=32:*.mpg=32:*.nuv=32:*.ogm=32:*.ogv=32:*.ogx=32:*.qt=32:*.rm=32:*.rmvb=32:*.swf=32:*.vob=32:*.webm=32:*.wmv=32:"

# ------------------------ PLUGINS ---------------------

# starship
use ~/.cache/starship/init.nu

# zoxide
source ~/.zoxide.nu

# broot
source ~/.config/broot/launcher/nushell/br

# ------------------------ ALIASES ---------------------

# advcpmv (cp, mv alternative with progress bar)
alias acp = /usr/bin/advcp -g
alias amv = /usr/bin/advmv -g

def l [] { ls -a | sort-by type }
def la [] { ls -la | sort-by type }
def ld [] { ls -d | sort-by type }

# xplr
def --env xplr [] {
    let result = (^xplr)
    if not ($result | is-empty) {
        cd $result    
    }
}
alias xcd = xplr
alias x = xplr

# lazygit
alias lz = lazygit

# neovim
alias nv = nvim

# tere
def --env tere [] {
    let result = (^tere)
    if not ($result | is-empty) {
        cd $result    
    }
}


# walk
def --env walk [] {
    let result = (^walk --icons)
    if not ($result | is-empty) {
        cd $result    
    }
}

source /home/user/.config/broot/launcher/nushell/br
