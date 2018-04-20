package 'tree' do
	action :install
end

package 'ntp' do
	action :install
end

package 'git' do
	action :install
end

file '/etc/motd' do
	content "
	This server is the property of Serhii Sytnikov \n
	
	IPADDRESS: #{node['ipaddress']}
	HOSTNAME: #{node['hostname']}
	TOTAL MEMORY: #{node['memory']['total']}
	CPU: #{node['cpu']['0']['mhz']} MHz
"
	owner 'root'
	group 'root'
	action :create	
end

service 'ntpd' do
	action [ :enable, :start ]
end
