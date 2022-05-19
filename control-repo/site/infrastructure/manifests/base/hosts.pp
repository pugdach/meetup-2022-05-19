# class infrastructure::base::hosts
class infrastructure::base::hosts {
  case $facts['os']['family'] {
    'RedHat': {
      case $facts['os']['release']['major'] {
        '7': { $internal_ip = $facts['networking']['interfaces']['eth1']['ip'] }
        '8': { $internal_ip = $facts['networking']['interfaces']['ens10']['ip'] }
        default: { notify { "Redhat or Centos Version ${facts['os']['release']['major']} currently not supported.": } }
      }
    }
    default: { notify { "OS ${facts['os']['name']} currently not supported.": } }
  }
  @@host { $facts['networking']['hostname']:
    ensure       => present,
    ip           => $internal_ip,
    host_aliases => $facts['networking']['fqdn'],
    tag          => 'workshop',
  }
  Host <<| tag == 'workshop' |>>
}
