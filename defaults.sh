#!/bin/bash

set -e # Exit on error
set -u # Exit on undefined variable

d_domain="com.apple.Music"

defaults write $d_domain NSUserKeyEquivalents -dict-add "Add to Begining of Album" "^a"
defaults write $d_domain NSUserKeyEquivalents -dict-add "Add to Begining of Name" "^n"
defaults write $d_domain NSUserKeyEquivalents -dict-add "Append to Name" "$^n"
defaults write $d_domain NSUserKeyEquivalents -dict-add "Correct Genre" "@t"
defaults write $d_domain NSUserKeyEquivalents -dict-add "Correct Names" "@r"

defaults write $d_domain NSUserKeyEquivalents -dict-add "Number Tracks" "@^n"
defaults write $d_domain NSUserKeyEquivalents -dict-add "Rate Playing with 0" '@^0'
defaults write $d_domain NSUserKeyEquivalents -dict-add "Rate Playing with 1" '@^1'
defaults write $d_domain NSUserKeyEquivalents -dict-add "Rate Playing with 2" '@^2'
defaults write $d_domain NSUserKeyEquivalents -dict-add "Rate Playing with 3" '@^3'
defaults write $d_domain NSUserKeyEquivalents -dict-add "Rate Playing with 4" '@^4'
defaults write $d_domain NSUserKeyEquivalents -dict-add "Rate Playing with 5" '@^5'

defaults write $d_domain NSUserKeyEquivalents -dict-add "Rate Selection with 0" '@$0'
defaults write $d_domain NSUserKeyEquivalents -dict-add "Rate Selection with 1" '@$1'
defaults write $d_domain NSUserKeyEquivalents -dict-add "Rate Selection with 2" '@$2'
defaults write $d_domain NSUserKeyEquivalents -dict-add "Rate Selection with 3" '@$3'
defaults write $d_domain NSUserKeyEquivalents -dict-add "Rate Selection with 4" '@$4'
defaults write $d_domain NSUserKeyEquivalents -dict-add "Rate Selection with 5" '@$5'

defaults write $d_domain NSUserKeyEquivalents -dict-add "Replace in Name" "^r"
defaults write $d_domain NSUserKeyEquivalents -dict-add "Set Genre" "@g"
defaults write $d_domain NSUserKeyEquivalents -dict-add "Set Year" "@y"
