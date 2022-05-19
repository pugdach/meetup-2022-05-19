# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   meetup::sec_test { 'namevar': }
define meetup::sec_test (
  String $param,
) {
    exec { 'test exec':
      command => "echo ${param}",
      path    => ['/bin', '/usr/bin'],
    }
}
