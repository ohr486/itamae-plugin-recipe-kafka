require "spec_helper"

describe file("/etc/profile.d/kafka.sh") do
  it { should be_file }
  its(:content) { should match /2\.12-1\.0\.0/ }
end

describe file("/usr/local/kafka/config") do
  it { should be_directory }
end

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
