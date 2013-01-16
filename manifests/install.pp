class logscape::install (
  $basedir,
  $logdir,
  $base_port,
  $group,
  $ha_enabled,
  $java_home,
  $management_host,
  $management_port,
  $type,
  $user,
  $version,
  $web_app_port,
  $workspace,
  $zone,
) {
  $zipfile    = "Logscape-${version}.zip"
  $installdir = "${basedir}/logscape-${version}"
  # defaults
  File {
    owner => $user,
    group => $group,
  }
  Exec {
    owner => $user,
    group => $group,
  }
  file { $workspace:
    ensure => directory,
  }
  file { 'logscape-zipfile':
    ensure  => present,
    path    => "${workspace}/${zipfile}",
    mode    => '0440',
    source  => "puppet:///files/logscape/${zipfile}",
    require => File[$workspace],
  }
  exec { 'logscape-unpack':
    command => "/usr/bin/unzip '${workspace}/${zipfile}' && /bin/mv logscape '${installdir}'",
    cwd     => $basedir,
    require => File['logscape-zipfile'],
    creates => $installdir,
    notify  => Exec['logscape-directories'],
  }
  file { "${installdir}/conf/setup.conf":
    ensure  => present,
    mode    => '0440',
    content => template('logscape/setup.conf.erb'),
    require => Exec['logscape-unpack'],
    notify  => Exec['logscape-directories'],
  }
  exec { 'logscape-directories':
    command     => "/bin/mkdir -p '${logdir}'",
    refreshonly => true,
  }
}
