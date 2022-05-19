# class infrastructure::base::ccze
class infrastructure::base::ccze {
  contain epel
  # ccze package not available under centos8 (streams), more hiera hierachies may be introduced carefully, to exclude this class,
  # so this might just be a workaround.
  if $facts['os']['release']['major'] == '7' {
    package { 'ccze':
      ensure  => present,
      require => Class['epel'],
    }
  }
}
