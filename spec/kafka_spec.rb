require "spec_helper"

describe file("/etc/profile.d/kafka.sh") do
  it { should be_file }
  its(:content) { should match /2\.12-1\.0\.0/ }
end

describe file("/usr/local/kafka/config") do
  it { should be_directory }
end

# zookeeper config

describe file("/usr/local/kafka/config/zookeeper.properties") do
  it { should be_file }
  its(:content) { should contain("dataDir=/tmp/zookeeper") }
  its(:content) { should contain("clientPort=2181") }
  its(:content) { should contain("maxClientCnxns=0") }
end

# broker config

describe file("/usr/local/kafka/config/broker1.properties") do
  it { should be_file }
  its(:content) { should contain("broker.id=1") }
  its(:content) { should contain("listeners=PLAINTEXT://host.broker1:9091") }
  its(:content) { should contain("zookeeper.connect=host.zookeeper:2181") }
end

describe file("/usr/local/kafka/config/broker2.properties") do
  it { should be_file }
  its(:content) { should contain("broker.id=2") }
  its(:content) { should contain("listeners=PLAINTEXT://host.broker2:9092") }
  its(:content) { should contain("zookeeper.connect=host.zookeeper:2181") }
end

describe file("/usr/local/kafka/config/broker3.properties") do
  it { should be_file }
  its(:content) { should contain("broker.id=3") }
  its(:content) { should contain("listeners=PLAINTEXT://host.broker3:9093") }
  its(:content) { should contain("zookeeper.connect=host.zookeeper:2181") }
end

# systemd

describe file("/etc/systemd/system/kafka-zookeeper.service") do
  it { should be_file }
  its(:content) { should contain("ExecStart=/usr/local/kafka/kafka_2.12-1.0.0/bin/zookeeper-server-start.sh /usr/local/kafka/config/zookeeper.properties") }
  its(:content) { should contain("ExecStop=/usr/local/kafka/kafka_2.12-1.0.0/bin/zookeeper-server-stop.sh") }
end

describe file("/etc/systemd/system/kafka-broker1.service") do
  it { should be_file }
  its(:content) { should contain("ExecStart=/usr/local/kafka/kafka_2.12-1.0.0/bin/kafka-server-start.sh /usr/local/kafka/config/broker1.properties") }
  its(:content) { should contain("ExecStop=/usr/local/kafka/kafka_2.12-1.0.0/bin/kafka-server-stop.sh") }
end

describe file("/etc/systemd/system/kafka-broker2.service") do
  it { should be_file }
  its(:content) { should contain("ExecStart=/usr/local/kafka/kafka_2.12-1.0.0/bin/kafka-server-start.sh /usr/local/kafka/config/broker2.properties") }
  its(:content) { should contain("ExecStop=/usr/local/kafka/kafka_2.12-1.0.0/bin/kafka-server-stop.sh") }
end

describe file("/etc/systemd/system/kafka-broker3.service") do
  it { should be_file }
  its(:content) { should contain("ExecStart=/usr/local/kafka/kafka_2.12-1.0.0/bin/kafka-server-start.sh /usr/local/kafka/config/broker3.properties") }
  its(:content) { should contain("ExecStop=/usr/local/kafka/kafka_2.12-1.0.0/bin/kafka-server-stop.sh") }
end
