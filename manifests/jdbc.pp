# == Resource hadoop_lib::jdbc
#
# Link JDBC jar file from standard location. Jar files must be installed.
#
# Example of using puppetlabs modules for jar files installation:
#
# * *puppetlabs-mysql*: *mysql::bindings* class with *java_enable* parameter set
# * *puppetlabs-postgresql*: *postgresql::lib::java* class
#
define hadoop_lib::jdbc(
  $db,
) {
  include ::stdlib

  $dest = $title

  case getvar('db') {
    'mysql', 'mariadb': {
      file { "${dest}/mysql-connector-java.jar":
        ensure => 'link',
        links  => 'follow',
        source => '/usr/share/java/mysql-connector-java.jar',
      }
    }
    'postgresql': {
      file { "${dest}/postgresql-jdbc.jar":
        ensure => 'link',
        links  => 'follow',
        source => '/usr/share/java/postgresql.jar',
      }
    }
    default: {}
  }
}
