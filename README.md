# vlanConfig

Bash script to configure vlan on your linux (tested on debian).

**./vlanConfig.sh eth0 10 192.168.2.0/24**  

>module 8021q loaded  
vlan package OK  
Added VLAN with VID == 10 to IF -:eth0:-
eth0.10   Link encap:Ethernet  HWaddr 00:aa:aa:aa:aa:aa  
          inet adr:192.168.2.0  Bcast:0.0.0.0  Masque:255.255.255.0  
          UP BROADCAST MULTICAST  MTU:1500  Metric:1  
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0  
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0  
          collisions:0 lg file transmission:0  
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)  

 **./vlanRm.sh eth0 10**
>module 8021q loaded  
vlan package OK  
Removed VLAN -:eth0.10:-  
