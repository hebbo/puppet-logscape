class logscape::install (
  $basedir,
  $base_port,
  $group,
  $ha_enabled,
  $initial_heap,
  $interface,
  $java_home,
  $locale,
  $logdir,
  $management_host,
  $management_port,
  $max_heap,
  $priority,
  $replication_port,
  $stack_size,
  $type,
  $user,
  $version,
  $web_app_port,
  $workspace,
  $zone,
) {
  $zipfile    = "Logscape-${version}.zip"
  $installdir = "${basedir}/logscape-${version}"
  if ! defined(File[$workspace]) {
    file { $workspace:
      ensure => directory,
      mode   => '0755',
    }
  }
  file { 'logscape-zipfile':
    ensure  => present,
    path    => "${workspace}/${zipfile}",
    mode    => '0444',
    owner   => $user,
    group   => $group,
    source  => "puppet:///files/logscape/${zipfile}",
    require => File[$workspace],
  }
  exec { 'logscape-unpack':
    command => "/usr/bin/unzip '${workspace}/${zipfile}' && /bin/mv logscape 'logscape-${version}'",
    cwd     => $basedir,
    require => File['logscape-zipfile'],
    creates => $installdir,
    #notify  => Exec['logscape-directories'],
  }
  file { $installdir:
    ensure  => directory,
    owner   => $user,
    group   => $group,
    recurse => true,
    require => Exec['logscape-unpack'],
  }
  file { "${installdir}/boot.properties":
    ensure  => present,
    owner   => $user,
    group   => $group,
    mode    => '0440',
    content => template('logscape/boot.properties.erb'),
    require => Exec['logscape-unpack'],
    notify  => Class['logscape::service'],
  }
  file { "${basedir}/current":
    ensure  => link,
    target  => "logscape-${version}",
    owner   => $user,
    group   => $group,
  }
}
