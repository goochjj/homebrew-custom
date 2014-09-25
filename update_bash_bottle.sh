brew test-bot bash
for i in bash*.bottle*.tar.gz; do
  brew install ./$i
done
brew bottle --rb --root_url=http://debian.dok.org/homebrew/ bash
for i in bash-*.bottle.rb; do
  brew bottle --write --merge $i
done
scp bash-*.bottle*tar.gz dok_debian@debian.dok.org:~/debian.dok.org/homebrew/

