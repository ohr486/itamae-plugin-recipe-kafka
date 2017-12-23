# --- SETTINGS ---

kafka_version = node[:kafka][:version]
scala_version = node[:kafka][:scala_version]
kafka_config = node[:kafka][:config]

directory "/usr/local/kafka" do
  mode "0755"
  owner "root"
  group "root"
end

# --- INSTALL ---

execute "# get kafka tar" do
  not_if "test -e /usr/local/kafka/kafka_#{scala_version}-#{kafka_version}.tgz"
  cwd "/usr/local/kafka"
  command "wget -q http://apache.mirror.anlx.net/kafka/#{kafka_version}/kafka_#{scala_version}-#{kafka_version}.tgz"
end

execute "# unzip tar" do
  not_if "test -e /usr/local/kafka/kafka_#{scala_version}-#{kafka_version}"
  cwd "/usr/local/kafka"
  command "tar xzvf kafka_#{scala_version}-#{kafka_version}.tgz"
end
