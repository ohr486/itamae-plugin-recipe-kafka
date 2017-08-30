# --- SETTINGS ---

kafka_version = node[:kafka][:version]
kafka_scala_version = node[:kafka][:kafka_scala_version]

directory "/usr/local/kafka" do
  mode "0755"
  owner "root"
  group "root"
end

template "/etc/profile.d/kafka.sh" do
  action :create
  source "templates/kafka.sh.erb"
  owner "root"
  group "root"
  mode "644"
  variables(kafka_path: "/usr/local/kafka/kafka_#{kafka_scala_version}-#{kafka_version}")
end

# --- INSTALL ---

execute "# get kafka tar" do
  not_if "test -e /usr/local/kafka/kafka_#{kafka_scala_version}-#{kafka_version}.tgz"
  cwd "/usr/local/kafka"
  command "wget -q http://apache.mirror.anlx.net/kafka/#{kafka_version}/kafka_#{kafka_scala_version}-#{kafka_version}.tgz"
end

execute "# unzip tar" do
  not_if "test -e /usr/local/kafka/kafka_#{kafka_scala_version}-#{kafka_version}"
  cwd "/usr/local/kafka"
  command "tar xzvf kafka_#{kafka_scala_version}-#{kafka_version}.tgz"
end
