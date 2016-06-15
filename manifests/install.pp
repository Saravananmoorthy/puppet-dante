class dante::install( $version ) {


	notify {"Running with ${version} defined":}



	# Decide which dev packages to install

	case $operatingsystem {

	  'RedHat', 'CentOS': { 
		
               dante::install::buildtools { 'packages' :
                        list_of_packages => [ 'build-essential' ],

                }
 
	   }

	   /^(Debian|Ubuntu)$/:{ 

		dante::install::buildtools { 'packages' : 
			list_of_packages => [ 'build-essential' ]
		}		
	  }

	   default:{ 


                dante::install::buildtools { 'packages' :
                        list_of_packages => [ 'gcc' , 'gcc-c++' , 'make' , 'openssl-devel'  ]
                }
 

	   }
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

define dante::install::buildtools( $list_of_packages ) {
	notify { "Installing ${list_of_packages} ---": }
	package { $list_of_packages  :
                ensure => installed ,
                before => Exec['install-dante-from-archive']
        }

}
