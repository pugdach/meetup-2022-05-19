# class infrastructure::base::ssh
class infrastructure::base::ssh {
  service { 'sshd':
    ensure => running,
    enable => true,
  }
}
