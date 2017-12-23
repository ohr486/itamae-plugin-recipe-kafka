# --- SETTINGS ---

kafka_version = node[:kafka][:version]
scala_version = node[:kafka][:scala_version]
kafka_config = node[:kafka][:config]

# --- SYSTEMD ---

template "/etc/systemd/system/kafka-zookeeper.service" do
  action :create
  source "templates/systemd/kafka-zookeeper.service.erb"
  owner "root"
  group "root"
  mode "644"
  variables(scala_version: scala_version, kafka_version: kafka_version)
end

kafka_config[:kafka].keys.each do |host|
  template "/etc/systemd/system/kafka-broker#{kafka_config[:kafka][host][:id]}.service" do
    action :create
    source "templates/systemd/kafka-broker.service.erb"
    owner "root"
    group "root"
    mode "644"
    variables(
      host: host, kafka_config: kafka_config, id: kafka_config[:kafka][host][:id],
      scala_version: scala_version, kafka_version: kafka_version
    )
  end
end
