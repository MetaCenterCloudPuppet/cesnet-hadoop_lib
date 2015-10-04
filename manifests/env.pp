# == Class hadoop_lib::env
#
# Sets environment for Hadoop.
#
class hadoop_lib::env inherits ::hadoop_lib::params {
  $mapred_home = $::hadoop_lib::env::mapred_home
  file{'/etc/profile.d/hadoop.csh':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('hadoop_lib/hadoop.csh.erb'),
  }
  file{'/etc/profile.d/hadoop.sh':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('hadoop_lib/hadoop.sh.erb'),
  }
}
