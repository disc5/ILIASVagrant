class tools {

  # package install list
  # cf. http://www.ilias.de/docu/goto_docu_pg_56808_367.html
  $packages = [
    "curl",
    "vim",
    "htop",
	"unzip",
	"wget",
	"htmldoc",
	"imagemagick",
	"ffmpeg",
	"zip"
  ]

  # install packages
  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
}
