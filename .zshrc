fpath=(/usr/local/share/zsh-completions $fpath)

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi
# Essential
source ~/.zplug/init.zsh
# Make sure you use double quotes
zplug "zsh-users/zsh-history-substring-search"
# Prohibit updates to a plugin by using the "frozen:" tag
zplug "k4rthik/git-cal", as:command, frozen:1
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "paulmelnikow/zsh-startup-timer"
zplug "tysonwolker/iterm-tab-colors"
zplug "desyncr/auto-ls"
zplug "momo-lab/zsh-abbrev-alias"
zplug "djui/alias-tips", from:github
zplug "modules/git", from:prezto
zplug "plugins/git-extras",  from:oh-my-zsh, as:plugin
zplug "plugins/history",  from:oh-my-zsh, as:plugin
#zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
#zplug "dracula/zsh", as:theme
zplug "bobthecow/git-flow-completion"
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug 'so-fancy/diff-so-fancy', \
      as:command, \
      use:'diff-so-fancy'
zplug 'nvie/gitflow', \
      if:"(($+commands[git]))", \
      as:command
zplug 'bobthecow/git-flow-completion'
zplug 'grossweber/git-some', \
      if:"(($+commands[git]))", \
      as:command, \
      use:'git-some'
zplug 'kamranahmedse/git-standup', \
      if:"(($+commands[git]))", \
      as:command, \
      use:'git-standup'

autoload -U promptinit; promptinit

# change the path color
zmodload zsh/nearcolor
zstyle :prompt:pure:git:branch color white
# turn on git stash status
zstyle :prompt:pure:git:stash show yes

# change the color for both `prompt:success` and `prompt:error`
zstyle ':prompt:pure:prompt:*' color cyan

# Install if jq is available
# Install packages tha have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load

# put this in your .bash_profile
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

###########################

# ~/.zshrc
precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}
GITHUB_ACCESS_TOKEN=4efbd1c06178f3d3e72411187a3330b7f46870c6
#70d802a7c8125deed62acf5845d668970361a4f1 
source $HOME/.aliases
export PATH=$PATH:/Users/smiteshpatel/Workspace/flutter/bin
export PATH="$HOME/bin/myscripts:$PATH"
export PATH="$HOME/.fastlane/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
export WRKSPC="~/workspace:$PATH"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH=/usr/local/php5/bin:$PATH
export CHARLES_HOME=/Applications/Charles.app/Contents/MacOS
export PATH=$PATH:$CHARLES_HOME
export PATH=$PATH:$HOME/dev/dotfiles/bin
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
# Set JAVA_HOME system environment variable value.
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
# Add java bin folder in PATH system environment variable value.
export PATH=$PATH:$JAVA_HOME/bin
