# alias
#
function l --wraps='ls -la' --description 'alias l ls -la'
  ls -la $argv;
end

function lg --wraps=lazygit --description 'alias lg lazygit'
  lazygit  $argv;
end

function sudo --wraps='sudo -E' --description 'alias sudo sudo -E'
 command sudo -E $argv;
end

function ra --wraps=ranger --description 'alias ra ranger'
  ranger  $argv;
end

# 主题配置
function fish_prompt
  # Constants
  set -l last_command_status $status
  set -l rocket "\xF0\x9F\x9A\x80" 
  set -l house "\xF0\x9F\x8F\xA0" 
  set -l files "\xF0\x9F\x93\x81" 
  set -l open_files "\xF0\x9F\x93\x82" 
  set -l cap "\xF0\x9F\x8E\x93" 
  set -l ghost "\xF0\x9F\x91\xBB" 
  set -l wrench "\xF0\x9F\x94\xA7" 
  set -l hammer "\xF0\x9F\x94\xA8" 
  set -l smiling_face "\xF0\x9F\x98\x88" 
  set -l triangle "\xE2\x96\xB6" 
  set -l surfer "\xF0\x9F\x8F\x84" 
  set -l root_prompt    "#"
  set -l ahead          "↑"
  set -l behind         "↓"
  set -l diverged       "⥄ "
  set -l dirty          "*"

  # Color Constants
  set -l normal_color     (set_color --bold A1FF5E)
  set -l secondary_color (set_color --bold 5EFFB1)  
  set -l purple_color (set_color AA89FC)  
  set -l white_color (set_color --bold white)  
  set -l ssh_host_color (set_color --bold red)
  set -l repository_color (set_color magenta)
  set -l repository_icon_color (set_color cyan)
  set -l success_color    (set_color normal)
  set -l error_color      (set_color red)

  # User
  echo -ns $normal_color (whoami) $normal_color
  echo -ns -e $white_color "@"

  # Host
  if test $SSH_TTY
    echo -ns $ssh_host_color (echo $hostname) $normal_color
  else
    echo -ns $white_color (echo $hostname)
  end

  # Directory
  echo -ns -e $secondary_color $house
  echo -ns -e $normal_color (prompt_pwd)

  # Git repository
  __terlar_git_prompt
  fish_hg_prompt

  # Prompt
  echo -ns -e "\n"
  if test $last_command_status -eq 0
  	echo -ns -e $secondary_color $surfer 
  else
    echo -ns -e $error_color $surfer
  end
end
