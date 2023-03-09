# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Setting for the new UTF-8 terminal support in Lion
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

# location of history
export HISTFILE=~/.histfile

# number of lines kept in history
export HISTSIZE=1000000

# number of lines saved in the history after logout
export SAVEHIST=10000000
export EDITOR=vim

# remove the % at the cost of some empty lines over the prompt
# https://superuser.com/questions/645599/why-is-a-percent-sign-appearing-before-each-prompt-on-zsh-in-windows
setopt PROMPT_CR
setopt PROMPT_SP
export PROMPT_EOL_MARK=''

# emacs style key binding
bindkey -e

# chars as part of filename
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

# https://wiki.archlinux.org/title/zsh#Key_bindings
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
    autoload -Uz add-zle-hook-widget
    function zle_application_mode_start { echoti smkx }
    function zle_application_mode_stop { echoti rmkx }
    add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

#Disable core dumps
limit coredumpsize 0

# GNU Colors /etc/DIR_COLORS
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=10;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.wav=01;36:*.ogx=01;35:*.aac=01;36:*.au=01;36:*.flac=01;36:*.mid=01;36:*.midi=01;36:*.mka=01;36:*.mp3=01;36:*.mpc=01;36:*.ogg=01;36:*.ra=01;36:*.wma=01;36:*.axa=01;36:*.oga=01;36:*.spx=01;36:*.xspf=01;36:*.m4a=01;36:*.doc=00;33:*.docx=00;33:*.odt=00;33:*.pdf=00;33:*.html=00;33';
export LS_COLORS
export ZLSCOLORS="${LS_COLORS}"

# autoload colors
autoload colors zsh/terminfo
    if [[ "$terminfo[colors]" -ge 8 ]]; then
        colors
    fi

setopt AUTO_LIST
setopt MENU_COMPLETE
setopt AUTOCD
setopt CORRECT
setopt EXTENDEDGLOB
setopt HIST_IGNORE_ALL_DUPS

# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path .zcache
zstyle ':completion:*:cd:*' ignore-parents parent pwd

#Completion Options
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

# Path Expansion
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'
zstyle ':completion:*:*:*:default' menu yes select
zstyle ':completion:*:*:default' force-list always

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 2 numeric

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'

# Group matches and Describe
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'

# command alias
alias TEMPERATURA='curl -s https://air.linux365.ro | grep data-units= | sed "s/.*data-units=//g" | cut -f2 -d "\""'
alias ls='ls -aF --color=auto'
alias ll='ls -alhp --color=auto'
alias grep='grep --color=auto'
alias cp='cp -i'
alias mv='mv -i'
alias dus="du -csh"
alias duh="du -hc"
alias sp='sudo pacman'
alias suu='sudo pacman -Syyu'
alias sagu="sudo apt-get update"
alias saguu='sudo apt-get upgrade'
alias sacc='sudo apt-get autoclean && sudo apt-get autoremove && sudo apt-get clean'
alias sagi='sudo apt-get install'
alias sagr='sudo apt-get remove'
alias sagp='sudo apt-get purge'
alias snn='sudo nano'
alias scc='sudo pacman -Scc && sudo pacman-optimize'
alias acs='apt-cache search'
alias apt-pol='apt-cache policy'
alias avscan='clamscan -i --bytecode-unsigned=yes -r --detect-pua=yes --follow-dir-symlinks=2 --follow-file-symlinks=2'
alias 7z_ppmd='7z a -t7z -m0=ppmd -mx=9 -mo=32 -mmem=1024m -ms=on'
alias 7z_lzma='7z a -t7z -m0=lzma -mx=9 -mfb=273 -md=1024m -ms=on'
alias 7z_lzma2='7z a -t7z -m0=lzma2 -mx=9 -mfb=273 -md=1024m -ms=on'
alias sv='sudo vim'
alias -g '...'='../..'
alias -g '....'='../../..'
alias -g 'cd..'='cd ..'
alias -g C='|wc -l'
alias -g G='|grep -i'
alias -g H='|head'
alias -g Hl=' --help |& less -r'
alias -g L='|less'
alias -g R='| tr A-z N-za-m'
alias -g SL='| sort | less'
alias -g S='| sort'
alias -g T='|tail'
alias sshl='ssh -l cristian.stefanescu -i ~/.ssh/em_id_rsa'
alias sshr='ssh -l root -i ~/.ssh/em_id_rsa'
alias k='kubectl'
alias kns='kubens'
alias ktx='kubectx'

function docx(){
    if [ -f $1 ] ; then
    unzip -p $1 word/document.xml | sed -e 's/<[^>]\{1,\}>//g; s/[^[:print:]]\{1,\}//g'
    else
    echo "'$1' is not a valid file!"
    fi
}

# set path
path=(
  "$HOME/bin/"
  "$HOME/.bin/"
  "${KREW_ROOT:-$HOME/.krew}/bin"
  /usr/local/bin
  /usr/local/sbin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
  "$path[@]"
  "$fpath[@]"
)

[ -f ~/.iterm2_shell_integration.zsh ] && source ~/.iterm2_shell_integration.zsh

# zsh autosuggestion tune
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# load zgenom
ZGEN_CUSTOM_COMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump_$ZSH_VERSION"

source "${HOME}/.zgenom/zgenom.zsh"
ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)

# Check for plugin and zgenom updates every 7 days
# This does not increase the startup time.
zgenom autoupdate

# if the init script doesn't exist
if ! zgenom saved; then

    # specify plugins here
    zgenom load nviennot/zsh-vim-plugin
    zgenom load unixorn/autoupdate-zgenom
    zgenom ohmyzsh plugins/colored-man-pages
    zgenom ohmyzsh plugins/colorize
    zgenom ohmyzsh plugins/command-not-found
    zgenom ohmyzsh plugins/extract
    zgenom ohmyzsh plugins/fzf
    zgenom ohmyzsh plugins/genpass
    zgenom ohmyzsh plugins/rsync
    zgenom ohmyzsh plugins/screen
    zgenom ohmyzsh plugins/systemd
    zgenom ohmyzsh plugins/sudo
    zgenom ohmyzsh plugins/universalarchive
    zgenom load zsh-users/zsh-syntax-highlighting
    zgenom load zsh-users/zsh-autosuggestions
    zgenom load romkatv/powerlevel10k powerlevel10k

  # generate the init script from plugins above
    zgenom save
    zgenom compile "$HOME/.zshrc"
    zgenom compile "$HOME/.zsh"
    zgenom compile "$HOME/.zgenom"
    zgenom compile "$HOME/.p10k.zsh"
    zgenom compile "$HOME/.fzf.zsh"
    zgenom compile "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
zgenom compdef

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
