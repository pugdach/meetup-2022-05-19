# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include meetup::service
class meetup::service {
  service { 'meetup':
    ensure => running,
    enable => true,
  }
}
