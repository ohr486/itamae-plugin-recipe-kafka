# --- SETTINGS ---

kafka_version = node[:kafka][:version]
scala_version = node[:kafka][:scala_version]
kafka_config = node[:kafka][:config]

directory "/usr/local/kafka" do
  mode "0755"
  owner "root"
  group "root"
end

directory "/usr/local/kafka/config" do
  mode "0755"
  owner "root"
  group "root"
end

kafka_config[:kafka].keys.each do |host|
  template "/usr/local/kafka/config/broker#{kafka_config[:kafka][host][:id]}.properties" do
    action :create
    source "templates/config/broker.properties.erb"
    owner "root"
    group "root"
    mode "644"
    variables(host: host, kafka_config: kafka_config)
  end
end

template "/usr/local/kafka/config/zookeeper.properties" do
  action :create
  source "templates/config/zookeeper.properties.erb"
  owner "root"
  group "root"
  mode "644"
end

template "/etc/profile.d/kafka.sh" do
  action :create
  source "templates/kafka.sh.erb"
  owner "root"
  group "root"
  mode "644"
  variables(kafka_path: "/usr/local/kafka/kafka_#{scala_version}-#{kafka_version}")
end
