case node['platform_family']
when 'debian'
  include_recipe  'kubernetes_setup::debian'
when 'rhel', 'fedora'
  include_recipe  'kubernetes_setup::rhel'
end

# Include the common recipe
include_recipe "kubernetes_setup::common"