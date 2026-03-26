# Executed before .zshrc for all *login* shells.
# (Which is most shells on a Mac)
# For code run for all *interactive* shells, see .zshrc

# Apple's /etc/zprofile clobbers the $PATH set up by .zshenv
# so restore it here
source $HOME/.zshenv


# Added by Toolbox App
export PATH="$PATH:/Users/jbrewer/Library/Application Support/JetBrains/Toolbox/scripts"
