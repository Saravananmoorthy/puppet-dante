class dante::configure{


	file { "/etc/sockd.conf":
                source => "puppet:///modules/danted/dantedconf",
        }

        file { "/etc/init.d/sockd":
                source => "puppet:///modules/danted/dantedinit",
                mode => "0777"
	}
}
