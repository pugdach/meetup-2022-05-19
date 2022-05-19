# class infrastructure::puppet::autosign
class infrastructure::puppet::autosign {
  if $facts['puppet_release'] == 'opensource' {
    $puppet_service = 'puppetserver'
    service { 'puppetserver':
      ensure => running,
      enable => true,
    }
  } else {
    $puppet_service = 'pe-puppetserver'
  }
  file { '/etc/puppetlabs/puppet/autosign.conf':
    ensure  => file,
    content => '*',
    notify  => Service[$puppet_service],
  }
}
