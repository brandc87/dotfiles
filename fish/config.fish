# Hide greeting
set -U fish_greeting

# Use the default key bindings
fish_default_key_bindings

# System specific configuration
switch (uname)
    case Darwin
        . $HOME/.config/fish/darwin.fish
end

# Projects
set -x PROJECT_DIR "$HOME/Code"

# Shell variables
set -x SHELL fish
set -x EDITOR zed
set -x VISUAL zed --wait
set -x ALTERNATE_EDITOR vim

# Paths
fish_add_path -aP /bin
fish_add_path -aP /usr/bin
fish_add_path -aP /usr/local/bin

# Tree
abbr t1 'tree --dirsfirst -ChFL 1'
abbr t2 'tree --dirsfirst -ChFL 2'
abbr t3 'tree --dirsfirst -ChFL 3'

# Git shortcuts
abbr gc 'git commit'
abbr gs 'git status --ignore-submodules=dirty'
abbr gp 'git push origin HEAD'
abbr gf 'git pull origin HEAD'
abbr gu gitu

# Use eza for listing files
abbr l eza
abbr ls eza
abbr ll 'eza -l'
abbr llg 'eza -l --git'
abbr lll 'eza -la'

# Use bat because of syntax highlighting
if command -q bat
    abbr cat bat
    set -x BAT_THEME ansi
    set -x BAT_PAGER
    set -x COLORTERM truecolor
end

# Use Hydro as our prompt
set -g hydro_multiline true
set -g hydro_color_prompt $fish_color_normal
set -g hydro_color_git $fish_color_end
