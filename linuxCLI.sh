LINUX CLI
	- linux is a case sensitive OS!!!!!!!!!!!!!
	- in LINUX everything is a FILE 
	- Docker is built on basic Linux Concepts
	- Most Docker tutorial are based on Linux commands
	- Linux is an OpenSource Software
	- Versions of Linux are called Linux Distributions (or distros) that serve unique purpose with specialised needs (servers, dektop, mobile phones etc)
		- Ubuntu (most popular)
		- Debian
		- Alpine
		- Fedora & CentOS etc...
	
RUNNING a Linux
	docker looks for ubuntu image locally and pulls it from hub if not found. As we didnt interact with the container it stopped.
		C:\Users\Aashrita\Projects\hello-docker>docker pull ubuntu
		Using default tag: latest
		latest: Pulling from library/ubuntu
		9c704ecd0c69: Pull complete
		Digest: sha256:2e863c44b718727c860746568e1d54afd13b2fa71b160f5cd9058fc436217b30
		Status: Downloaded newer image for ubuntu:latest
		docker.io/library/ubuntu:latest
	
	shows list of running containers - this directory
		C:\Users\Aashrita\Projects\hello-docker>docker ps     
		CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES   (# no containers running here => ubuntu container has stopped)
	
	shows list of running containers anywhere on the machine
		C:\Users\Aashrita\Projects\hello-docker>docker ps -a
	
	to start a container and interact with it - load ubuntu image which we have locally and run it 
		root@42989fcad4c0:/#
		....
			we have a shell prompt window here - A shell is a prog that takes user commands and passes to OS for execution
			root represents currently logged in user (has highest privilages)
			42989fcad4c0: is the name of the machine - automatically generate dby docker
			/ = where we are in the file system - root directory (highest dir in the file system)
			# = highest privilages (root user login)
			$ = logged in as normal user (lesser privilages)
		
		cmd we can use 
			root@42989fcad4c0:/# echo hubli
			hubli
			root@42989fcad4c0:/# whoami
			root
			root@42989fcad4c0:/# echo $0  (=> where the shell prog is located)
			/bin/bash
			root@42989fcad4c0:/# history  (=> we see all the commands executed lately)
			1  echo hello
			2  echo hubli
			3  whoami
			4  echo $0
			5  history
			root@42989fcad4c0:/# !3		(=> to run the numbered command from the list above)
			whoami
			root
			
	Managing Packages	
		root@42989fcad4c0:/# apt
		apt 2.7.14 (amd64)
		Usage: apt [options] command
			apt is a commandline package manager and provides commands for
			searching and managing as well as querying information about packages.
	
		updates all packages in DB (doesnt install them)
			root@42989fcad4c0:/# apt update
	
		install a pkg
			root@42989fcad4c0:/# apt install nano
				The following NEW packages will be installed:
					nano
	
		check if nano was installed correctly (= text editor in linux)
			root@42989fcad4c0:/# nano
			ctrl + X == to eixt
			save chnages pres Y else N
	
		removes a package 
			root@42989fcad4c0:/# apt remove nano
			confirmation: Y			
		
	Linux File System & Navigating the File System
		/ => root is parent also the highest dir
			root@42989fcad4c0:/# ls
			bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
		
		blue => directory && white => files
		
		relative or absolute path for ls and cd commands
			root@42989fcad4c0:/# ls /etc/alternatives  (=> view file inside relative path, current dir is root)
			 example : root@42989fcad4c0:~/docker# ls /etc/apt (absolute path - strats from root dir)
			root@42989fcad4c0:/# cd etc (absolute path)
			root@42989fcad4c0:/etc# cd apt
			root@42989fcad4c0:/etc/apt# cd..
			bash: cd..: command not found
			root@42989fcad4c0:/etc/apt# cd ..
			root@42989fcad4c0:/etc# cd alternatives	
			root@42989fcad4c0:/etc/alternatives# cd ../..
			
		navingating to home dir 
			root@42989fcad4c0:/# cd ~
			root@42989fcad4c0:~#
				
	Manipulate Files and Directories 
		
		create a directory
			root@42989fcad4c0:/# cd ~
			root@42989fcad4c0:~# mkdir test
			root@42989fcad4c0:~# ls
			test
		
		rename files/folders/move them to other location
			root@42989fcad4c0:~# ls
			test
			root@42989fcad4c0:~# mv test docker
			root@42989fcad4c0:~# ls
			docker
			root@42989fcad4c0:~/docker# ls
			file1.txt  file2.txt  file3.txt  ls.txt
			root@42989fcad4c0:~/docker# mv ls.txt hello-docker.txt (rename)
			root@42989fcad4c0:~/docker# ls
			file1.txt  file2.txt  file3.txt  hello-docker.txt
			root@42989fcad4c0:~/docker# mv hello-docker.txt /etc/apt
			root@42989fcad4c0:~/docker# ls /etc/apt (absolute path - strats from root dir)
			apt.conf.d  auth.conf.d  hello-docker.txt  keyrings  preferences.d  sources.list  sources.list.d  trusted.gpg.d
			root@42989fcad4c0:~/docker#
				
				
		create a new file
			root@42989fcad4c0:~# ls
			docker
			root@42989fcad4c0:~# cd docker
			root@42989fcad4c0:~/docker# ls
			root@42989fcad4c0:~/docker# touch ls.txt
			root@42989fcad4c0:~/docker# ls
			ls.txt
			
		create a multiple new files in one go
			root@42989fcad4c0:~/docker# touch file1.txt file2.txt file3.txt
			root@42989fcad4c0:~/docker# ls
			file1.txt  file2.txt  file3.txt  ls.txt
		
		remove one or more files by name or pattern
			root@42989fcad4c0:~/docker# touch new.txt
			root@42989fcad4c0:~/docker# ls
			file1.txt  file2.txt  file3.txt  new.txt
			root@42989fcad4c0:~/docker# rm file1.txt
			root@42989fcad4c0:~/docker# ls
			file2.txt  file3.txt  new.txt
			root@42989fcad4c0:~/docker# rm file*
			root@42989fcad4c0:~/docker# ls
			new.txt
			root@42989fcad4c0:~/docker# cd..
			bash: cd..: command not found
			root@42989fcad4c0:~/docker# cd ..
			root@42989fcad4c0:~# ls
			docker
			root@42989fcad4c0:~# rm docker
			rm: cannot remove 'docker': Is a directory
			root@42989fcad4c0:~# rm -r docker/  (recursively remove its contents & directory) 
			root@42989fcad4c0:~# ls
			root@42989fcad4c0:~#
			
		Editing and Viewing Files
			nano is basic text editor for linux (which is also a package = helps work with all kinds of nano commands)
			install nano first
			
			root@42989fcad4c0:~# nano
			root@42989fcad4c0:~# ls
			root@42989fcad4c0:~# nano file1.txt
			root@42989fcad4c0:~# ls
			file1.txt
			root@42989fcad4c0:~# nano file1.txt  (verify your text is saved or not)
			
			to see the conteent of this file (VIEW ONLY) - cat - useful when our file is short 
			
			root@42989fcad4c0:~# cat file1.txt
			Hello World
			by aashrita
			
			dealing with viewing content of large files
				use cat to view all data at once - SCROLL BOTH WAYS
				use more cmd - view it in pages - use space to go to next page - enter for reading 1 line at a time
					more md - SCROLL DOWN ONLY feature
				use less cmd - scroll through file using up & down arrows - enter for line - space for next page - INTERACTIVE !!!
				when done - press q
			head -n 5 /etc/adduser.conf (= shows first 5 lines of file)
			tail -n 5 /etc/adduser.conf (= shows last 5 lines of file)
			
	Redirection
	
		stdIO - Input - keyboard
		stdIO - Output - Screen
		we can always change the source of input & output of the program
		redirection operator ">"
		direct output to file instead of screen
		cat = concat = combine multiple files
		
			root@42989fcad4c0:~# cat file1.txt > file2.txt
			root@42989fcad4c0:~# cat file1.txt
			Hello World
			by aashrita
			root@42989fcad4c0:~# cat file2.txt
			Hello World
			by aashrita
			root@42989fcad4c0:~# cat file1.txt  file2.txt
			Hello World
			by aashrita
			Hello World
			by aashrita
			root@42989fcad4c0:~# cat file1.txt  file2.txt > combined.txt
			root@42989fcad4c0:~# ls
			combined.txt  file1.txt  file2.txt
			root@42989fcad4c0:~# cat combined.txt
			Hello World
			by aashrita
			Hello World
			by aashrita
		
		# echo in redirection
		
			root@42989fcad4c0:~# echo yay > temp.txt
			root@42989fcad4c0:~# ls
			combined.txt  file1.txt  file2.txt  temp.txt
			root@42989fcad4c0:~# cat temp.txt
			yay
		
			
			
		