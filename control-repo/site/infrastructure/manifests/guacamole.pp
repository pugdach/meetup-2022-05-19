# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include infrastructure::guacamole
#
class infrastructure::guacamole (
) {
  $packages = [
    'guacd',
    'libguac-client-vnc',
    'libguac-client-ssh',
    'tomcat',
    'dejavu-sans-mono-fonts',
    'wget',
  ]
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }
  package { 'epel-release':
    ensure => present,
  }
  package { $packages:
    ensure => present,
  }
  file { '/etc/guacamole':
    ensure => directory,
  }
  service { 'guacd':
    ensure => running,
    enable => true,
  }
  service { 'tomcat':
    ensure => running,
    enable => true,
  }
}
