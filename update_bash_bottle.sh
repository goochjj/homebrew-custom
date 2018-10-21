export HOMEBREW_DEVELOPER=1
brew test-bot goochjj/custom/bash
#for i in bash*.bottle*.tar.gz; do
#  brew install ./$i
#done
brew bottle --root_url=http://debian.dok.org/homebrew/ goochjj/custom/bash
#for i in bash-*.bottle.rb; do
#  brew bottle --write --keep-old $i
#done
#scp bash-*.bottle*tar.gz dok_debian@debian.dok.org:~/debian.dok.org/homebrew/

#git push dok master:wizmods

