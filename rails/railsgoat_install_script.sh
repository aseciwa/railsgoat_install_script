# change to personal folder
cd ~

# add PGP key, download rvm, install Ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -L https://get.rvm.io | bash -s stable --ruby
source ~/usr/local/rvm/scripts/rvm
rvm get stable --autolibs=enable
rvm install ruby-2.2.3
rvm --default use ruby-2.2.3
ruby -v
sleep 10

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
rails server -p 8080 > /dev/null &
sleep 15
firefox http://127.0.0.1:8080
