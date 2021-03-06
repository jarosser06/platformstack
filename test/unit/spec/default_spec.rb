# Encoding: utf-8

require_relative 'spec_helper'

# this will pass on templatestack, fail elsewhere, forcing you to
# write those chefspec tests you always were avoiding
describe 'platformstack::default' do
  before { stub_resources }
  supported_platforms.each do |platform, versions|
    versions.each do |version|
      context "on #{platform.capitalize} #{version}" do
        let(:chef_run) do
          ChefSpec::Runner.new(platform: platform, version: version) do |node|
            node_resources(node)
          end.converge(described_recipe)

        end

        # we can use anything here to test it later
        _property = load_platform_properties(platform: platform, platform_version: version)

        it 'includes newrelic monitoring' do
          expect(chef_run).to include_recipe('newrelic::default')
        end

        it 'creates log resource to run default stuff last' do
          expect(chef_run).to write_log('run the default stuff last')
        end

        it 'creates ruby_block platformstack' do
          expect(chef_run).to run_ruby_block('platformstack')
        end
      end
    end
  end
end
