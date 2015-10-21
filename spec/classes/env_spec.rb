require 'spec_helper'

describe 'hadoop_lib::env' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "hadoop_lib class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('hadoop_lib::env') }
          it { is_expected.to contain_class('hadoop_lib::params') }

          it { is_expected.to contain_file('/etc/profile.d/hadoop.sh') }
          it { is_expected.to contain_file('/etc/profile.d/hadoop.csh') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'hadoop_lib class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_class('hadoop_lib::config') }.to raise_error(Puppet::Error, /Solaris.Nexenta not supported/) }
    end
  end
end
