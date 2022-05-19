# class infrastructure::base::sudoers
class infrastructure::base::sudoers {
  file { '/etc/sudoers':
    ensure => file,
    source => 'puppet:///modules/infrastructure/sudo/sudoers',
    mode   => '0440',
  }
  file { '/etc/sudoers.d/99-wheel-sudo':
    ensure  => file,
    content => '%wheel        ALL=(ALL)       NOPASSWD: ALL',
    mode    => '0440',
  }
}
