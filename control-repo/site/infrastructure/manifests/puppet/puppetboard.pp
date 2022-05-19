# class infrastructure::puppet::puppetboard
class infrastructure::puppet::puppetboard {
  include docker

  docker::image { 'ghcr.io/voxpupuli/puppetboard': }

  docker::run { 'puppetboard':
    image => 'ghcr.io/voxpupuli/puppetboard',
    env   => [
      'PUPPETDB_HOST=127.0.0.1',
      'PUPPETDB_PORT=8080',
      'PUPPETBOARD_PORT=8089',
    ],
    net   => 'host',
  }
}
