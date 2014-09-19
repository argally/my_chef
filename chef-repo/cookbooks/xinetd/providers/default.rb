action :add do
  cfg = {
    'name' => new_resource.name,
    'description' => new_resource.description,
    'user' => new_resource.user,
    'server' => new_resource.server,
    'server_args' => new_resource.server_args,
    'per_source' => new_resource.per_source,
    'cps' => new_resource.cps,
    'flags' => new_resource.flags,
    'port' => new_resource.port,
    'type' => new_resource.type,
    'instances' => new_resource.instances,
    'only_from' => new_resource.only_from
 }

  case new_resource.disable
  when true, 'yes', 1
    cfg['disable'] = 'yes'
  when false, 'no', 0
    cfg['disable'] = 'no'
  else
    raise "Unknown value for :disable \"#{new_resource.disable}\"!"
  end

  case new_resource.wait
  when true, 'yes', 1
    cfg['wait'] = 'yes'
  when false, 'no', 0
    cfg['wait'] = 'no'
  else
    raise "Unknown value for :wait \"#{new_resource.wait}\"!"
  end

  case new_resource.protocol
  when 'udp'
    cfg['socket_type']  = 'dgram'
    cfg['protocol']     = 'udp'
  when 'tcp'
    cfg['socket_type']  = 'stream'
    cfg['protocol']     = 'tcp'
  else
    raise "Unknown protocol \"#{new_resource.protocol}\"!"
  end

  unless ::File.exists?(new_resource.server)
    raise "#{new_resource.server} does not exist!"
  end

  template "/etc/xinetd.d/#{new_resource.name}" do
    cookbook 'xinetd'
    source 'conf.erb'
    mode 00644
    variables cfg
    notifies :reload, resources(:service => "xinetd")
  end

  new_resource.updated_by_last_action(true)
end

action :delete do
  template "/etc/xinetd.d/#{new_resource.name}" do
    cookbook 'xinetd'
    action :delete
    notifies :reload, resources(:service => "xinetd")
  end

  new_resource.updated_by_last_action(true)
end