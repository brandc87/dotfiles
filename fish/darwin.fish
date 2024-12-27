# Homebrew
set -U brew_prefix /opt/homebrew

# asdf
source ~/.asdf/asdf.fish

# Don't show hints
set -x HOMEBREW_NO_ENV_HINTS true

# Mac specific paths
fish_add_path -aP $brew_prefix/bin

# Auto completion
if test -d "$brew_prefix/share/fish/completions"
    set -p fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d "$brew_prefix/share/fish/vendor_completions.d"
    set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

# Set the editor to Zed in ZED shell
if set -q ZED_TERM
    set -x EDITOR 'zed --wait'
end

function bup --description "Updates, upgrades and cleans Homebrew"
    brew update
    brew upgrade
    brew cleanup
end
