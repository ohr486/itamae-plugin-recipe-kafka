# --- SETTINGS ---

ksql_version = node[:ksql][:version]

directory "/usr/local/ksql" do
  mode "0755"
  owner "root"
  group "root"
end

template "/etc/profile.d/ksql.sh" do
  action :create
  source "templates/ksql.sh.erb"
  owner "root"
  group "root"
  mode "644"
  variables(ksql_version: ksql_version)
end

# --- INSTALL ---

execute "# get ksql zip" do
  not_if "test -e /usr/local/ksql/#{ksql_version}.zip"
  cwd "/usr/local/ksql"
  command "wget -q https://github.com/confluentinc/ksql/archive/#{ksql_version}.zip"
end

execute "# unzip zip" do
  not_if "test -e /usr/local/ksql/ksql-#{ksql_version}"
  cwd "/usr/local/ksql"
  command "unzip #{ksql_version}.zip"
end

#execute "# build ksql" do
#  cwd "/usr/local/ksql/ksql-#{ksql_version}"
#  command "source /etc/profile.d/java.sh && \
#           source /etc/profile.d/kafka.sh && \
#           mvn clean compile install -DskipTests"
#end
