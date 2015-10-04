# == Class hadoop_lib::params
#
# This class sets variables according to platform.
#
class hadoop_lib::params {
  case "${::osfamily}-${::operatingsystem}" {
    /RedHat-Fedora/: {
      $mapred_home = '/usr/share/hadoop/mapreduce/'
    }
    /Debian|RedHat/: {
      $mapred_home = '/usr/lib/hadoop-mapreduce'
    }
    default: {
      fail("${::osfamily}/${::operatingsystem} not supported")
    }
  }
}
