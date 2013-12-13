# Example usage:
# config.vm.provision :shell, :path => "shell-custom/vhosts.sh", :args => "/srv/www/ff/vhosts ff.se.80"

VHOST_LOCATION="/etc/apache2/sites-enabled"

# Usually sites-enabled is emptied when provisioning but nothing is impossible..
if [ -h "$VHOST_LOCATION/$2" ]; then
  echo "$2 already added to $VHOST_LOCATION"
  exit
fi

echo "Symlinking $1/$2 to $VHOST_LOCATION"
ln -s $1/$2 /etc/apache2/sites-enabled