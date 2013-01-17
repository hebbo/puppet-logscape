class logscape (
  $type,
  $version,
  $management_host,
  $basedir          = '/opt/logscape',
  $base_port        = '11000',
  $java_home        = '/usr/java/latest',
  $group            = 'logscape',
  $ha_enabled       = 'false',
  $logdir           = '/var/log/logscape',
  $management_port  = '11000',
  $user             = 'logscape',
  $web_app_port     = '8080',
  $workspace        = '/root/logscape',
  $zone             = 'LOGSCAPE1',
) {
  include runit
  runit::user { $user:
    basedir => $basedir,
    group   => $group,
  }
  class { 'logscape::install':
    basedir         => $basedir,
    base_port       => $base_port,
    group           => $group,
    ha_enabled      => $ha_enabled,
    logdir          => $logdir,
    java_home       => $java_home,
    management_host => $management_host,
    management_port => $management_port,
    type            => $type,
    user            => $user,
    version         => $version,
    web_app_port    => $web_app_port,
    workspace       => $workspace,
    zone            => $zone,
  }
  class { 'logscape::service':
    basedir => $basedir,
    logdir  => $logdir,
    version => $version,
    user    => $user,
    group   => $group,
  }
}

