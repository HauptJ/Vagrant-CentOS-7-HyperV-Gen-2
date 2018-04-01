# @Author: Haupt Joshua <HauptJ>
# @Date:   01-Apr-2018
# @Email:  josh@hauptj.com
# @Filename: config.rb
# @Last modified by:   HauptJ
# @Last modified time: 01-Apr-2018

$boxname = "hauptj/CentOS74"
$vmname = "CentOS74"

# NOTE: By default, at least 2 vcpus are required to compile OpenResty from source.
# SEE: group_vars/all.yml.example
# SEE: roles/ansible-role-openresty/defaults/main.yml
$vcpus = "4"

$vmem  = "4096"
