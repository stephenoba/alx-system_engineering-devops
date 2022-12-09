# Script Creates a file in /tmp

file { 'school':
  ensure  => 'present',
  content => 'I love Puppet',
  mode    => '0744',
  group   => 'www-data',
  owner   => 'www-data',
  path    => '/tmp/school',
}
