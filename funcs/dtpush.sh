echo "Here are the changes"

/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME status

sleep 2
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME add .
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME commit -m "Koontil Push"
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME push


