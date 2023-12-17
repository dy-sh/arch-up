register /home/user/.config/nushell/nupm/plugins/bin/nu_plugin_clipboard  {
  "sig": {
    "name": "clipboard copy",
    "usage": "copy the input into the clipboard",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "disable-daemon",
        "short": "d",
        "arg": null,
        "required": false,
        "desc": "cause copy action to disable the daemon feature (open a process in background), this fixes some errors in some Desktop environments if you are OK without it don't use it",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [
      [
        "String",
        "String"
      ]
    ],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": []
}

register /home/user/.config/nushell/nupm/plugins/bin/nu_plugin_clipboard  {
  "sig": {
    "name": "clipboard paste",
    "usage": "outputs the current value in clipboard",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [
      [
        "Nothing",
        "String"
      ]
    ],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": []
}

register /home/user/.config/nushell/plugins/nu_plugin_emoji/target/release/nu_plugin_emoji  {
  "sig": {
    "name": "emoji",
    "usage": "Create emojis from text",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [
      {
        "name": "emoji-name",
        "desc": "name of the emoji shorthand with colons before and after e.g. :grinning:",
        "shape": "String",
        "var_id": null,
        "default_value": null
      }
    ],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "list",
        "short": "l",
        "arg": null,
        "required": false,
        "desc": "List stuff",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": [
    {
      "example": "emoji :smirk:",
      "description": "Show the smirk emoji",
      "result": null
    },
    {
      "example": "emoji --list",
      "description": "List all known emojis",
      "result": null
    }
  ]
}

register /home/user/.config/nushell/plugins/nu-plugin-highlight/target/release/nu_plugin_highlight  {
  "sig": {
    "name": "highlight",
    "usage": "Syntax highlight source code.",
    "extra_usage": "",
    "search_terms": [
      "syntax",
      "highlight",
      "highlighting"
    ],
    "required_positional": [],
    "optional_positional": [
      {
        "name": "language",
        "desc": "language or file extension to help language detection",
        "shape": "String",
        "var_id": null,
        "default_value": null
      }
    ],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "theme",
        "short": "t",
        "arg": "String",
        "required": false,
        "desc": "theme used for highlighting",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "list-themes",
        "short": null,
        "arg": null,
        "required": false,
        "desc": "list all possible themes",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [
      [
        "String",
        "String"
      ],
      [
        "Any",
        {
          "Table": [
            [
              "id",
              "String"
            ],
            [
              "name",
              "String"
            ],
            [
              "author",
              "String"
            ],
            [
              "default",
              "Bool"
            ]
          ]
        }
      ]
    ],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Strings"
  },
  "examples": [
    {
      "example": "open Cargo.toml -r | highlight toml",
      "description": "Highlight a toml file by its file extension",
      "result": null
    },
    {
      "example": "open src/main.rs | highlight Rust",
      "description": "Highlight a rust file by programming language",
      "result": null
    },
    {
      "example": "open example.sh | highlight",
      "description": "Highlight a bash script by inferring the language (needs shebang)",
      "result": null
    },
    {
      "example": "open Cargo.toml -r | highlight toml -t ansi",
      "description": "Highlight a toml file with another theme",
      "result": null
    },
    {
      "example": "highlight --list-themes",
      "description": "List all available themes",
      "result": null
    }
  ]
}

register /home/user/.config/nushell/plugins/nu_plugin_plot/target/release/nu_plugin_plot  {
  "sig": {
    "name": "hist",
    "usage": "Render an ASCII histogram from a list of values.",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "width",
        "short": null,
        "arg": "Number",
        "required": false,
        "desc": "The maximum width of the plot.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "height",
        "short": null,
        "arg": "Number",
        "required": false,
        "desc": "The maximum height of the plot.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "title",
        "short": "t",
        "arg": "String",
        "required": false,
        "desc": "Provide a title to the plot.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "bins",
        "short": null,
        "arg": "Number",
        "required": false,
        "desc": "The number of bins in the histogram, default is 20.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "legend",
        "short": "l",
        "arg": null,
        "required": false,
        "desc": "Plot a tiny, maybe useful legend.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "bars",
        "short": "b",
        "arg": null,
        "required": false,
        "desc": "Change lines to bars.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "steps",
        "short": "s",
        "arg": null,
        "required": false,
        "desc": "Change lines to steps.",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": []
}

register /home/user/.config/nushell/plugins/nu_plugin_net/target/release/nu_plugin_net  {
  "sig": {
    "name": "net",
    "usage": "List network interfaces",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": []
}

register /home/user/.config/nushell/nupm/plugins/bin/nu_plugin_desktop_notifications  {
  "sig": {
    "name": "notify",
    "usage": "sends notification with given parameters",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "summary",
        "short": "s",
        "arg": "String",
        "required": false,
        "desc": "summary of the notification",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "body",
        "short": "t",
        "arg": "String",
        "required": false,
        "desc": "body of the notification",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "subtitle",
        "short": null,
        "arg": "String",
        "required": false,
        "desc": "subtitle of the notification [macOS only]",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "app-name",
        "short": "a",
        "arg": "String",
        "required": false,
        "desc": "app name of the notification",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "icon",
        "short": "i",
        "arg": "Filepath",
        "required": false,
        "desc": "path to the icon of the notification",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "timeout",
        "short": null,
        "arg": "Duration",
        "required": false,
        "desc": "duration of the notification [XDG Desktops only] (defaults to system default)",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "crash-on-error",
        "short": null,
        "arg": "Filepath",
        "required": false,
        "desc": "returns notification error if encountered",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": []
}

register /home/user/.config/nushell/plugins/nu_plugin_plot/target/release/nu_plugin_plot  {
  "sig": {
    "name": "plot",
    "usage": "Render an ASCII plot from a list of values.",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "width",
        "short": null,
        "arg": "Number",
        "required": false,
        "desc": "The maximum width of the plot.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "height",
        "short": null,
        "arg": "Number",
        "required": false,
        "desc": "The maximum height of the plot.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "title",
        "short": "t",
        "arg": "String",
        "required": false,
        "desc": "Provide a title to the plot.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "legend",
        "short": "l",
        "arg": null,
        "required": false,
        "desc": "Plot a tiny, maybe useful legend.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "bars",
        "short": "b",
        "arg": null,
        "required": false,
        "desc": "Change lines to bars.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "steps",
        "short": "s",
        "arg": null,
        "required": false,
        "desc": "Change lines to steps.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "points",
        "short": "p",
        "arg": null,
        "required": false,
        "desc": "Change lines to points.",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": []
}

register /home/user/.config/nushell/nupm/plugins/bin/nu_plugin_port_list  {
  "sig": {
    "name": "port list",
    "usage": "list all active connections (TCP+UDP)",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "disable-ipv4",
        "short": "6",
        "arg": null,
        "required": false,
        "desc": "do not fetch ipv6 connections (ipv6 only)",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "disable-ipv6",
        "short": "4",
        "arg": null,
        "required": false,
        "desc": "do not fetch ipv4 connections (ipv4 only)",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "disable-udp",
        "short": "t",
        "arg": null,
        "required": false,
        "desc": "do not fetch UDP connections (TCP only)",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "disable-tcp",
        "short": "u",
        "arg": null,
        "required": false,
        "desc": "do not fetch TCP connections (UDP only)",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "process-info",
        "short": "p",
        "arg": null,
        "required": false,
        "desc": "loads process info (name, cmd, binary path)",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Network"
  },
  "examples": []
}

register /home/user/.config/nushell/nupm/plugins/bin/nu_plugin_port_scan  {
  "sig": {
    "name": "port scan",
    "usage": "The `port scan` command serves a similar purpose to the `nc -vz {ip} {port}` command,\nIt allows you to detect open ports on a target and provides valuable information about the connection time.",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [
      {
        "name": "target IP",
        "desc": "target IP address to check for open port",
        "shape": "String",
        "var_id": null,
        "default_value": null
      },
      {
        "name": "port",
        "desc": "port to be checked",
        "shape": "Int",
        "var_id": null,
        "default_value": null
      }
    ],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "timeout",
        "short": "t",
        "arg": "Duration",
        "required": false,
        "desc": "time before giving up the connection. (default: 60 Seconds)",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Network"
  },
  "examples": [
    {
      "example": "port scan 8.8.8.8 53 -t 1sec",
      "description": "this will create a Tcp connection to port 53 on 8.8.8.8 (Google's public dns) and return the connection time",
      "result": {
        "Record": {
          "val": {
            "cols": [
              "address",
              "port",
              "result",
              "is_open",
              "elapsed"
            ],
            "vals": [
              {
                "String": {
                  "val": "8.8.8.8",
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              },
              {
                "Int": {
                  "val": 53,
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              },
              {
                "String": {
                  "val": "Open",
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              },
              {
                "Bool": {
                  "val": true,
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              },
              {
                "Int": {
                  "val": 40,
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              }
            ]
          },
          "internal_span": {
            "start": 0,
            "end": 0
          }
        }
      }
    },
    {
      "example": "port scan 8.8.8.8 54 -t 1sec",
      "description": "this will create a Tcp connection to port 54 on 8.8.8.8 (Google's public dns). this will result in an error",
      "result": {
        "Record": {
          "val": {
            "cols": [
              "address",
              "port",
              "result",
              "is_open",
              "elapsed"
            ],
            "vals": [
              {
                "String": {
                  "val": "8.8.8.8",
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              },
              {
                "Int": {
                  "val": 54,
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              },
              {
                "String": {
                  "val": "Closed",
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              },
              {
                "Bool": {
                  "val": false,
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              },
              {
                "Int": {
                  "val": 1000,
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              }
            ]
          },
          "internal_span": {
            "start": 0,
            "end": 0
          }
        }
      }
    },
    {
      "example": "7880..8000 | each { |it| port scan 127.0.0.1 $it -t 1ms } | where result == Open",
      "description": "This command will scan any port from 7880 to 8000 on localhost and return open ports in range",
      "result": null
    }
  ]
}

register /home/user/.config/nushell/plugins/nu_plugin_regex/target/release/nu_plugin_regex  {
  "sig": {
    "name": "regex",
    "usage": "Parse input with a regular expression",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [
      {
        "name": "pattern",
        "desc": "the regular expression to use",
        "shape": "String",
        "var_id": null,
        "default_value": null
      }
    ],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [
      [
        "String",
        {
          "Table": []
        }
      ]
    ],
    "allow_variants_without_examples": true,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": [
    {
      "example": "\"hello world\" | regex '(?P<first>\\w+) (?P<second>\\w+)'",
      "description": "Parse a string with a regular expression",
      "result": null
    }
  ]
}

register /home/user/.config/nushell/nupm/plugins/bin/nu_plugin_audio_hook  {
  "sig": {
    "name": "sound",
    "usage": "a nushell plugin that can make noise, read audio file's metadata and play audio files",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Default"
  },
  "examples": [
    {
      "example": "sound make 1000 200ms",
      "description": "create a simple noise frequency",
      "result": null
    },
    {
      "example": "[ 300.0, 500.0,  1000.0, 400.0, 600.0 ] | each { |it| sound make $it 150ms }",
      "description": "create a simple noise sequence",
      "result": null
    },
    {
      "example": "sound play audio.mp4 -d 5min",
      "description": "play a sound and exits after 5min",
      "result": null
    },
    {
      "example": "sound meta audio.mp4 | sound play audio.mp3 -d $in.duration",
      "description": "play a sound for its duration",
      "result": null
    },
    {
      "example": "sound meta set audio.mp3 -k TPE1 -v new-artist",
      "description": "set artist of `audio.mp3` to `new-artist`",
      "result": null
    }
  ]
}

register /home/user/.config/nushell/nupm/plugins/bin/nu_plugin_audio_hook  {
  "sig": {
    "name": "sound beep",
    "usage": "play a beep sound",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": []
}

register /home/user/.config/nushell/nupm/plugins/bin/nu_plugin_audio_hook  {
  "sig": {
    "name": "sound make",
    "usage": "creates a noise with given frequency and duration",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [
      {
        "name": "Frequency",
        "desc": "Frequency of the noise",
        "shape": "Float",
        "var_id": null,
        "default_value": null
      },
      {
        "name": "duration",
        "desc": "duration of the noise",
        "shape": "Duration",
        "var_id": null,
        "default_value": null
      }
    ],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "amplify",
        "short": "a",
        "arg": "Float",
        "required": false,
        "desc": "amplify the sound by given value",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": [
    {
      "example": "sound make 1000 200ms",
      "description": "create a simple noise frequency",
      "result": null
    },
    {
      "example": "[ 300.0, 500.0,  1000.0, 400.0, 600.0 ] | each { |it| sound make $it 150ms }",
      "description": "create a simple noise sequence",
      "result": null
    }
  ]
}

register /home/user/.config/nushell/nupm/plugins/bin/nu_plugin_audio_hook  {
  "sig": {
    "name": "sound meta",
    "usage": "get duration and meta data of an audio file",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [
      {
        "name": "File Path",
        "desc": "file to play",
        "shape": "Filepath",
        "var_id": null,
        "default_value": null
      }
    ],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": []
}

register /home/user/.config/nushell/nupm/plugins/bin/nu_plugin_audio_hook  {
  "sig": {
    "name": "sound meta list",
    "usage": "list of all id3 frame",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": []
}

register /home/user/.config/nushell/nupm/plugins/bin/nu_plugin_audio_hook  {
  "sig": {
    "name": "sound meta set",
    "usage": "set a id3 frame on an audio file",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [
      {
        "name": "File Path",
        "desc": "file to update",
        "shape": "Filepath",
        "var_id": null,
        "default_value": null
      }
    ],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "key",
        "short": "k",
        "arg": "String",
        "required": true,
        "desc": "id3 key",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "value",
        "short": "v",
        "arg": "String",
        "required": true,
        "desc": "id3 value",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": []
}

register /home/user/.config/nushell/nupm/plugins/bin/nu_plugin_audio_hook  {
  "sig": {
    "name": "sound play",
    "usage": "play an audio file, by default supports flac,Wav,mp3 and ogg files, install plugin with `all-decoders` feature to include aac and mp4(audio)",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [
      {
        "name": "File Path",
        "desc": "file to play",
        "shape": "Filepath",
        "var_id": null,
        "default_value": null
      }
    ],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "duration",
        "short": "d",
        "arg": "Duration",
        "required": false,
        "desc": "duration of file (mandatory for non-wave formats like mp3) (default 1 hour)",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": [
    {
      "example": "sound play audio.mp4 -d 5min",
      "description": "play a sound and exits after 5min",
      "result": null
    },
    {
      "example": "sound meta audio.mp4 | sound play audio.mp3 -d $in.duration",
      "description": "play a sound for its duration",
      "result": null
    }
  ]
}

register /home/user/.config/nushell/plugins/nu_plugin_units/target/release/nu_plugin_units  {
  "sig": {
    "name": "units",
    "usage": "Convert between units",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "category",
        "short": "c",
        "arg": "String",
        "required": true,
        "desc": "specify the category",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "unit",
        "short": "u",
        "arg": "String",
        "required": true,
        "desc": "specify the unit type",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "value",
        "short": "v",
        "arg": "Float",
        "required": true,
        "desc": "specify the value",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Generators"
  },
  "examples": []
}

register /home/user/.config/nushell/plugins/nu_plugin_plot/target/release/nu_plugin_plot  {
  "sig": {
    "name": "xyplot",
    "usage": "Render an ASCII xy plot from a list of values.",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "width",
        "short": null,
        "arg": "Number",
        "required": false,
        "desc": "The maximum width of the plot.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "height",
        "short": null,
        "arg": "Number",
        "required": false,
        "desc": "The maximum height of the plot.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "title",
        "short": "t",
        "arg": "String",
        "required": false,
        "desc": "Provide a title to the plot.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "legend",
        "short": "l",
        "arg": null,
        "required": false,
        "desc": "Plot a tiny, maybe useful legend.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "bars",
        "short": "b",
        "arg": null,
        "required": false,
        "desc": "Change lines to bars.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "steps",
        "short": "s",
        "arg": null,
        "required": false,
        "desc": "Change lines to steps.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "points",
        "short": "p",
        "arg": null,
        "required": false,
        "desc": "Change lines to points.",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": []
}

