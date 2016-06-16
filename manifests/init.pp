class dante( 
	$version = '1.4.1',
	$internal_interface = '0.0.0.0',
	$external_interface = 'eth0',
	$socks_port = '8001',
	$client_pass_start_range = '0.0.0.0/0',
	$client_pass_end_range = '0.0.0.0/0',
	$generic_pass_outgoing_start_range = '0.0.0.0/0',
	$generic_pass_incoming_end_range = '0.0.0.0/0'
){



	class{'dante::install': 
		version => $version
	} -> 
 	class{'dante::configure':} ~> 
	class{'dante::service': } ->
	Class['dante'] 

}


