export HOMEBREW_DEVELOPER=1
brew test-bot goochjj/custom/bash
#for i in bash*.bottle*.tar.gz; do
#  brew install ./$i
#done
brew bottle --root-url=https://github.com/goochjj/homebrew-custom/releases/download/4.4.23.deb3 goochjj/custom/bash
#for i in bash-*.bottle.rb; do
#  brew bottle --write --keep-old $i
#done
#scp bash-*.bottle*tar.gz dok_debian@debian.dok.org:~/debian.dok.org/homebrew/

#git push dok master:wizmods

