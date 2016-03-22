class danted{


	class{'danted::install': } ->
	class{'danted::configure': } ~>
	class{'danted::service': } ->
	Class['danted']


}
