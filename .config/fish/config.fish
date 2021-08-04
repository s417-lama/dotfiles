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
set fish_color_normal         brwhite
set fish_color_command        white --bold
set fish_color_quote          yellow
set fish_color_redirection    blue
set fish_color_end            blue --bold
set fish_color_error          red --bold
set fish_color_param          brpurple
set fish_color_comment        white
set fish_color_selection      brwhite --bold --background brblack
set fish_color_operator       blue --bold
set fish_color_escape         green
set fish_color_autosuggestion white
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

# paths
set -gx PATH ~/.myscripts $PATH
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH /usr/local/cuda/bin $PATH
set -gx LD_LIBRARY_PATH /usr/local/cuda/lib64 $LD_LIBRARY_PATH
set -gx PATH ~/.isola/bin $PATH
set -gx PATH ~/.local/bin $PATH

# for NeoVim remote
set -gx NVIM_LISTEN_ADDRESS .nvim_comm.ignore

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
     \e[48;5;236m \e[48;5;174m\e[38;5;218m\u2584\e[38;5;132m\u2584\e[48;5;236m \e[49m  \e[38;5;236m\u2580\u2580            \e[38;5;174m- Mew -\e[39m\n"
end
