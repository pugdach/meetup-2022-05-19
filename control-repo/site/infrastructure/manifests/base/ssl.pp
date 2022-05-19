# class infrastructure::base::ssl
class infrastructure::base::ssl {
  package { 'ca-certificates':
    ensure => 'installed',
  }
  file { '/etc/pki/ca-trust/source/anchors/puppet_ca.pem':
    ensure  => 'file',
    source  => '/etc/puppetlabs/puppet/ssl/certs/ca.pem',
    require => Package['ca-certificates'],
    notify  => Exec['refresh-trust-db'],
  }
  exec { 'refresh-trust-db':
    command     => 'update-ca-trust',
    path        => $facts['path'],
    refreshonly => true,
  }
}
