UNIX / LINUX Commands

FILE SYSTEM

ls — list items in current directory

ls -l — list items in current directory and show in long format to see perimissions, size, and modification date

ls -a — list all items in current directory, including hidden files

ls -F — list all items in current directory and show directories with a slash and executables with a star

ls dir — list all items in directory dir

cd dir — change directory to dir

cd .. — go up one directory

cd / — go to the root directory

cd ~ — go to to your home directory

cd - — go to the last directory you were just in

pwd — show present working directory

mkdir dir — make directory dir

rm file — remove file

rm -r dir — remove directory dir recursively

cp file1 file2 — copy file1 to file2

cp -r dir1 dir2 — copy directory dir1 to dir2 recursively

mv file1 file2 — move (rename) file1 to file2

ln -s file link — create symbolic link to file

touch file — create or update file

cat file — output the contents of file

less file — view file with page navigation

head file — output the first 10 lines of file

tail file — output the last 10 lines of file

tail -f file — output the contents of file as it grows, starting with the last 10 lines

vim file — edit file

alias name 'command' — create an alias for a command

SYSTEM

shutdown — shut down machine

reboot — restart machine

date — show the current date and time

whoami — who you are logged in as

finger user — display information about user

man command — show the manual for command

df — show disk usage

du — show directory space usage

free — show memory and swap usage

whereis app — show possible locations of app

which app — show which app will be run by default

PROCESS MANAGEMENT

ps — display your currently active processes

top — display all running processes

kill pid — kill process id pid

kill -9 pid — force kill process id pid

PERMISSIONS

ls -l — list items in current directory and show permissions

chmod ugo file — change permissions of file to ugo - u is the user's permissions, g is the group's permissions, and o is everyone else's permissions. The values of u, g, and o can be any number between 0 and 7.

7 — full permissions

6 — read and write only

5 — read and execute only

4 — read only

3 — write and execute only

2 — write only

1 — execute only

0 — no permissions

chmod 600 file — you can read and write - good for files

chmod 700 file — you can read, write, and execute - good for scripts

chmod 644 file — you can read and write, and everyone else can only read - good for web pages

chmod 755 file — you can read, write, and execute, and everyone else can read and execute - good for programs that you want to share

NETWORKING

wget file — download a file (webget)

curl file — download a files

scp user@host:file dir — secure copy a file from remote server to the dir directory on your machine

scp file user@host:dir — secure copy a file from your machine to the dir directory on a remote server

scp -r user@host:dir dir — secure copy the directory dir from remote server to the directory dir on your machine

ssh user@host — connect to host as user

ssh -p port user@host — connect to host on port as user

ssh-copy-id user@host — add your key to host for user to enable a keyed or passwordless login

ping host — ping host and output results

whois domain — get information for domain

dig domain — get DNS information for domain

dig -x host — reverse lookup host

lsof -i tcp:1337 — list all processes running on port 1337

netstat -anp | grep 80 or 8080


SEARCHING

grep pattern files — search for pattern in files

grep -r pattern dir — search recursively for pattern in dir

grep -rn pattern dir — search recursively for pattern in dir and show the line number found

grep -r pattern dir --include='*.ext — search recursively for pattern in dir and only search in files with .ext extension

command | grep pattern — search for pattern in the output of command

find file — find all instances of file in real system

locate file — find all instances of file using indexed database built from the updatedb command. Much faster than find

sed -i 's/day/night/g' file — find all occurrences of day in a file and replace them with night - s means substitude and g means global - sed also supports regular expressions

COMPRESSION

tar cf file.tar files — create a tar named file.tar containing files

tar xf file.tar — extract the files from file.tar

tar czf file.tar.gz files — create a tar with Gzip compression

tar xzf file.tar.gz — extract a tar using Gzip

gzip file — compresses file and renames it to file.gz

gzip -d file.gz — decompresses file.gz back to file

SHORTCUTS 

ctrl+a — move cursor to beginning of line

ctrl+f — move cursor to end of line

alt+f — move cursor forward 1 word

alt+b — move cursor backward 1 word

