# Script installs and configures Nginx

exec {'apt-get update':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
exec {'apt-get -y install':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
file { 'index.html':
  ensure  => 'present',
  content => 'Hello World!',
  mode    => '0744',
  group   => 'www-data',
  owner   => 'www-data',
  path    => '/etc/nginx/html/index.html',
}
file { 'custom_404.html':
  ensure  => 'present',
  content => 'Ceci n\'est pas une page',
  mode    => '0744',
  group   => 'www-data',
  owner   => 'www-data',
  path    => '/etc/nginx/html/custom_404.html',
}
exec {'ech0 "server {\n" >> /etc/nginx/sites-available/default':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
exec {'ech0 "\tlisten 80 default_server;\n" >> /etc/nginx/sites-available/default':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
exec {'ech0 "\tlisten [::]:80 default_server;\n" >> /etc/nginx/sites-available/default':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
exec {'ech0 "\troot   /etc/nginx/html;\n" >> /etc/nginx/sites-available/default':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
exec {'ech0 "\tindex  index.html index.htm;\n\n" >> /etc/nginx/sites-available/default':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
exec {'ech0 "\tlocation /redirect_me {\n" >> /etc/nginx/sites-available/default':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
exec {'ech0 "\t\treturn 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;\n" >> /etc/nginx/sites-available/default':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
exec {'ech0 "\t}\n" >> /etc/nginx/sites-available/default':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
exec {'ech0 "}" >> /etc/nginx/sites-available/default':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
exec {'service restart nginx':
  path => '/usr/sbin/:/usr/local/sbin/:/sbin/'
}
