# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#Klawisze
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey  "^[[2~"  overwrite-mode
bindkey  ";5D"  backward-word
bindkey  ";5C"  forward-word
bindkey  "^H"  backward-delete-word
bindkey  "5~"  kill-word
bindkey  "^[[5~"  up-line-or-history
bindkey  "^[[6~"  down-line-or-history

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/lukaszpe/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Created by `pipx` on 2024-03-06 18:35:54
export PATH="$PATH:/home/lukaszpe/.local/bin"

#StartCMD
lol()
{
    if [ -t 1 ]; then
        "$@" | lolcat
    else
        "$@"
    fi
}
#bind 'RETURN: "\e[1~lol \e[4~\n"'
COMMANDS=(ls cat neofetch git pwd)

# for COMMAND in "${COMMANDS[@]}"; do
#    alias "${COMMAND}=${COMMAND} | lolcat"
#    alias ".${COMMAND}=$(which ${COMMAND})"
# done

#Aliasy
SIGNAL='Wysyłam sygnał zakończenia akutalizacji.'
alias susu='sudo -i --preserve-env=HOME'
alias gn="cd /home/lukaszpe/Dokumenty/Obsidian/notatki"
alias gg="gn && git pull"
alias gz="git pull"
alias gw="git push"
alias ww="git add . && git commit -a --allow-empty-message -m '' && git push; exit"
alias wy="git add . && git commit -a --allow-empty-message -m '' && git push"
alias pakty="sudo pacman -Syyu --noconfirm; echo $SIGNAL; swaymsg  exec \"pkill -SIGRTMIN+10 waybar\" > /dev/null"
alias pakt="sudo pacman -Syyu; echo $SIGNAL; swaymsg  exec \"pkill -SIGRTMIN+10 waybar\" > /dev/null"
alias akty="sudo pacman -Syy --noconfirm; echo $SIGNAL; swaymsg  exec \"pkill -SIGRTMIN+10 waybar\" > /dev/null"
alias akt="sudo pacman -Syy; echo $SIGNAL; swaymsg  exec \"pkill -SIGRTMIN+10 waybar\" > /dev/null"
alias pyaykoy="yay -Syyu --noconfirm; echo $SIGNAL; swaymsg  exec \"pkill -SIGRTMIN+10 waybar\" > /dev/null"
alias pyayko="yay -Syyu; echo $SIGNAL; swaymsg  exec \"pkill -SIGRTMIN+10 waybar\" > /dev/null"
alias yaykoy="yay -Syy --noconfirm; echo $SIGNAL; swaymsg  exec \"pkill -SIGRTMIN+10 waybar\" > /dev/null"
alias yayko="yay -Syy; echo $SIGNAL; swaymsg  exec \"pkill -SIGRTMIN+10 waybar\" > /dev/null"
alias clfne='clear && neofetch && lol figlet "lukaszpe@EGM"'
alias clne="clear && neofetch"
clne
