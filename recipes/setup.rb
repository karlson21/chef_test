package 'tree' do
	action :install
end

package 'ntp' do
	action :install
end

package 'git' do
	action :install
end

template '/etc/motd' do
	source 'motd.erb'
	owner 'root'
	group 'root'
	variables(
		:name => 'Chef'
	)
	action :create
end

service 'ntpd' do
	action [ :enable, :start ]
end
