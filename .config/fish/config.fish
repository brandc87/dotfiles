# disables "welcome to fish" greeting
set fish_greeting

set -gx EDITOR nvim

# PATH setup {{{
  set PATH "/opt/homebrew/bin" $PATH
  set PATH $HOME/.cargo/env $PATH
  set PATH $HOME/.cargo/bin $PATH
# }}}

# asdf setup {{{
  source /opt/homebrew/opt/asdf/libexec/asdf.fish
# }}}


source $HOME/.config/fish/fish_aliases
