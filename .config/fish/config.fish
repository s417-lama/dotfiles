function fish_mode_prompt
end

function fish_user_key_bindings
  for mode in insert default visual
    fish_default_key_bindings -M $mode
  end
  fish_vi_key_bindings --no-erase
  bind -M insert -m default \cj force-repaint backward-char
  bind -M insert \co 'commandline -i \ \\\\\n'

  # prevent exit by pressing Ctrl-D
  bind -M insert \cd backward-char delete-char
end

function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
  set -l last_status $status

  set -l cyan (set_color cyan)
  set -l yellow (set_color yellow)
  set -l red (set_color red)
  set -l blue (set_color blue)
  set -l green (set_color green)
  set -l magenta (set_color magenta)
  set -l normal (set_color normal)

  set -l cwd $magenta(pwd | sed "s:^$HOME:~:")

  # Output the prompt, left to right

  # Add a newline before new prompts
  echo -e ''

  # Display [venvname] if in a virtualenv
  if set -q VIRTUAL_ENV
      echo -n -s (set_color -b cyan black) '[' (basename "$VIRTUAL_ENV") ']' $normal ' '
  end

  # Print pwd or full path
  echo -n -s $cwd $normal

  # Show git branch and status
  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)

    if [ (_git_is_dirty) ]
      set git_info $yellow $git_branch " *" $normal
    else
      set git_info $blue $git_branch $normal
    end
    echo -n -s ' · ' $git_info $normal
  end

  set -l prompt_color $normal
  switch $fish_bind_mode
    case default
      set prompt_color $yellow
    case insert
      set prompt_color $normal
    case replace-one
      set prompt_color $blue
    case visual
      set prompt_color $red
  end

  # Terminate with a nice prompt char
  echo -e ''
  echo -e -n -s $prompt_color '⟩ ' $normal
end

# colors
set fish_color_normal         brwhite --italics
set fish_color_command        white --bold --italics
set fish_color_quote          yellow --italics
set fish_color_redirection    blue --italics
set fish_color_end            blue --bold --italics
set fish_color_error          red --italics
set fish_color_param          brwhite --italics
set fish_color_comment        white --italics
set fish_color_selection      brwhite --bold --background brblack --italics
set fish_color_operator       blue --bold --italics
set fish_color_escape         green --bold --italics
set fish_color_autosuggestion white --italics
set fish_color_cancel         yellow --bold --background brblack

set fish_pager_color_progress    yellow --bold --background brblack
set fish_pager_color_background  brblack
set fish_pager_color_prefix      write --bold --underline
set fish_pager_color_completion  brwhite
set fish_pager_color_description green

# set color for man
set -xU LESS_TERMCAP_md (printf "\e[01;35m") # magenta
set -xU LESS_TERMCAP_me (printf "\e[0m")
set -xU LESS_TERMCAP_se (printf "\e[0m")
set -xU LESS_TERMCAP_so (printf "\e[01;40;33m") # yellow
set -xU LESS_TERMCAP_ue (printf "\e[0m")
set -xU LESS_TERMCAP_us (printf "\e[01;34m") # blue

# set color for ls (no bold style)
set -gx LS_COLORS 'rs=0:di=34:ln=36:mh=00:pi=40;33:so=35:do=35:bd=40;33:cd=40;33:or=40;31:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=32:*.tar=31:*.tgz=31:*.arc=31:*.arj=31:*.taz=31:*.lha=31:*.lz4=31:*.lzh=31:*.lzma=31:*.tlz=31:*.txz=31:*.tzo=31:*.t7z=31:*.zip=31:*.z=31:*.dz=31:*.gz=31:*.lrz=31:*.lz=31:*.lzo=31:*.xz=31:*.zst=31:*.tzst=31:*.bz2=31:*.bz=31:*.tbz=31:*.tbz2=31:*.tz=31:*.deb=31:*.rpm=31:*.jar=31:*.war=31:*.ear=31:*.sar=31:*.rar=31:*.alz=31:*.ace=31:*.zoo=31:*.cpio=31:*.7z=31:*.rz=31:*.cab=31:*.wim=31:*.swm=31:*.dwm=31:*.esd=31:*.jpg=35:*.jpeg=35:*.mjpg=35:*.mjpeg=35:*.gif=35:*.bmp=35:*.pbm=35:*.pgm=35:*.ppm=35:*.tga=35:*.xbm=35:*.xpm=35:*.tif=35:*.tiff=35:*.png=35:*.svg=35:*.svgz=35:*.mng=35:*.pcx=35:*.mov=35:*.mpg=35:*.mpeg=35:*.m2v=35:*.mkv=35:*.webm=35:*.webp=35:*.ogm=35:*.mp4=35:*.m4v=35:*.mp4v=35:*.vob=35:*.qt=35:*.nuv=35:*.wmv=35:*.asf=35:*.rm=35:*.rmvb=35:*.flc=35:*.avi=35:*.fli=35:*.flv=35:*.gl=35:*.dl=35:*.xcf=35:*.xwd=35:*.yuv=35:*.cgm=35:*.emf=35:*.ogv=35:*.ogx=35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*.pdf=35:'

