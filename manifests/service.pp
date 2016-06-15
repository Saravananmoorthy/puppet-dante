class dante::service{

      service { 'sockd':
            ensure => 'running',
      }
}
