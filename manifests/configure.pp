class dante::configure{


	$internal_interface = $dante::internal_interface
	$external_interface = $dante::external_interface
	$socks_port = $dante::socks_port 
	$client_pass_start_range = $dante::client_pass_start_range
	$client_pass_end_range = $dante::client_pass_end_range
	$generic_pass_outgoing_start_range = $dante::generic_pass_outgoing_start_range
	$generic_pass_incoming_end_range = $dante::generic_pass_incoming_end_range


	notify { " using global ${client_pass_start_range} ******************** ": }
	
	file { "/etc/sockd.conf":
                source => "puppet:///modules/dante/dantedconf",
        }

        file { "/etc/init.d/sockd":
                source => "puppet:///modules/dante/dantedinit",
                mode => "0777"
	}
}
