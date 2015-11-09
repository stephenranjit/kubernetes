include_recipe "kubernetes_setup"

#Setup Minion
template "/etc/kubernetes/apiserver" do
  source "apiserver.erb"
end

template "/etc/kubernetes/config" do
  source "config.erb"
end

template "/etc/kubernetes/kubelet" do
  source "kubelet.erb"
end


%w[etcd kube-proxy kubelet docker].each do |service|
  service service do
    action [:enable,:start]
  end
end