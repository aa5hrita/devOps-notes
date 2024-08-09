Docker Tutorial for Beginners - Programming with Mosh

Tutorial Link - https://www.youtube.com/watch?v=pTFZFxd4hOI

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

DOCKER101
	Docker - A patform for building, running and shipping applications.

	Reasons why apps run on DEV machines but not on other environments when hosted.
        - one/more files missing
        - software version mismatch
        - Different configuration settings (env vars, .prop files)

	$ docker-compose up
	docker automatically downloads and runs the dependencies in the package in an isolated environmets known as CONTAINERS

	Containers allow multiple applications to use different versions of software simutaneously

	Once we dont decide not to work on an application 
		- we can remove an application & all its dependencies in one go confidently! (usually dev's machine gets cluttered an dis afraid to remove a file in order to clear the project. 
		$ docker-compose down --rmi all	

Virtual Macine - Disadvantages !!
	- Hyperrvisor - VMWare
	- physical hardware limit (CPU, RAM & Disk space allotment)
	- VM needs a full blown OS
	- Slow to start
	- Resource intensive

Containers
	- allows runnning multiple applications in isolation
	- lightweight
	- use the OS of the host (liscence, patch & monitor a single OS)
	- Starts quickly
	- need less hardware resources 
	
	coz of which we can run 100s of containers on a single OS simutaneously

	Containers = Process
		- all containers on a host share the OS of the host, specifically they shar ethe KERNEL of the host OS!
		- KERNEL = core of the OS (engine that manages CPU, processess & hardware resources), these kernels have API's which differes from OS to OS.
		- windows apps cant be run on a linux machine (under the hood these apps talk to teh kernel of the underlying OS Kernel

		$ C:\Users\Aashrita>docker version
		Client:
		 Version:           27.0.3
		 API version:       1.46
		....

Development workflow when using docker
	- take application & dockerise it
	- add dockerfile - text file that includes instructions to pkg up this application into an image, once we have an image we can ship, build and run it literally anywhere!! (this image contains everything our application needs to run)
		- a cut down OS
		- a RT environment
		- application files
		- third party libraries
		- env vars and etc...
	- once we have image file -> we ask docker to start a container using taht image
	- container is a process that has its own file system which is provided by the image
	- our application gets loaded onto a container & is ready to run locally in a container as per docker commands
	- dev image is ready we can push it docker registry = docker hub (a storage for docker images that anyone can use)
	- once its on docker hub (github for git) we can download and put it on any machine(TEST/PROD) that has docker and run it !!!
	- with docker we no longer have to maintain long release documents that have to be precisely followed.

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
			
			