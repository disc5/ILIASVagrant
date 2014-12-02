class php::phpunit {
  exec { 'getPHPUnit':
    command => 'wget https://phar.phpunit.de/phpunit.phar',
    cwd => '/tmp',
    creates => '/tmp/phpunit.phar'
  }

  exec { 'chmodPHPUnit':
    command => 'chmod +x phpunit.phar',
    cwd => '/tmp',
    require => Exec['getPHPUnit']
  }

  exec { 'mvPHPUnit':
    command => 'mv phpunit.phar /usr/local/bin/phpunit',
    cwd => '/tmp',
    require => Exec['chmodPHPUnit']
  }
}
