# Map trusted facts to puppet server facts
# Better:
#  use the $facts['cert_extension'], which is a real puppet agent fact
#
if defined('$facts') and defined('$trusted') {
  if $trusted['extensions']['pp_role'] and !has_key($facts,'role') {
    $role = $trusted['extensions']['pp_role']
  }
  if $trusted['extensions']['pp_environment'] and !has_key($facts,'env') {
    $env = $trusted['extensions']['pp_environment']
  }
  if $trusted['extensions']['pp_datacenter'] and !has_key($facts,'datacenter') {
    $datacenter = $trusted['extensions']['pp_datacenter']
  }
  if $trusted['extensions']['pp_zone'] and !has_key($facts,'zone') {
    $zone = $trusted['extensions']['pp_zone']
  }
  if $trusted['extensions']['pp_application'] and !has_key($facts,'application') {
    $application = $trusted['extensions']['pp_application']
  }
}

# Resource defaults
File {
  backup => false,
}

# Node classification - solution 1 - 2 Arrays
$classes_to_add = lookup('classes', Array, 'unique', [])
$classes_to_delete = lookup('classes_to_delete', Array, 'unique', [])

($classes_to_add - $classes_to_delete).each |$c| {
  contain $c
}

# Node classification - solution 2 - Hash
#lookup('classes_hash', Hash, 'deep',{}).each |$name, $c| {
#  contain $c
#}
node default {}
