# Born2beroot
My work for 42 project Bron2beroot (aka b2b)


Project Goal:
- To setup a virtual computer with either Debian or Rocky on vertual environment (I use the Vertualbox)
- Install the operating system of your choice (Debian/Rocky) and configure your system as required
- Download any necessary packages and service in your system

Bonus Part:
1. Create new partitions and mount the correct directories to new partitions
2. Setup a Wordpress web page
3. Choose and install a service to your virtual machine

Turn In:
The signature (SHA1) of your VM.vdi (Checkout "Snapshot" to save yourself)

## Key Takeaways

### Operating System: Debian
- Everything in Linux/Unix is a file
  - Objects in filsystem
    - Objects like directories is a file which contained name and I-number
    - The name (e.g. dirctory/) is a string of text which is called "inode" or "I-number"
    - inodes are stored on disk in inode table

  - Devices
    - Represented as file-like object in 
    - This is different from Windows (device node in Plug and Play(PnP) device tree)

  - Advantage of the filesystem
    - Can use the same api(Application Programming Interface) and tools (e.g. shell, pipe, echo) as for files

  - FHS (Filesystem Hierarchy Standard): Common filesystem outline
    - /bin	=> binaries: basic program and applications' binary files are stored here (e.g. echo, cat, awk)
    - /sbin	=> system binaries: program and applications which are only for system administrator unless the user has permission (e.g. sudo, sysctl)
    - /boot	=> boot: what system need to start the operating system. Messing with this directory can kill your OS :)
    - /dev	=> device: device name files are stored here (e.g. sda)
    - /etc	=> exetera: system-wide configuration files are stored here (e.g. cron, apt)
    - /home	=> home: home folders for users are stored here
    - /lib	=> library: fuctions libraries for bin/sbin are stored here
    - /mnt	=> mount: where your mount your storage devices to partitions
    - /opt	=> optional: manual installed software are stored (e.g. google/chrome)
    - /proc	=> process: system processe and resource files are stored here (e.g. cpuinfo, uptime)
    - /root	=> root: special file for root user
    - /srv	=> server: if you are running a server like web server, the files which external users can access are stored here
    - /sys	=> system:
    - /tmp	=> temperary:
    - /urs	=> user: application installed by user are stored here
    - /var	=> variable:

### LVM 
