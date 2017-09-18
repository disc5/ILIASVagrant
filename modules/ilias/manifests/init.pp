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
		 require     => Exec['ilias-git-release'],      # CHANGE according to desired source, see below
	}

	#file {'/opt/ilias/htdocs':
	#  ensure => 'link',
	#  target => '/opt/ilias/shared/ilias',
	#}

    file {"/opt/ilias/htdocs":
      ensure => directory,
      owner => 'www-data',
    }

#--------------------- Use latest ILIAS from SourceForge ------------------------
#    exec {'ilias-symlinks-zip':
#      command => 'ln -s /opt/ilias/shared/ilias/* .',
#      cwd => '/opt/ilias/htdocs',
#      require     => [File["/opt/ilias/htdocs"], Exec['ilias-unzip']],
#      refreshonly => true,
#    }
	
#	exec {'ilias-download':
#		command => 'wget http://sourceforge.net/projects/ilias/files/latest/download -O /opt/ilias/shared/ilias.zip',
#		unless => 'test -f /opt/ilias/shared/ilias.zip',
#		path => ['/bin', '/usr/bin'],
#	    notify => Exec['ilias-unzip'],
#        require => Package['unzip'],
#	}
	
#	exec { 'ilias-unzip':
#	  command     => 'unzip ilias.zip',
#	  cwd         => '/opt/ilias/shared',
#	  path        => ['/usr/bin'],
#	  refreshonly => true,
#	  require     => Exec['ilias-download'],
#	}
#--------------------- End SourceForge ------------------------
		
#--------------------- Use trunk from ILIAS SVN ------------------------
#    exec {'ilias-symlinks-svn':
#      command => 'ln -s /opt/ilias/shared/ilias-trunk/* .',
#      cwd => '/opt/ilias/htdocs',
#      require     => [File["/opt/ilias/htdocs"], Exec['ilias-svn-trunk']]
#    }

#    exec { 'ilias-svn-trunk':
#        command => 'svn checkout http://svn.ilias.de/svn/ilias/trunk ilias-trunk',
#        timeout => 0,
#        cwd => '/opt/ilias/shared',
#        require => Package['subversion']
#    }
#--------------------- End ILIAS SVN ------------------------


#--------------------- Use release branch from ILIAS git ------------------------
    exec {'ilias-symlinks-git':
      command => 'ln -s /opt/ilias/shared/ilias-git/* .',
      cwd => '/opt/ilias/htdocs',
      require     => [File["/opt/ilias/htdocs"], Exec['ilias-git-release']]
    }

    exec { 'ilias-git-release':
        command => 'git clone --depth=1 --branch=v5.1.9 https://github.com/ILIAS-eLearning/ILIAS.git ilias-git',
        timeout => 0,
        cwd => '/opt/ilias/shared',
        require => Package['git']
    }
#--------------------- End ILIAS git ------------------------

}
