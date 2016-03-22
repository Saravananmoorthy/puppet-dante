class danted::service{

      service { 'sockd':
            ensure => 'running',
      }
}
