# Script configures ssh to use private key ~/.ssh/school
# Configures SSH to refuse authentication using password

file { '/etc/ssh/ssh_config':
  ensure  => 'present',
}->
file_line { 'Turn off passwd auth':
  path => '/etc/ssh/ssh_config',  
  line => 'PasswordAuthentication yes',
  ensure => 'absent',
}->
file_line { 'Declare identity file':
  path => '/etc/ssh/ssh_config',  
  line => '\tIdentityFile ~/.ssh/school',
}
