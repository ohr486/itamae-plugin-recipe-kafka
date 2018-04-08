execute "# git clone zookeeper" do
  not_if "test -e /usr/local/src/zookeeper-el7-rpm"
  cwd "/usr/local/src"
  command "git clone https://github.com/id/zookeeper-el7-rpm.git"
end
