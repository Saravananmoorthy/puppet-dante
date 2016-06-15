class dante::configure{


	file { "/etc/sockd.conf":
                source => "puppet:///modules/dante/dantedconf",
        }

        file { "/etc/init.d/sockd":
                source => "puppet:///modules/dante/dantedinit",
                mode => "0777"
	}
}
