# Example usage (will checkout 7.x-5.9 tag in drush repo):
# config.vm.provision :shell, :path => "shell-custom/drush.sh", :args => "7.x-5.9"

DRUSH_REPO_PATH="/usr/local/share/drush"

if [ -d "$DRUSH_REPO_PATH" ]; then
  echo 'Drush already installed'
  exit
fi

echo 'Installing drush'

git clone https://github.com/drush-ops/drush.git $DRUSH_REPO_PATH

cd $DRUSH_REPO_PATH
git checkout $1 -q

# Drush needs to write to lib directory when downloading external libraries
chown -R root:vagrant $DRUSH_REPO_PATH
chmod -R g+w $DRUSH_REPO_PATH

ln -s $DRUSH_REPO_PATH/drush /usr/local/bin/

echo 'Finished Installing drush'