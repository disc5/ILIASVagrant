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
# ffmpeg is no longer in ubuntu repositories, will come back with 15.04
#	"ffmpeg",
	"zip",
	"phpmyadmin"
  ]

  # install packages
  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
}
