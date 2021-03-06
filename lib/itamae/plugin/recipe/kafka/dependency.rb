%w(kafka kafka-*).each do |pkg|
  package pkg do
    action :remove
  end
end

%w(
  wget
  unzip
  java-1.8.0-openjdk-devel
  maven
  make
).each do |pkg|
  package pkg do
    action :install
  end
end

case node[:platform]
when "redhat", "fedra", "amazon"
  # TODO: add if need
else
  raise "Sorry, unsupported platfrom."
end
