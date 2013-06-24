# puppet-logscape

Install and configure a basic Logscape agent.

## Usage

Include the logscape module in your puppet configuration:

    include logscape

and add required hiera configuration - for example:

    logscape::type:             "%{hostname}Agent"
    logscape::version:          '1.3.00'
    logscape::management_host:  'logscape.example.com'

or with all the options:

    logscape::basedir:          '/opt/logscape'
    logscape::base_port:        '11000'
    logscape::group:            'logscape'
    logscape::ha_enabled:       'false'
    logscape::initial_heap:     '256M',
    logscape::interface:        'eth0',
    logscape::java_home:        '/usr/java/latest'
    logscape::locale:           'en_GB.utf8',
    logscape::logdir:           '/var/log/logscape'
    logscape::management_host:  'logscape.example.com'
    logscape::management_port:  '11000'
    logscape::priority:         'LOW',
    logscape::replication_port: '15000',
    logscape::stack_size:       '160k',
    logscape::type:             "%{hostname}Agent"
    logscape::user:             'logscape'
    logscape::version:          '1.3.00'
    logscape::web_app_port:     '8080'
    logscape::workspace:        '/root/logscape'
    logscape::zone:             'LOGSCAPE1'

* *basedir*: Default: '/opt/logscape'

* *base_port*: Default: '11000'

* *group*: Default 'logscape'

* *ha_enabled*: Default: 'false'

* *initial_heap*: Default: '256M'

* *interface*: Default: 'eth0'

* *java_home*: The root directory of the Java virtual machine to use.  Default:
  '/usr/java/latest' (and '/usr/java/latest/bin/java' will be used)

* *locale*: The UTF-8 locale to set (run 'locale -a | grep utf8' to see
  available values).  Default: en_GB.utf8

* *logdir*: Default: '/var/log/logscape'

* *management_host*: Required.

* *management_port*: Default: '11000'

* *priority*: Default: 'LOW'.

* *replication_port*: Default: '15000'.

* *stack_size*: Default: '160k'.

* *type*: Required.

* *user*: Default: 'logscape'

* *version*: Required.

* *web_app_port*: Default: '8080'

* *workspace*: Default: '/root/logscape'

* *zone*:  Default: 'LOGSCAPE1'

## Support

License: Apache License, Version 2.0

GitHub URL: http://erwbgy.github.com/puppet-logscape

