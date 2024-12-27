DOTFILES := $(PWD)
UNAME := $(shell uname -s)

all:: fish ghostty zed

print-%: ; @echo $*=$($*)

zsh::
	@ln -fs $(DOTFILES)/zsh/zprofile				${HOME}/.zprofile
	@ln -fs $(DOTFILES)/zsh/zshrc					${HOME}/.zshrc
	@echo ZSH is symlinked.

fish::
	@test -d ${HOME}/.config || mkdir ${HOME}/.config	${HOME}/.config
	@ln -fns $(DOTFILES)/fish							${HOME}/.config/fish
	@printf "Please install fisher and run the following to install plugins: \n\n\
	\tfisher install jethrokuan/z \n\
	\tfisher install jorgebucaran/hydro \n\
	\tfisher install PatrickF1/fzf.fish \n\
	\tfisher install jorgebucaran/autopair.fish\n\n"
	@echo Fish is symlinked.

ghostty::
	@ln -fs $(DOTFILES)/ghostty						${HOME}/.config/ghostty
	@echo Ghostty is symlinked.

zed::
	@ln -fs $(DOTFILES)/zed							${HOME}/.config/zed
	@echo Zed is symlinked.
