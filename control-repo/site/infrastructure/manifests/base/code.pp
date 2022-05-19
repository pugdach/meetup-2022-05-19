# class infrastructure::base::code
class infrastructure::base::code {
  if $facts['networking']['hostname'] =~ /^student/ {
    exec { 'rpm --import https://packages.microsoft.com/keys/microsoft.asc':
      unless => 'rpm -qa gpg-pubkey* | grep be1229cf-5631588c',
      path   => $facts['path'],
    }
    yumrepo { 'code':
      ensure   => 'present',
      baseurl  => 'https://packages.microsoft.com/yumrepos/vscode',
      descr    => 'Visual Studio Code',
      enabled  => '1',
      gpgcheck => '1',
      gpgkey   => 'https://packages.microsoft.com/keys/microsoft.asc',
    }
    package { 'code':
      ensure => present,
    }
  }
}
