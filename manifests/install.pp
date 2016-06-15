class dante::install( $version ) {


	notify {"Running with ${version} defined":}
	
	package { 'build-essential'  :
		ensure => installed ,
		before => Exec['install-dante-from-archive']
	} 
	

	exec{ 'download-dante' : 
		command => '/usr/bin/wget -q https://www.inet.no/dante/files/dante-${version}.tar.gz -O /tmp/danted.tar.gz',
		creates => '/tmp/danted.tar.gz',
		before => Exec['install-dante-from-archive'] 
	}
	
	exec{ 'install-dante-from-archive' :
		
		command => '/bin/tar -xvf /tmp/danted.tar.gz -C /tmp/ ; cd /tmp/dante-${version} ; /bin/sh configure ; /usr/bin/make ; /usr/bin/make install',
		creates => '/usr/local/sbin/sockd',		 
		
	} 

}
