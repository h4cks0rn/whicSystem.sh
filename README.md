# whicSystem.sh
It allows to recognize the operating system in a host based on the TLL.

whicSystem.sh is a script written in the bash shell that allows you to recognize the system installed on a host by sending an ICMP trace using the ping 
command and parsing the response in the (TTL) part to detect and detect through the (TTL) ranges. report by terminal the installed system is windows 
or linux.

Install  

$ git  clone  https://github.com/th3hostname/whicSystem.sh.git
$ chmod  777  whicSystem.sh
$ sudo mv  whicSystem.sh  /usr/bin 

usage:  whicSystem.sh  google.com  
