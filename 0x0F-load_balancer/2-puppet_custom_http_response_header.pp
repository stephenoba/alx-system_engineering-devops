# Script installs and configures Nginx

package {'nginx':
  ensure => installed,
}
file { '/etc/nginx/html':
  ensure => 'directory',
}
file { 'index.html':
  ensure  => 'present',
  content => 'Hello World!',
  path    => '/etc/nginx/html/index.html',
}
exec {'echo "server {" > /etc/nginx/sites-available/default':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
exec {'echo "\tlisten 80 default_server;" >> /etc/nginx/sites-available/default':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
exec {'echo "\tlisten [::]:80 default_server;" >> /etc/nginx/sites-available/default':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
exec {'echo "\tlocation / {" >> /etc/nginx/sites-available/default':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
exec {'echo "\t\tadd_header X-Served-By \$HOSTNAME;" >> /etc/nginx/sites-available/default':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
exec {'echo "\t\troot   /etc/nginx/html;" >> /etc/nginx/sites-available/default':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
exec {'echo "\t\tindex  index.html index.htm;\n" >> /etc/nginx/sites-available/default':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
exec {'echo "\t}" >> /etc/nginx/sites-available/default':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
exec {'echo "}" >> /etc/nginx/sites-available/default':
  path   => '/usr/bin/:/usr/local/bin/:/bin/',
  notify => Service['nginx']
}
service { 'nginx':
  ensure => 'running',
  enable => true,
}