# paths
set -gx PATH ~/.myscripts $PATH
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH /usr/local/cuda/bin $PATH
set -gx LD_LIBRARY_PATH /usr/local/cuda/lib64 $LD_LIBRARY_PATH
set -gx PATH ~/.isola/bin $PATH
set -gx PATH ~/.local/bin $PATH

# for NeoVim remote
set -gx NVIM_LISTEN_ADDRESS .nvim_comm.ignore

# bat
set -gx BAT_THEME base16

# fzf
set -gx FZF_DEFAULT_COMMAND "fd --type f --color=always"
set -gx FZF_DEFAULT_OPTS "--layout=reverse --inline-info --color=16 --ansi"
fzf_configure_bindings --directory=\ct --git_log=\cg
function fzf --wraps=fzf --description="Use fzf-tmux if in tmux session"
  if set --query TMUX
    fzf-tmux -p 80% $argv
  else
    command fzf $argv
  end
end

function fish_greeting
  printf "\e[49m       \e[38;5;236m\u2584\e[48;5;236m\e[38;5;132m\u2584\e[38;5;174m\u2584\u2584\u2584\e[38;5;132m\u2584\e[49m\e[38;5;236m\u2584
        \u2580\e[48;5;132m\u2584\e[48;5;174m\u2584\e[38;5;132m\u2584  \e[48;5;236m\e[38;5;174m\u2584\u2584\u2584\e[49m\e[38;5;236m\u2584\u2584
           \u2580\u2580\u2580\u2580\u2580\u2580\e[48;5;174m\u2584\e[48;5;132m\u2584\e[48;5;236m\e[38;5;132m\u2584\e[38;5;239m\u2584\e[49m\e[38;5;236m\u2584
                \u2584\u2584 \u2580\e[48;5;132m\u2584\e[48;5;239m\e[38;5;132m\u2584\e[48;5;236m \e[49m
          \e[38;5;236m\u2584\e[48;5;236m\e[38;5;218m\u2584\e[38;5;132m\u2584\e[49m\e[38;5;236m\u2584\e[48;5;236m\e[38;5;218m\u2584\u2584\e[48;5;174m\e[38;5;132m\u2584\e[48;5;239m\e[38;5;174m\u2584\e[48;5;236m\e[38;5;239m\u2584\e[38;5;132m\u2584\e[48;5;239m\u2584\e[48;5;132m\e[38;5;236m\u2584\e[49m\u2580
       \u2584\u2584\u2584\e[48;5;236m \e[48;5;174m\e[38;5;218m\u2584\e[48;5;218m \e[38;5;132m\u2584   \e[48;5;217m\e[38;5;174m\u2584\e[48;5;236m \e[49m\e[38;5;236m\u2580\u2580
  \u2584\u2584\e[48;5;236m\e[38;5;174m\u2584\u2584\e[38;5;132m\u2584\e[48;5;132m\e[38;5;236m\u2584\u2584\e[48;5;239m\u2584\e[48;5;174m \e[48;5;231m \e[48;5;69m\u2584\e[48;5;231m\u2584\e[48;5;132m \e[48;5;218m  \e[48;5;174m\e[38;5;218m\u2584\e[48;5;217m \e[48;5;236m \e[49m
 \e[48;5;236m \e[48;5;239m\e[38;5;174m\u2584\e[48;5;174m\e[38;5;236m\u2584\e[49m\u2580\u2580\u2580\u2584\u2584\u2584\e[48;5;236m\e[38;5;174m\u2584\e[48;5;174m\e[38;5;132m\u2584\e[48;5;231m\e[38;5;174m\u2584\e[48;5;69m\u2584\e[48;5;218m   \e[48;5;217m\u2584\e[48;5;236m \e[49m
\e[48;5;236m \e[48;5;174m \e[48;5;236m \e[49m   \e[38;5;236m\u2580\e[48;5;174m\u2584\e[48;5;218m\e[38;5;239m\u2584\e[38;5;174m\u2584\e[48;5;174m\e[38;5;218m\u2584\u2584\e[48;5;239m\e[38;5;174m\u2584\e[48;5;236m \e[49m\e[38;5;236m\u2580\e[48;5;174m\u2584\u2584\e[49m\u2580
\u2580\e[48;5;239m\u2584\e[48;5;174m\e[38;5;239m\u2584\e[48;5;236m\e[38;5;174m\u2584\e[49m\e[38;5;236m\u2584\u2584\u2584\e[48;5;236m\e[38;5;218m\u2584\e[48;5;218m  \e[48;5;132m \e[48;5;218m \e[48;5;239m \e[48;5;174m \e[48;5;236m \e[49m
  \e[38;5;236m\u2580\u2580\e[48;5;132m\u2584\u2584\e[48;5;239m\e[38;5;174m\u2584\e[48;5;174m\e[38;5;132m\u2584\e[48;5;218m\e[38;5;239m\u2584\e[48;5;132m\e[38;5;236m\u2584\e[48;5;174m\u2584\e[48;5;239m \e[38;5;132m\u2584\e[48;5;236m \e[49m
     \e[48;5;236m \e[48;5;174m\e[38;5;218m\u2584\e[38;5;132m\u2584\e[48;5;236m \e[49m  \e[38;5;236m\u2580\u2580            \e[38;5;174m\e[3m- Mew -\e[39m\n"
end
