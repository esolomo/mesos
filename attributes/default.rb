default[:mesos] = {
  :type    => "mesosphere",
  :mesosphere => {
    :with_zookeeper => false
  },
  :version => "0.25.0",
  :prefix  => "/usr/local",
  :home => "/opt",
  :build   => {
    :skip_test => true
  },
  :master_ips => [],
  :slave_ips  => [],
  :master  => {
    :log_dir  => "/var/log/mesos",
    :work_dir => "/tmp/mesos",
    :port     => "5050"
  },
  :slave   => {
    :log_dir  => "/var/log/mesos",
    :work_dir => "/tmp/mesos",
    :attributes => "role:apps",
    :isolation => "cgroups/cpu,cgroups/mem"
  },
  :ssh_opts => "-o StrictHostKeyChecking=no -o ConnectTimeout=2",
  :deploy_with_sudo => "1"
}

default[:mesos][:mesosphere][:build_version] = value_for_platform(
  "ubuntu" => {
    "default" => "-0.2.70.ubuntu1404"
  },
  "default" => nil
)



default[:mesos][:slave][:cgroups_hierarchy] = value_for_platform(
  "centos" => {
    "default" => "/cgroup"
  },
  "default" => nil
)



