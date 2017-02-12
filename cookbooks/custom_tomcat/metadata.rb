name             'custom_tomcat'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures custom_tomcat'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depend 'ask'
depend 'yum'
depend 'java'
supports 'ubuntu', '>= 10.04'
supports 'centos', '>= 7.0'
