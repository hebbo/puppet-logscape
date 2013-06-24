class logscape (
  $type,
  $version,
  $management_host  = 'localhost',
  $basedir          = '/apps/logscape1',
  $base_port        = '11000',
  $group            = 'logscape',
  $ha_enabled       = 'false',
  $initial_heap     = '256M',
  $interface        = 'eth0',
  $java_home        = '/usr/java/latest',
  $locale           = 'en_GB.utf8',
  $logdir           = '/var/log/logscape',
  $management_port  = '11000',
  $max_heap         = '512M',
  $priority         = 'LOW',
  $replication_port = '15000',
  $stack_size       = '160k',
  $user             = 'logscape',
  $web_app_port     = '8080',
  $workspace        = '/root/logscape',
  $zone             = 'LOGSCAPE1',
  $license_filename = 'sbet-prod-1.lic'
) {
  include runit
  runit::user { $user:
    basedir => $basedir,
    group   => $group,
  }
  class { 'logscape::install':
    basedir          => $basedir,
    base_port        => $base_port,
    group            => $group,
    ha_enabled       => $ha_enabled,
    initial_heap     => $initial_heap,
    interface        => $interface,
    java_home        => $java_home,
    locale           => $locale,
    logdir           => $logdir,
    management_host  => $management_host,
    management_port  => $management_port,
    max_heap         => $max_heap,
    priority         => $priority,
    replication_port => $replication_port,
    stack_size       => $stack_size,
    type             => $type,
    user             => $user,
    version          => $version,
    web_app_port     => $web_app_port,
    workspace        => $workspace,
    zone             => $zone,
    license_filename => $license_filename,
  }
  class { 'logscape::service':
    basedir => $basedir,
    logdir  => $logdir,
    version => $version,
    user    => $user,
    group   => $group,
  }
}

