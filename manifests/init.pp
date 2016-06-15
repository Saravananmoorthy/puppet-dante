class dante{


	class{'dante::install': } ->
	class{'dante::configure': } ~>
	class{'dante::service': } ->
	Class['dante']


}
