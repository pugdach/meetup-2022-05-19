# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include infrastructure::base::vim_class
class infrastructure::base::vim_class {
  if $facts['networking']['hostname'] =~ /^student/ {
    package { 'vim-enhanced':
      ensure => present,
    }
  }
}
