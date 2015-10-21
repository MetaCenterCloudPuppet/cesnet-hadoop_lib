require 'spec_helper'

describe 'hadoop_lib::jdbc', :type => :define do
  let(:title) { '/usr/lib/sentry/lib' }

  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "nothing" do
          let(:params) {{
            :db => nil
          }}
          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_hadoop_lib__jdbc('/usr/lib/sentry/lib') }
        end

        context "mysql" do
          let(:params) {{
            :db => 'mysql'
          }}

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_hadoop_lib__jdbc('/usr/lib/sentry/lib') }
          it { is_expected.to contain_file('/usr/lib/sentry/lib/mysql-connector-java.jar') }
        end

        context "postgresql" do
          let(:params) {{
            :db => 'postgresql'
          }}

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_hadoop_lib__jdbc('/usr/lib/sentry/lib') }
          it { is_expected.to contain_file('/usr/lib/sentry/lib/postgresql-jdbc.jar') }
        end
      end
    end
  end
end
