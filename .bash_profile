# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# Macvim in the default bash
export VIM_APP_DIR=/Applications

# Git Bash_completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Git autocompletion
source ~/.git-completion.bash

# Git completion show the current branch
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

alias gco='git co'
alias gci='git ci'
alias grb='git rb'

# Enable colors in bash
export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Gvim alias to macvim
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'

# Setup Amazon EC2 Command-Line Tools
# Installed via Homebrew
export JAVA_HOME=$(/usr/libexec/java_home)
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.7.1.0/libexec"

export PATH=$PATH:$EC2_HOME/bin

# source .monsoon_env
if [ -f ~/.monsoon_env ]
  then
	  source ~/.monsoon_env
    #echo "sourced ~/.monsoon_env"
fi

# source .kitchen_env
if [ -f ~/.kitchen_env ]
  then
	  source ~/.kitchen_env
	  #echo "sourced ~/.kitchen_env"
fi

# Burger prompt
export PS1="\w 🍔  "

# Fortune
fortune -s

#for go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# For packer.io
export PATH=${PATH}:~/bin

export PATH=.bundle/bin:${PATH}

eval "$(rbenv init -)"
export PATH="/usr/local/sbin:$PATH"
