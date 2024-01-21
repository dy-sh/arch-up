if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish | source
end

# disable greeting
set -g fish_greeting

# color threme
fish_config theme choose Nord

# set color for ls and other command
# iceberg-dark theme from vivid themes - https://github.com/sharkdp/vivid/tree/master/themes
set -Ux LS_COLORS "*~=0;38;2;107;112;137:bd=0;38;2;137;184;194;48;2;54;56;74:ca=0:cd=0;38;2;173;160;211;48;2;54;56;74:di=0;38;2;132;160;198:do=0;38;2;30;33;50;48;2;173;160;211:ex=1;38;2;226;120;120:fi=0:ln=0;38;2;173;160;211:mh=0:mi=0;38;2;30;33;50;48;2;226;120;120:no=0:or=0;38;2;30;33;50;48;2;226;120;120:ow=0:pi=0;38;2;30;33;50;48;2;132;160;198:rs=0:sg=0:so=0;38;2;30;33;50;48;2;173;160;211:st=0:su=0:tw=0:*.a=1;38;2;226;120;120:*.c=0;38;2;180;190;130:*.d=0;38;2;180;190;130:*.h=0;38;2;180;190;130:*.m=0;38;2;180;190;130:*.o=0;38;2;107;112;137:*.p=0;38;2;180;190;130:*.r=0;38;2;180;190;130:*.t=0;38;2;180;190;130:*.z=4;38;2;137;184;194:*.7z=4;38;2;137;184;194:*.as=0;38;2;180;190;130:*.bc=0;38;2;107;112;137:*.bz=4;38;2;137;184;194:*.cc=0;38;2;180;190;130:*.cp=0;38;2;180;190;130:*.cr=0;38;2;180;190;130:*.cs=0;38;2;180;190;130:*.di=0;38;2;180;190;130:*.el=0;38;2;180;190;130:*.ex=0;38;2;180;190;130:*.fs=0;38;2;180;190;130:*.go=0;38;2;180;190;130:*.gv=0;38;2;180;190;130:*.gz=4;38;2;137;184;194:*.hh=0;38;2;180;190;130:*.hi=0;38;2;107;112;137:*.hs=0;38;2;180;190;130:*.jl=0;38;2;180;190;130:*.js=0;38;2;180;190;130:*.ko=1;38;2;226;120;120:*.kt=0;38;2;180;190;130:*.la=0;38;2;107;112;137:*.ll=0;38;2;180;190;130:*.lo=0;38;2;107;112;137:*.md=0;38;2;226;164;120:*.ml=0;38;2;180;190;130:*.mn=0;38;2;180;190;130:*.nb=0;38;2;180;190;130:*.pl=0;38;2;180;190;130:*.pm=0;38;2;180;190;130:*.pp=0;38;2;180;190;130:*.ps=0;38;2;226;120;120:*.py=0;38;2;180;190;130:*.rb=0;38;2;180;190;130:*.rm=0;38;2;173;160;211:*.rs=0;38;2;180;190;130:*.sh=0;38;2;180;190;130:*.so=1;38;2;226;120;120:*.td=0;38;2;180;190;130:*.ts=0;38;2;180;190;130:*.ui=0;38;2;226;164;120:*.vb=0;38;2;180;190;130:*.wv=0;38;2;173;160;211:*.xz=4;38;2;137;184;194:*.aif=0;38;2;173;160;211:*.ape=0;38;2;173;160;211:*.apk=4;38;2;137;184;194:*.arj=4;38;2;137;184;194:*.asa=0;38;2;180;190;130:*.aux=0;38;2;107;112;137:*.avi=0;38;2;173;160;211:*.awk=0;38;2;180;190;130:*.bag=4;38;2;137;184;194:*.bak=0;38;2;107;112;137:*.bat=1;38;2;226;120;120:*.bbl=0;38;2;107;112;137:*.bcf=0;38;2;107;112;137:*.bib=0;38;2;226;164;120:*.bin=4;38;2;137;184;194:*.blg=0;38;2;107;112;137:*.bmp=0;38;2;173;160;211:*.bsh=0;38;2;180;190;130:*.bst=0;38;2;226;164;120:*.bz2=4;38;2;137;184;194:*.c++=0;38;2;180;190;130:*.cfg=0;38;2;226;164;120:*.cgi=0;38;2;180;190;130:*.clj=0;38;2;180;190;130:*.com=1;38;2;226;120;120:*.cpp=0;38;2;180;190;130:*.css=0;38;2;180;190;130:*.csv=0;38;2;226;164;120:*.csx=0;38;2;180;190;130:*.cxx=0;38;2;180;190;130:*.deb=4;38;2;137;184;194:*.def=0;38;2;180;190;130:*.dll=1;38;2;226;120;120:*.dmg=4;38;2;137;184;194:*.doc=0;38;2;226;120;120:*.dot=0;38;2;180;190;130:*.dox=0;38;2;180;190;130:*.dpr=0;38;2;180;190;130:*.elc=0;38;2;180;190;130:*.elm=0;38;2;180;190;130:*.epp=0;38;2;180;190;130:*.eps=0;38;2;173;160;211:*.erl=0;38;2;180;190;130:*.exe=1;38;2;226;120;120:*.exs=0;38;2;180;190;130:*.fls=0;38;2;107;112;137:*.flv=0;38;2;173;160;211:*.fnt=0;38;2;173;160;211:*.fon=0;38;2;173;160;211:*.fsi=0;38;2;180;190;130:*.fsx=0;38;2;180;190;130:*.gif=0;38;2;173;160;211:*.git=0;38;2;107;112;137:*.gvy=0;38;2;180;190;130:*.h++=0;38;2;180;190;130:*.hpp=0;38;2;180;190;130:*.htc=0;38;2;180;190;130:*.htm=0;38;2;226;164;120:*.hxx=0;38;2;180;190;130:*.ico=0;38;2;173;160;211:*.ics=0;38;2;226;120;120:*.idx=0;38;2;107;112;137:*.ilg=0;38;2;107;112;137:*.img=4;38;2;137;184;194:*.inc=0;38;2;180;190;130:*.ind=0;38;2;107;112;137:*.ini=0;38;2;226;164;120:*.inl=0;38;2;180;190;130:*.ipp=0;38;2;180;190;130:*.iso=4;38;2;137;184;194:*.jar=4;38;2;137;184;194:*.jpg=0;38;2;173;160;211:*.kex=0;38;2;226;120;120:*.kts=0;38;2;180;190;130:*.log=0;38;2;107;112;137:*.ltx=0;38;2;180;190;130:*.lua=0;38;2;180;190;130:*.m3u=0;38;2;173;160;211:*.m4a=0;38;2;173;160;211:*.m4v=0;38;2;173;160;211:*.mid=0;38;2;173;160;211:*.mir=0;38;2;180;190;130:*.mkv=0;38;2;173;160;211:*.mli=0;38;2;180;190;130:*.mov=0;38;2;173;160;211:*.mp3=0;38;2;173;160;211:*.mp4=0;38;2;173;160;211:*.mpg=0;38;2;173;160;211:*.nix=0;38;2;226;164;120:*.odp=0;38;2;226;120;120:*.ods=0;38;2;226;120;120:*.odt=0;38;2;226;120;120:*.ogg=0;38;2;173;160;211:*.org=0;38;2;226;164;120:*.otf=0;38;2;173;160;211:*.out=0;38;2;107;112;137:*.pas=0;38;2;180;190;130:*.pbm=0;38;2;173;160;211:*.pdf=0;38;2;226;120;120:*.pgm=0;38;2;173;160;211:*.php=0;38;2;180;190;130:*.pid=0;38;2;107;112;137:*.pkg=4;38;2;137;184;194:*.png=0;38;2;173;160;211:*.pod=0;38;2;180;190;130:*.ppm=0;38;2;173;160;211:*.pps=0;38;2;226;120;120:*.ppt=0;38;2;226;120;120:*.pro=0;38;2;180;190;130:*.ps1=0;38;2;180;190;130:*.psd=0;38;2;173;160;211:*.pyc=0;38;2;107;112;137:*.pyd=0;38;2;107;112;137:*.pyo=0;38;2;107;112;137:*.rar=4;38;2;137;184;194:*.rpm=4;38;2;137;184;194:*.rst=0;38;2;226;164;120:*.rtf=0;38;2;226;120;120:*.sbt=0;38;2;180;190;130:*.sql=0;38;2;180;190;130:*.sty=0;38;2;107;112;137:*.svg=0;38;2;173;160;211:*.swf=0;38;2;173;160;211:*.swp=0;38;2;107;112;137:*.sxi=0;38;2;226;120;120:*.sxw=0;38;2;226;120;120:*.tar=4;38;2;137;184;194:*.tbz=4;38;2;137;184;194:*.tcl=0;38;2;180;190;130:*.tex=0;38;2;180;190;130:*.tgz=4;38;2;137;184;194:*.tif=0;38;2;173;160;211:*.tml=0;38;2;226;164;120:*.tmp=0;38;2;107;112;137:*.toc=0;38;2;107;112;137:*.tsx=0;38;2;180;190;130:*.ttf=0;38;2;173;160;211:*.txt=0;38;2;226;164;120:*.vcd=4;38;2;137;184;194:*.vim=0;38;2;180;190;130:*.vob=0;38;2;173;160;211:*.wav=0;38;2;173;160;211:*.wma=0;38;2;173;160;211:*.wmv=0;38;2;173;160;211:*.xcf=0;38;2;173;160;211:*.xlr=0;38;2;226;120;120:*.xls=0;38;2;226;120;120:*.xml=0;38;2;226;164;120:*.xmp=0;38;2;226;164;120:*.yml=0;38;2;226;164;120:*.zip=4;38;2;137;184;194:*.zsh=0;38;2;180;190;130:*.zst=4;38;2;137;184;194:*TODO=1:*hgrc=0;38;2;180;190;130:*.bash=0;38;2;180;190;130:*.conf=0;38;2;226;164;120:*.dart=0;38;2;180;190;130:*.diff=0;38;2;180;190;130:*.docx=0;38;2;226;120;120:*.epub=0;38;2;226;120;120:*.fish=0;38;2;180;190;130:*.flac=0;38;2;173;160;211:*.h264=0;38;2;173;160;211:*.hgrc=0;38;2;180;190;130:*.html=0;38;2;226;164;120:*.java=0;38;2;180;190;130:*.jpeg=0;38;2;173;160;211:*.json=0;38;2;226;164;120:*.less=0;38;2;180;190;130:*.lisp=0;38;2;180;190;130:*.lock=0;38;2;107;112;137:*.make=0;38;2;180;190;130:*.mpeg=0;38;2;173;160;211:*.opus=0;38;2;173;160;211:*.orig=0;38;2;107;112;137:*.pptx=0;38;2;226;120;120:*.psd1=0;38;2;180;190;130:*.psm1=0;38;2;180;190;130:*.purs=0;38;2;180;190;130:*.rlib=0;38;2;107;112;137:*.sass=0;38;2;180;190;130:*.scss=0;38;2;180;190;130:*.tbz2=4;38;2;137;184;194:*.tiff=0;38;2;173;160;211:*.toml=0;38;2;226;164;120:*.webm=0;38;2;173;160;211:*.webp=0;38;2;173;160;211:*.woff=0;38;2;173;160;211:*.xbps=4;38;2;137;184;194:*.xlsx=0;38;2;226;120;120:*.yaml=0;38;2;226;164;120:*.cabal=0;38;2;180;190;130:*.cache=0;38;2;107;112;137:*.class=0;38;2;107;112;137:*.cmake=0;38;2;180;190;130:*.dyn_o=0;38;2;107;112;137:*.ipynb=0;38;2;180;190;130:*.mdown=0;38;2;226;164;120:*.patch=0;38;2;180;190;130:*.scala=0;38;2;180;190;130:*.shtml=0;38;2;226;164;120:*.swift=0;38;2;180;190;130:*.toast=4;38;2;137;184;194:*.xhtml=0;38;2;226;164;120:*README=0;38;2;22;24;33;48;2;226;164;120:*passwd=0;38;2;226;164;120:*shadow=0;38;2;226;164;120:*.config=0;38;2;226;164;120:*.dyn_hi=0;38;2;107;112;137:*.flake8=0;38;2;180;190;130:*.gradle=0;38;2;180;190;130:*.groovy=0;38;2;180;190;130:*.ignore=0;38;2;180;190;130:*.matlab=0;38;2;180;190;130:*COPYING=0;38;2;130;133;151:*INSTALL=0;38;2;22;24;33;48;2;226;164;120:*LICENSE=0;38;2;130;133;151:*TODO.md=1:*.desktop=0;38;2;226;164;120:*.gemspec=0;38;2;180;190;130:*Doxyfile=0;38;2;180;190;130:*Makefile=0;38;2;180;190;130:*TODO.txt=1:*setup.py=0;38;2;180;190;130:*.DS_Store=0;38;2;107;112;137:*.cmake.in=0;38;2;180;190;130:*.fdignore=0;38;2;180;190;130:*.kdevelop=0;38;2;180;190;130:*.markdown=0;38;2;226;164;120:*.rgignore=0;38;2;180;190;130:*COPYRIGHT=0;38;2;130;133;151:*README.md=0;38;2;22;24;33;48;2;226;164;120:*configure=0;38;2;180;190;130:*.gitconfig=0;38;2;180;190;130:*.gitignore=0;38;2;180;190;130:*.localized=0;38;2;107;112;137:*.scons_opt=0;38;2;107;112;137:*CODEOWNERS=0;38;2;180;190;130:*Dockerfile=0;38;2;226;164;120:*INSTALL.md=0;38;2;22;24;33;48;2;226;164;120:*README.txt=0;38;2;22;24;33;48;2;226;164;120:*SConscript=0;38;2;180;190;130:*SConstruct=0;38;2;180;190;130:*.gitmodules=0;38;2;180;190;130:*.synctex.gz=0;38;2;107;112;137:*.travis.yml=0;38;2;180;190;130:*INSTALL.txt=0;38;2;22;24;33;48;2;226;164;120:*LICENSE-MIT=0;38;2;130;133;151:*MANIFEST.in=0;38;2;180;190;130:*Makefile.am=0;38;2;180;190;130:*Makefile.in=0;38;2;107;112;137:*.applescript=0;38;2;180;190;130:*.fdb_latexmk=0;38;2;107;112;137:*CONTRIBUTORS=0;38;2;22;24;33;48;2;226;164;120:*appveyor.yml=0;38;2;180;190;130:*configure.ac=0;38;2;180;190;130:*.clang-format=0;38;2;180;190;130:*.gitattributes=0;38;2;180;190;130:*.gitlab-ci.yml=0;38;2;180;190;130:*CMakeCache.txt=0;38;2;107;112;137:*CMakeLists.txt=0;38;2;180;190;130:*LICENSE-APACHE=0;38;2;130;133;151:*CONTRIBUTORS.md=0;38;2;22;24;33;48;2;226;164;120:*.sconsign.dblite=0;38;2;107;112;137:*CONTRIBUTORS.txt=0;38;2;22;24;33;48;2;226;164;120:*requirements.txt=0;38;2;180;190;130:*package-lock.json=0;38;2;107;112;137:*.CFUserTextEncoding=0;38;2;107;112;137"

