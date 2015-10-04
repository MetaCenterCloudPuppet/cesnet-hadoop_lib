# == Resource hadoop::common::postinstall
#
# Preparation steps after installation. It switches *-conf alternative, if enabled.
#
define hadoop_lib::postinstall(
  $alternatives = '::default',
) {
  $path = '/sbin:/usr/sbin:/bin:/usr/bin'

  $default_alternatives = "${::osfamily}-${::operatingsystem}" ? {
    /RedHat-Fedora/ => undef,
    # https://github.com/puppet-community/puppet-alternatives/issues/18
    /RedHat/        => '',
    /Debian/        => 'cluster',
    default         => 'cluster',
  }
  $confdir = "${::osfamily}-${::operatingsystem}" ? {
    /RedHat-Fedora/ => "/etc/${name}",
    /Debian|RedHat/ => "/etc/${name}/conf",
    default         => "/etc/${name}/conf",
  }

  if $alternatives == '::default' {
    $confname = $default_alternatives
  } else {
    $confname = $alternatives
  }

  if $confname and $confname != '' {
    exec { "${name}-copy-config":
      command => "cp -a ${confdir}/ ${confdir}.${confname}",
      path    => $path,
      creates => "${confdir}.${confname}",
    }
    ->
    alternative_entry{"${confdir}.${confname}":
      altlink  => $confdir,
      altname  => "${name}-conf",
      priority => 50,
    }
    ->
    alternatives{"${name}-conf":
      path => "${confdir}.${confname}",
    }
  }
}
