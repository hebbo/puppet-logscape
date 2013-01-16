# puppet-logscape

Install and configure a basic Logscape agent.

## Usage: logscape::agent

Include the logscape::agent module in your puppet configuration:

    include logscape:;agent

and add required hiera configuration - for example:

    logscape::type:     'Agent'
    logscape::version:  '1.3.00'
    logscape::management_host:  'logscape.example.com'

or with all the options:

    logscape::type:             'Agent'
    logscape::version:          '1.3.00'
    logscape::user:             'logscape'
    logscape::group:            'logscape'
    logscape::management_host:  'logscape.example.com'
    logscape::management_port:  '11000'
    logscape::base_port:        '11000'
    logscape::web_app_port:     '8080'
    logscape::basedir:          '/opt/logscape'
    logscape::logdir:           '/var/log/logscape'
    logscape::workspace:        '/root/logscape'
    logscape::java_home:        '/usr/java/latest'
    logscape::ha_enabled:       'false'
    logscape::zone:             'LOGSCAPE1'

* *type*: The root directory of the installation. Required.

* *version*: Required.

* *user*: Default: 'logscape'

* *group*: Default 'logscape'

* *management_host*: Required.

* *management_port*: Default: '11000'

* *base_port*: Default: '11000'

* *web_app_port*: Default: '8080'

* *basedir*: Default: '/opt/logscape'

* *logdir*: Default: '/var/log/logscape'

* *workspace*: Default: '/root/logscape'

* *java_home*: The root directory of the Java virtual machine to use.  Default: '/usr/java/latest' (and '/usr/java/latest/bin/java' will be used)

* *ha_enabled*: Default: 'false'

* *zone*:  Default: 'LOGSCAPE1'

## Support

License: Apache License, Version 2.0

GitHub URL: http://erwbgy.github.com/puppet-logscape

