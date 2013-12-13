# Example usage (sets root user password to "password"):
# config.vm.provision :shell, :path => "shell-custom/user-password.sh", :args => "root password"

# $1 is username and $2 is the password.
echo "$1:$2" | chpasswd