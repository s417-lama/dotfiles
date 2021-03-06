#!/bin/sh

# hybrid

# HYBRID_PALETTE='#28282A2A2E2E:#A5A542424242:#8C8B94944040:#DEDE93935F5E:#5F5F81809D9D:#858467668F8F:#5E5E8D8D8787:#707078788080:#37373B3B4141:#CCCC66666666:#B5B5BDBD6868:#F0F0C6C57473:#8181A2A2BEBE:#B2B29494BBBB:#8A8ABEBEB7B7:#C5C5C8C8C6C6'
# HYBRID_FOREGROUND='#C5C5C8C8C6C6'
# HYBRID_BACKGROUND='#1D1D1F1F2121'

# dconf write /org/mate/terminal/profiles/default/palette \"$HYBRID_REDUCED_PALETTE\"
# dconf write /org/mate/terminal/profiles/default/foreground-color \"$HYBRID_REDUCED_FOREGROUND\"
# dconf write /org/mate/terminal/profiles/default/background-color \"$HYBRID_REDUCED_BACKGROUND\"

# hybrid (reduced contrast)

# HYBRID_REDUCED_PALETTE='#2D2D3C3B4646:#A5A542424242:#8C8B94944040:#DEDE93935F5E:#5F5F81809D9D:#858467668F8F:#5E5E8D8D8787:#6C6C7A798080:#424250505959:#CCCC66666666:#B5B5BDBD6868:#F0F0C6C57473:#8181A2A2BEBE:#B2B29494BBBB:#8A8ABEBEB7B7:#C5C5C8C8C6C6'
# HYBRID_REDUCED_FOREGROUND='#C5C5C8C8C6C6'
# HYBRID_REDUCED_BACKGROUND='#23232C2C3131'

# dconf write /org/mate/terminal/profiles/default/palette \"$HYBRID_REDUCED_PALETTE\"
# dconf write /org/mate/terminal/profiles/default/foreground-color \"$HYBRID_REDUCED_FOREGROUND\"
# dconf write /org/mate/terminal/profiles/default/background-color \"$HYBRID_REDUCED_BACKGROUND\"

# my color

MY_PALETTE='#3C3339:#CC6666:#8C9440:#C48459:#81A2BE:#B294BB:#8ABEB7:#6C7A80:#4D444A:#DA7575:#B5BD68:#DE935F:#93B2CD:#BB9FC3:#96C7C1:#CDD0CE'
MY_FOREGROUND='#CDD0CE'
MY_BACKGROUND='#232C31'

dconf write /org/mate/terminal/profiles/default/palette \"$MY_PALETTE\"
dconf write /org/mate/terminal/profiles/default/foreground-color \"$MY_FOREGROUND\"
dconf write /org/mate/terminal/profiles/default/background-color \"$MY_BACKGROUND\"
