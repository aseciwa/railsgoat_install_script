# change to personal folder
cd ~

# add PGP key, download rvm, install Ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -L https://get.rvm.io | bash -s stable --autolibs=3 --ruby=2.1.2
source /usr/local/rvm/scripts/rvm
rvm install ruby-2.1.5

# download Railsgoat, install it using Bundler
git clone https://github.com/OWASP/railsgoat.git
cd railsgoat
gem install bundler

# install MySQL, configure
sudo apt-get install -y mysql-server libmysqlclient-dev
gem install mysql2
sleep 10
bundle install
sleep 10
rake db:setup
sleep 10

# run Railsgoat, wait for it to configure, launch browser
rails server > /dev/null &
sleep 15
firefox http://127.0.0.1:3000
