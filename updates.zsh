
#!/bin/zsh
#TODO update for zsh env
sleep 1
#Homebrew is a third-party package manager
#If brew is not installed uncomment the next line or copy/paste it into a new term
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#Upgrade ohmyzsh
omz update
sleep 1
ECHO Updating and upgrading Homebrew packages...
brew upgrade && sleep 1
#HBB casks updater here
ECHO Updating Homebrew Casks...Enter Administrator password if prompted...
sleep 1
brew cask upgrade
sleep 1
#Atom IDE upgrade phase begins here
ECHO Updating Atom packages...
apm upgrade --no-confirm
sleep 1
ECHO Checking for macOS system, security, and core App updates...
sleep 1
#sudo is required for softwareupdate
tput bel & afplay /System/Library/Sounds/Glass.aiff & ECHO Please enter Administrator password:
#softwareupdate is Apple's CLI update utility
sudo softwareupdate --verbose -ia
# commenting out 26-31 until mas is fixed...
#ECHO Checking and updating App Store Apps...
#mas-cli is a Homebrew package which updates third-party App Store apps
#mas outdated & sleep 60
#mas upgrade
#sleep 1
#Software update phase ends here
afplay /System/Library/Sounds/Glass.aiff & ECHO Updates complete!
sleep 1
#Reboot prompt begins here
tput bel & read -r -p "Would you like to reboot? [y/N] " response
  if [[ "$response" =~ ^([yY][eE]|[yY])+$ ]]
    then
      ECHO Please enter Administrator password if prompted:
      #wait 1
      sudo shutdown -r +1 & ECHO Rebooting...
      exit 0
    else
      ECHO Done!
  fi
#Reboot prompt ends here
#end of script
