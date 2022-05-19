# class infrastructure::puppet::puppetmaster
#
# @param student_roles an array of rbac roles assigned to users
class infrastructure::puppet::puppetmaster (
  Array[Integer] $student_roles = [3]
) {
  if $facts['puppet_release'] == 'opensource' {
    $puppet_user = 'puppet'
  } else {
    $puppet_user = 'pe-puppet'
  }
}
