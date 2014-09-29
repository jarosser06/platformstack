#
# Cookbook Name:: platformstack
# Recipe:: logging
#
# Copyright 2014. Rackspace, US Inc.
#

# This recipe *must* guard everything with node['platformstack']['elkstack_logging']['enabled']
enable_attr = node.deep_fetch('platformstack', 'elkstack_logging', 'enabled')
logging_enabled = !enable_attr.nil? && enable_attr # ensure this is binary logic, not nil
Chef::Log.info("Logging with ELK stack has enabled value of #{logging_enabled}")

# find central servers, if any
include_recipe 'elasticsearch::search_discovery'
elk_nodes = node['elasticsearch']['discovery']['zen']['ping']['unicast']['hosts']
found_elkstack = !elk_nodes.nil? && !elk_nodes.split(',').empty? # don't do anything unless we find nodes

if found_elkstack
  # configure runlist
  java_attr = node.deep_fetch('platformstack', 'elkstack_logging', 'java')
  include_recipe 'java' if java_attr.nil? || java_attr # java if unset or true

  # logstash already acts as an agent and server/non-agent on cluster boxes, so don't install it twice on those
  include_recipe 'elkstack::agent' unless node.recipe?('elkstack::logstash')
end
