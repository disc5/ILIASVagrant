class ilias {

	file { '/etc/motd':
	   content => "Welcome to your ILIAS development machine!\n"
	}

	file {"/opt/ilias/":
		 ensure => directory,
		 owner => 'vagrant',
	}

	file {"/opt/ilias/shared/logs":
	     ensure => directory,
	     owner => 'www-data',
	}
	
	file {"/opt/ilias/iliasdata":
	     ensure => directory,
	     owner => 'www-data',
	}

	file {"/opt/ilias/shared/ilias":
		 ensure => directory,
		 owner => 'www-data',
		 require     => Exec['ilias-download'],
	}

	#file {'/opt/ilias/htdocs':
	#  ensure => 'link',
	#  target => '/opt/ilias/shared/ilias',
	#}

    file {"/opt/ilias/htdocs":
      ensure => directory,
      owner => 'www-data',
    }

    exec {'ilias-symlinks':
      command => 'ln -s /opt/ilias/shared/ilias/* .',
      cwd => '/opt/ilias/htdocs',
      require     => [File["/opt/ilias/htdocs"], Exec['ilias-unzip']],
      refreshonly => true,
    }
	
	exec {'ilias-download':
		command => 'wget http://sourceforge.net/projects/ilias/files/latest/download -O /opt/ilias/shared/ilias.zip',
		unless => 'test -f /opt/ilias/shared/ilias.zip',
		path => ['/bin', '/usr/bin'],
		notify => Exec['ilias-unzip'],
	}
	
	exec { 'ilias-unzip':
	  command     => 'unzip ilias.zip',
	  cwd         => '/opt/ilias/shared',
	  path        => ['/usr/bin'],
	  refreshonly => true,
	  require     => Exec['ilias-download'],
	}
		
}