## scp copy in aws 
only file :- scp -i r_login.pem  artifactory-oss-6.7.2.tar.gz  ec2-user@34.222.132.1:/home/ec2-user 
for folder :- scp -ri r_login.pem  artifactory-oss-6.7.2.tar.gz  ec2-user@34.222.132.1:/home/ec2-user


## Download Demo File from web 
curl https://s3.amazonaws.com/aws-cli/awscli-bundle.zip -o awscli-bundle.zip

| Command | Description |
| ------- | ----------- |
 | tar cvf foldername.tar foldername | to tar the folder |
 |tar cvfz foldername.tgz foldername | to tar the folder with tgz |
 |check which os running| `ls /etc/*release*`|
 |check OS version|`cat /etc/centos-release`|
 |download file and save it to filename.txt|curl URL -O filename.txt|
 | generate sshkeys | ssh-keygen |
 | ssh-keyden location | /root/.ssh/ |
 |how to enable password less ssh|copy id_rsa.pub to other server /root/.ssh/authorized_keys |
 | How to check connection of DB from cli | telnet db-endpoint portnumber |
 | How to get LB endpoint using cli | nslookup endpoint |
 | How to see disk space available on file system | df -lh |
 | To see the free disk | fdisk -l |
 | To list the disk mounted | lsblk |
 | Resize or expand the disk size | resize2fs /dev/diskname |
 | Check healt status code | curl -v https:127.0.0.1:port |
 | ssh using currepted pem | ssh -o PubkeyAcceptedKeyTypes=ssh-rsa -i your-pem.pem user@host |
 | set time on server | timedatectl set-time "2024-05-06 09:07" |
 | set time on server to timezone | sudo timedatectl set-timezone Australia/Melbourne |

-----------------------------------------------------------------------------------------------------------------------------------------------------------

### Tmux Cheet Sheet
| Command | Description |
| ------- | ----------- |
 | tmux ls | list sessions |
 | tmux new -s <session_name> | Create new sessions |
 | tmux a -t psqldump | Attach sessions psqldump |
 | tmux detach | detach session |
 | tmux detach -s <session_name> | detach specific session |
 | for i in {1..4}; do tmux new-session -d -s session$i; done | Create 4 session at a time |
 | Ctrl + B, then Arrow Keys | Move between panels | 
 | Ctrl + B, then X (confirm with Y) | Kill panel |
 | Ctrl + B, Shift + % | Split sesson Horizontal |
 | Ctrl + B, Shift + " | Split sesson Vertical |
 | tmux kill-session -t mysession | Kill session without attaching it |
 | tmux kill-server | Kill all sessions with single command |
 | Cntrl + b, d | To exit or detach current sessions |
 | tmux rename-session -t mysession newsession | Rename session |
 | `tmux new-session -s mysession \;` <br> `split-window -h \;` <br> `split-window -v -t 0 \;` <br> `split-window -v -t 1 \;` <br> `select-layout tiled` | Create 1sessiona nd split into 4 panels |


 Here is the script to create a session and automitcally split into 4 windows/panels
```
#!/bin/bash

# Start a new tmux session named "main"
tmux new-session -d -s main

# Split the screen into four equal panes
tmux split-window -h -t main      # Split into left and right
tmux split-window -v -t main:0.0  # Split left pane into top-left and bottom-left
tmux split-window -v -t main:0.1  # Split right pane into top-right and bottom-right

# Adjust pane sizes equally
tmux select-layout -t main tiled

# Start different tmux sessions inside each pane
tmux send-keys -t main:0.0 "tmux new-session -A -s session1" C-m
tmux send-keys -t main:0.1 "tmux new-session -A -s session2" C-m
tmux send-keys -t main:0.2 "tmux new-session -A -s session3" C-m
tmux send-keys -t main:0.3 "tmux new-session -A -s session4" C-m

# Attach to the main session
tmux attach -t main

```
save the above script as start_tmux_4_panels.sh and create alias in ~/.bash_profile as 

```
alias tmux4='/mnt/d/Workspace/bitbucket/start_tmux_4_panels.sh'
```
This will create a alias and would be easy to use

#### Single command to create a sessiona nd split to 4 parts.
```
tmux new-session -s mysession \; \
    split-window -h \; \
    split-window -v -t 0 \; \
    split-window -v -t 1 \; \
    select-layout tiled
```
