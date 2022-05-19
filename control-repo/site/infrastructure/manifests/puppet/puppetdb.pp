# class infrastructure::puppet::puppetdb
class infrastructure::puppet::puppetdb {
  if $facts['puppet_release'] == 'opensource' {
    class { 'puppetdb':
      listen_address  => '0.0.0.0',
      manage_firewall => true,
    }
    class { 'puppetdb::master::config':
      manage_report_processor => true,
      enable_reports          => true,
    }
  }
}
