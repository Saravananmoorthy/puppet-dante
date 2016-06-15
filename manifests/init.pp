class dante( $version = '1.4.1' ){



	class{'dante::install': 
		version => $version
	} -> 
 	class{'dante::configure': } ~> 
	class{'dante::service': } ->
	Class['dante'] 

}


