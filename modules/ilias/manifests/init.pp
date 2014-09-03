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

	file {"/opt/ilias/ilias":
		 ensure => directory,
		 owner => 'www-data',
		 require     => Exec['ilias-download'],
	}

	file {'/opt/ilias/htdocs':
	  ensure => 'link',
	  target => '/opt/ilias/ilias',
	}	
	
	exec {'ilias-download':
		command => 'wget http://sourceforge.net/projects/ilias/files/latest/download -O /opt/ilias/ilias.zip',
		unless => 'test -f /opt/ilias/ilias.zip',
		path => ['/bin', '/usr/bin'],
		notify => Exec['ilias-unzip'],
		
	}
	
	exec { 'ilias-unzip':
	  command     => 'unzip ilias.zip',
	  cwd         => '/opt/ilias',
	  path        => ['/usr/bin'],
	  refreshonly => true,
	  require     => Exec['ilias-download'],
	}
		
}
