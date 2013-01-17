class logscape::service  (
  $basedir,
  $logdir,
  $version,
  $user,
  $group,
) {
  $installdir = "${basedir}/logscape-${version}"
  runit::service { "logscape-${user}":
    service     => 'logscape',
    basedir     => $basedir,
    logdir      => $logdir,
    user        => $user,
    group       => $group,
    down        => true,
    timestamp   => false,
  }
  file { "${basedir}/runit/logscape/run":
    ensure  => present,
    mode    => '0550',
    owner   => $user,
    group   => $group,
    content => template('logscape/run.erb'),
    require => File["${basedir}/runit/logscape"],
  }
  file { "${basedir}/service/logscape":
    ensure  => link,
    target  => "${basedir}/runit/logscape",
    owner   => $user,
    group   => $group,
    replace => false,
    require => File["${basedir}/runit/logscape/run"],
  }
}
