class tools {

  # package install list
  # cf. http://www.ilias.de/docu/goto_docu_pg_56808_367.html
  $packages = [
	"subversion",
	"git",
	"curl",
	"vim",
	"htop",
	"unzip",
	"wget",
	"htmldoc",
	"imagemagick",
	"zip",
	"phpmyadmin"
  ]

  # install packages
  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
}
