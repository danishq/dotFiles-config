# ─── Locale ───────────────────────────────────────────
export LANG=en_IN.UTF-8
export LC_ALL=en_IN.UTF-8

# ─── Path ─────────────────────────────────────────────
export PATH="$HOME/.local/bin:/usr/local/bin:$PATH"

# ─── Java & Maven ─────────────────────────────────────
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export M2_HOME=/opt/apache-maven
export PATH="$JAVA_HOME/bin:$M2_HOME/bin:$PATH"

# ─── Conda Initialization ─────────────────────────────
# Fix for "conda is an alias" issue
unalias conda 2>/dev/null

__conda_setup="$('/home/danish/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/danish/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/danish/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/danish/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup



# ──────────────────────── Oh My Posh Prompt ────────────────────────────────
#eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh-theme/negligible_updated.omp.json)"
#eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh-theme/negligible.omp.json)"
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh-theme/night-owl.omp.json)"
#eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh-theme/sim-web.omp.json)"
#eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh-theme/easy-term.omp.json)"
#eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh-theme/froczh.omp.json)"
#eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh-theme/multiverse-neon.omp.json)"


# ─── Oh My Zsh Plugins ────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# ─── Zsh Options ───────────────────────────────────────
autoload -Uz compinit promptinit
compinit -d ~/.zcompdump-$HOST
promptinit

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# ─── Completion ────────────────────────────────────────
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ─── History Search with Arrows ────────────────────────
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ─── Cursor Shape ──────────────────────────────────────
export ZSH_TMUX_TERM=screen-256color

# ─── Aliases ───────────────────────────────────────────
alias cl='clear'
alias home='cd ~'
alias zshvim='cd ~ && nvim .zshrc'
alias resource='source ~/.zshrc'
alias spring='cd ~/Documents/Projects/springUdemy/ && nvim'
alias configvim='cd ~/.config/nvim/ && nvim'
alias condaenv='conda info --env'
alias condabase='conda deactivate && conda activate base'
alias st='speedtest'
alias mvnc='mvn compile'
alias gits='git status'
alias gpush='git push origin main'
alias i3bind='cat ~/Documents/LinuxCommandAndKeyBinds/keyBindsi3.txt'
alias aptpac='cat ~/Documents/LinuxCommandAndKeyBinds/apt_to_pacman_commands.txt'
alias mountmech='cd ~ && ./.mount.sh'
alias task='cd ~ && ./taskell'

# ─── NVM ───────────────────────────────────────────────
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ─── NVIM Custom Function ──────────────────────────────
function nvim() {
  setxkbmap -option caps:escape      # Remap Caps Lock to Escape
  command nvim "$@"                  # Launch Neovim with all arguments
  setxkbmap -option                  # Reset Caps Lock back to normal
}