# prompt
starship init fish | source

# change VSCode file/folder picker to KDE default 
set -Ux GTK_USE_PORTAL 1

# set nvim as default editor
set -Ux EDITOR nvim

# advcpmv (cp, mv alternative with progress bar)
alias cp '/usr/bin/advcp -g'
alias mv '/usr/bin/advmv -g'

# exa (ls alternative with colors)
alias ls 'exa --group-directories-first --group --classify --git'
alias l 'exa --icons --group-directories-first --group --classify --git -la'
alias la 'exa --icons --group-directories-first --group --classify --git -la'
alias ld 'exa --icons --group-directories-first --group --classify --git -la --total-size --sort=size --reverse'


# lazygit
alias lz lazygit

# neovim
alias nv nvim

# set TERM variable if TMUX 
# (by default it is tmux-256color, but some apps wont work with if, for example gotop)
if test -n "$TMUX"
    # echo "xterm-256color"
    set -Ux TERM xterm-256color
end




# navigate bu walk util (cd on quit from walk)
# run "walk" to naviagate
function walk
    set --local result (command walk $argv)
    [ -n "$result" ] && cd -- "$result"
end


# navigate bu xplr (cd on quit from tere)
# run "xcd" or "xplr" to naviagate
function xplr
    set --local result (command xplr $argv)
    [ -n "$result" ] && cd -- "$result"
end
function xcd
    set output (xplr --print-pwd-as-result)
    if test $status -eq 0
        cd "$output"
    end
end
alias x xcd


# this varian will go to home if xplr will return error (exited tirh Q key)
# function xcd
#     cd (xplr --print-pwd-as-result)
# end

# br - broot
function br --wraps=broot
    set -l cmd_file (mktemp)
    if broot --outcmd $cmd_file $argv
        read --local --null cmd <$cmd_file
        rm -f $cmd_file
        eval $cmd
    else
        set -l code $status
        rm -f $cmd_file
        return $code
    end
end


# yazi
function yazi
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    command yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
alias ya yazi


# zoxide
zoxide init fish | source
