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
end

service 'ntpd' do
	action [ :enable, :start ]
end
