# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include meetup
class meetup {
  file { '/etc/meetup':
    ensure  => file,
    content => 'Hello world',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    notify  => Service['meetup']
  }

  class { 'meetup::service':

  }
}
