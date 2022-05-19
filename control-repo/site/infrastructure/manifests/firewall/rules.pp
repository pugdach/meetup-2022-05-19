# class infrastructure::firewall::rules
class infrastructure::firewall::rules {
  include infrastructure::firewall::post
  include infrastructure::firewall::pre

  if ! defined(Package['iptables-services']) {
    package { 'iptables-services':
      ensure => present,
    }
  }

  Firewall {
    before  => Class['infrastructure::firewall::post'],
    require => [
      Class['infrastructure::firewall::pre'],
      Package['iptables-services'],
    ],
  }

  firewall { '006 Allow inbound SSH':
    ensure => present,
    dport  => 22,
    proto  => 'tcp',
    action => 'accept',
  }

}
