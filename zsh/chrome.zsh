# Chromium Fun stuff
export GYP_DEFINES="component=shared_library fastbuild=1"
alias make_="time caffeinate ninja -C ~/Code/chrome-dev/src/out/Release chrome"
alias go_="~/Code/chrome-dev/src/out/Release/Chromium.app/Contents/MacOS/Chromium --no-default-browser-check --disable-hang-monitor"
alias tests="time caffeinate ninja -C ~/Code/chrome-dev/src/out/Release unit_tests browser_tests"
alias fixit="~/Code/chrome-dev/src/build/gyp_chromium"

# Exporting depot_tools
export PATH=$PATH:~/code/depot_tools

# For pulling tip-of-tree
alias freshenup="git checkout master && git pull && gclient sync" 
alias halp="echo 'freshenup; make_; go_; fixit'"
