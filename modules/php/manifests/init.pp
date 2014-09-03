class php {

  # Install debian packages according to http://www.ilias.de/docu/goto_docu_pg_56810_367.html
  $packages = [
    "php5",
    "php5-cli",
    "php5-mysql",
    "php-pear",
    "php5-dev",
    "php5-gd",
    "php5-mcrypt",
    "libapache2-mod-php5",
	"php5-xsl",
	"php5-ldap",
	"php5-xmlrpc"
  ]

  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
}
