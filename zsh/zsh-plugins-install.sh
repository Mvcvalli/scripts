
#!/usr/bin/env bash

# Installing zsh syntax highlighting
cd ~/.config/zsh/plugins
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
cd ~

# Installing zsh autosuggestions
cd ~/.config/zsh/plugins
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/plugins/.zsh/zsh-autosuggestions
source ~/.config/zsh/plugins/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
cd ~

# Installing zsh You Should Use
cd ~/.config/zsh/plugins
git clone --depth 1 https://github.com/MichaelAquilina/zsh-you-should-use.git
source ~/.config/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
cd ~

# Installing Simple zsh calculator
cd ~/.config/zsh/plugins
git clone --depth 1 https://github.com/arzzen/calc.plugin.zsh
source ~/.config/zsh/plugins/calc.plugin.zsh/calc.plugin.zsh
cd ~

# Installing zsh abbreviations
cd ~/.config/zsh/plugins
git clone --depth 1 https://github.com/olets/zsh-abbr
source ~/.config/zsh/plugins/zsh-abbr/zsh-abbr.zsh
cd ~

# Installing zsh autopairs
cd ~/.config/zsh/plugins
git clone --depth 1 https://github.com/hlissner/zsh-autopair
source ~/.config/zsh/plugins/zsh-autopair/autopair.zsh
cd ~

