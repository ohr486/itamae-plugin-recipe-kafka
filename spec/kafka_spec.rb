require "spec_helper"

describe file("/etc/profile.d/kafka.sh") do
  it { should be_file }
  its(:content) { should match /2\.12-0\.11\.0\.0/ }
end
