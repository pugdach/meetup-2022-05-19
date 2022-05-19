# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include infrastructure::r10k
#
# @param control_repo the control-repo url
#
class infrastructure::puppet::r10k (
  String[1] $control_repo,
) {
  if $facts['puppet_release'] == 'opensource' {
    $webhook_user = 'puppet'
    $webhook_group = 'puppet'
    $webhook_pass = 'puppet'

    class { 'r10k':
      remote   => $control_repo,
      provider => 'puppet_gem',
    }
    class { 'r10k::webhook::config':
      use_mcollective => false,
      enable_ssl      => false,
      protected       => false,
      user            => $webhook_user,
      pass            => $webhook_pass,
    }
    class { 'r10k::webhook':
      use_mcollective => false,
      user            => $webhook_user,
      group           => $webhook_group,
      require         => Class['r10k::webhook::config'],
    }
    file { '/usr/local/bin/r10k':
      ensure => link,
      target => '/opt/puppetlabs/puppet/bin/r10k',
    }
  }
}
