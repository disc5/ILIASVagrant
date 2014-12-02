# ILIAS Development Environment based on Vagrant & Puppet
This is an environment based on a LAMP system suitable for ILIAS development.

## Prerequisites
* [Vagrant](http://www.vagrantup.com/)
* [Virtual Box](https://www.virtualbox.org/)

## Instructions
1. Ensure Vagrant and Virtual Box are installed.
2. Clone this repository.
3. Open up terminal, change directory to the git repo root, and start the vagrant box.

        $ vagrant up

You're all set up. You may restart the machine with $vagrant reload. After that the webserver will be accessible from http://localhost:8888. From here you can begin to initially run the ILIAS setup procedure.
* Data Directory outside Webspace: /opt/ilias/iliasdata
* Path to Log File: /opt/ilias/shared/logs/ilias.log
* Create New Client ...

At later stages you probably adapt the Vagrant and Puppet configurations to your needs.

## Features
* The puppet provisioner ensures that the newest ILIAS version has been downloaded from sourceforge.net, unzip and linked into the webroot.
* All necessary PHP libraries are ensured to be installed.
* MySQL Server is set up with the user "root" and password "ilias".
* The folder "shared" at the host system is mounted to "/opt/ilias/shared". 
* ILIAS and Apache logs will be shared with the host system via "/opt/ilias/shared/logs"  

## Credits
The Vagrant configuration is based to some extend on
["LAMP Stacks Made Easy with Vagrant & Puppet"](http://puppetlabs.com/blog/lamp-stacks-made-easy-vagrant-puppet)
(https://github.com/jrodriguezjr/puppet-lamp-stack.git)
and also on the ILIAS Installation and Maintenance instructions for Ubuntu/Debian
[http://www.ilias.de/docu/goto_docu_pg_6531_367.html]

