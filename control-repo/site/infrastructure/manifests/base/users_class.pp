# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include infrastructure::base::users_class
class infrastructure::base::users_class {
  if $facts['networking']['hostname'] =~ /^student/ {
    file { '/root/.ssh/hetzner_key':
      ensure => absent,
      backup => false,
    }
  }
  if $facts['puppet_release'] == 'opensource' {
    $links = [
      'puppet',
      'facter',
      'eyaml',
    ]
  } else {
    $links = [
    ]
  }
  $links.each |$link| {
    file { "/usr/local/bin/${link}":
      ensure => link,
      target => "/opt/puppetlabs/puppet/bin/${link}",
    }
  }
}
