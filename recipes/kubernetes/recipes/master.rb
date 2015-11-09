#include_recipe "kubernetes_setup"

node_ip = node[:ipaddress]
node.default["master_ip"] = "#{node_ip}"

#Setup Master

%w[etcd kube-apiserver kube-controller-manager kube-scheduler].each do |service|
  service service do
    action [:enable,:start]
  end
end

template "/etc/kubernetes/apiserver" do
  source "apiserver.erb"
  notifies :restart, 'service[kube-apiserver]', :immediately
end

template "/etc/kubernetes/config" do
  source "config.erb"
  notifies :restart, 'service[kube-apiserver]', :immediately
end