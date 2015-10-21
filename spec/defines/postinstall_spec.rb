require 'spec_helper'

describe 'hadoop_lib::postinstall', :type => :define do
  let(:title) { 'hive' }
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "hadoop_lib::postinstall resource without any parameters" do
          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_hadoop_lib__postinstall('hive') }
        end

        if os =~ /debian.*/ or os =~ /ubuntu/ then
          context "has alternatives" do
            it { is_expected.to contain_alternatives('hive-conf') }
            it { is_expected.to contain_alternative_entry('/etc/hive/conf.cluster') }
          end
        end
      end
    end
  end
end
