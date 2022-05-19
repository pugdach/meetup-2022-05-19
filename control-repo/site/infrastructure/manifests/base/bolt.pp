# class infrastructure::base::bolt
class infrastructure::base::bolt {
  package { 'puppet-tools-release':
    ensure => present,
    source => "https://yum.puppet.com/puppet-tools-release-el-${facts['os']['release']['major']}.noarch.rpm",
  }
  exec { 'yum makecache':
    path        => $facts['path'],
    refreshonly => true,
    subscribe   => Package['puppet-tools-release'],
  }
  package { 'puppet-bolt':
    ensure  => present,
    require => Exec['yum makecache'],
  }
  package { 'pdk':
    ensure  => present,
    require => Exec['yum makecache'],
  }
}
