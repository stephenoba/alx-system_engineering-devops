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
file { 'custom_404.html':
  ensure  => 'present',
  content => 'Ceci n\'est pas une page',
  path    => '/etc/nginx/html/custom_404.html',
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
exec {'echo "\troot   /etc/nginx/html;" >> /etc/nginx/sites-available/default':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
exec {'echo "\tindex  index.html index.htm;\n" >> /etc/nginx/sites-available/default':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
exec {'echo "\tlocation /redirect_me {" >> /etc/nginx/sites-available/default':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
exec {'echo "\t\treturn 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;" >> /etc/nginx/sites-available/default':
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
