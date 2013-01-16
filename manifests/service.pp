define logscape::service  (
  $basedir,
  $logdir,
  $version,
  $user,
  $group,
) {
  $product = "logscape-${version}"
  runit::service { "service-${product}-${basedir}":
    service     => 'logscape',
    basedir     => $basedir,
    logdir      => $logdir,
    user        => $user,
    group       => $group,
    down        => true,
  }
  file { "${basedir}/runit/run":
    ensure  => present,
    mode    => '0550',
    owner   => $user,
    group   => $group,
    content => template('logscape/run.erb'),
    require => File["${basedir}/runit"],
  }
  file { "${basedir}/service/logscape":
    ensure  => link,
    target  => "${basedir}/runit/logscape",
    owner   => $user,
    group   => $group,
    replace => false,
    require => File["${basedir}/runit/run"],
  }
}
