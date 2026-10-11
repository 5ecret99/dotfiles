# ── oh-my-zsh ─────────────────────────────────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""                      # prompt comes from starship (below)
zstyle ':omz:update' mode reminder

# zsh-syntax-highlighting must stay last
plugins=(git you-should-use zsh-vi-mode zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ── environment ───────────────────────────────────────────────────────────
export EDITOR=nvim
export VISUAL=nvim
typeset -U path PATH              # no duplicate PATH entries
path=("$HOME/.local/bin" $path)

# ── history ───────────────────────────────────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=99999
SAVEHIST=99999
setopt SHARE_HISTORY              # share history between tmux panes/sessions
setopt HIST_IGNORE_ALL_DUPS       # keep only the latest copy of a command
setopt HIST_IGNORE_SPACE          # commands starting with a space aren't saved
setopt HIST_REDUCE_BLANKS

# ── shell behaviour ───────────────────────────────────────────────────────
setopt AUTO_CD                    # `repos` == `cd repos`
setopt INTERACTIVE_COMMENTS
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# ── tools ─────────────────────────────────────────────────────────────────
[[ -f ~/.aliases ]] && source ~/.aliases
command -v starship >/dev/null && eval "$(starship init zsh)"
command -v zoxide   >/dev/null && eval "$(zoxide init zsh)"
command -v fzf      >/dev/null && source <(fzf --zsh)
