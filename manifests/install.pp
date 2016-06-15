class dante::install {

        exec { 'install-dev-tools':                    # exec resource named 'apt-update'
          command => '/usr/bin/apt-get -y install build-essential ; /usr/bin/wget -q https://www.inet.no/dante/files/dante-1.4.1.tar.gz -O /tmp/danted.tar.gz ; /bin/tar -xvf /tmp/danted.tar.gz -C /tmp/ ; cd /tmp/dante-1.4.1 ; /bin/sh configure ; /usr/bin/make ; /usr/bin/make install ',  # command this resource will run
	  creates => '/usr/local/sbin/sockd'
        }


#        exec{'retrieve_danted_binary':
#                command => "/usr/bin/wget -q https://www.inet.no/dante/files/dante-1.4.1.tar.gz -O /tmp/danted.tar.gz",
#                 creates => "/tmp/danted.tar.gz",
#        }
#
#        file{'/tmp/danted.tar.gz':
#          mode => 0755,
#          require => Exec["retrieve_danted_binary"],
#        }
#
#        exec{'unzip_danted_binary':
#                command => "/bin/tar -xvf /tmp/danted.tar.gz -C /tmp/",
#        }
#
#        exec{'make-danted':
#                command => "/bin/sh configure ; /usr/bin/make ; /usr/bin/make install",
#                cwd => "/tmp/dante-1.4.1"
#        }
}
