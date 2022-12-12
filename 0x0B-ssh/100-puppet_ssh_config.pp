# Script configures ssh to use private key ~/.ssh/school
# Configures SSH to refuse authentication using password

file { 'config':
  ensure  => 'present',
  content => 'Host *\n\tPasswordAuthentication no\n\tIdentityFile ~/.ssh/school',
  path    => '~/.ssh/config',
}
