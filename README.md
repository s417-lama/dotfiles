# Setup

Install:
- fish
    - Install fisher: https://github.com/jorgebucaran/fisher
    - Install fish-async-prompt
        - `fisher install acomagu/fish-async-prompt`
- neovim
- tmux
- fzf
    - Install fzf.fish via fisher
        - `fisher install PatrickF1/fzf.fish`
    - Install the following commands:
        - bat: https://github.com/sharkdp/bat
        - fd: https://github.com/sharkdp/fd
        - rg: https://github.com/BurntSushi/ripgrep

Font:
- Install fontforge
    - http://designwithfontforge.com/en-US/Installing_Fontforge.html
- Running `patch_fonts.sh` will install PlemolJP with terminal glyphs attached
    - PremolJP: https://github.com/yuru7/PlemolJP
    - Modify `fonts/terminal-glyph-patcher/terminal-glyph-patcher.py` if needed and run the script again
