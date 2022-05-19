# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   meetup::sec_test_secure { 'namevar': }
define meetup::sec_test_secure (
  Meetup::Word $param,
) {
  exec { 'test exec':
    command => "echo ${param}",               #lint:ignore:security_class_or_define_parameter_in_exec
    path    => ['/bin', '/usr/bin'],
  }
}
