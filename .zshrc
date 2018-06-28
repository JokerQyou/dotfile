# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
unset plugins
plugins+=(git)
[ -d $HOME/.oh-my-zsh/custom/plugins/k ] && plugins+=(k)
[ -d $HOME/.oh-my-zsh/custom/plugins/command-time ] && plugins+=(command-time)

# User configuration
ZSH_COMMAND_TIME_MSG="Execution time: %s"
ZSH_COMMAND_TIME_COLOR="cyan"

# Adjust PATH variable on different machine, by hostname
__HOSTNAME="`hostname`"
if [[ $__HOSTNAME == "zopen05" ]]; then
    export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games"
elif [[ $__HOSTNAME == "JokerdeMacBook-Pro.local" ]]; then
    export GOPATH=$HOME/Works/Go
    export PATH="/usr/local/opt/python/libexec/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$HOME/Tools:/Library/Frameworks/Python.framework/Versions/3.4/bin:$HOME/Tools/todo.txt"
    export PATH="${PATH}:$HOME/Library/Developer/Xamarin/android-sdk-macosx/platform-tools/:$GOPATH/bin"
    export PATH="${PATH}:$HOME/Library/Python/2.7/bin"

    alias st="subl"
    alias electron="/Applications/Electron.app/Contents/MacOS/Electron"

    pron () {
        export https_proxy=http://127.0.0.1:6152
        export http_proxy=http://127.0.0.1:6152
        echo "Proxy on"
    }

    proff () {
        unset https_proxy; unset http_proxy
        echo "Proxy off"
    }
elif [[ $__HOSTNAME == "pi" ]]; then # FIXME
    export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games"
else
    export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
fi

# Append additional binary location
if [[ -d "$HOME/.bin" ]]; then
    export PATH="$PATH:$HOME/.bin"
fi
if [[ -d "$HOME/.cargo/bin" ]]; then
    export PATH="$PATH:$HOME/.cargo/bin"
fi
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# Extra scripts to source
extra_scripts=("$HOME/.acme.sh/acme.sh.env" "$HOME/.fzf.zsh")
for i in $extra_scripts; do
    [ -f $i ] && source $i
done
# Source virtualenvwrapper.sh if any
if (( $+commands[virtualenvwrapper.sh] )) ; then
    source virtualenvwrapper.sh
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ff="find . -name"
alias pyfind="find -name \*.py|xargs grep --color -n"
alias pofind="find -name \*.po|xargs grep --color -n"
alias ptfind="find -name \*.pt|xargs grep --color -n"
alias zcmlfind="find -name \*.zcml|xargs grep -n --color"
[ -f /usr/local/bin/vim ] && alias vim="/usr/local/bin/vim" && alias vi=vim

# GPG agent settings
GPG_TTY=$(tty)
export GPG_TTY
if [ -f "$HOME/.gpg-agent-info" ]; then
    . "$HOME/.gpg-agent-info"
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
fi

