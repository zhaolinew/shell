#!/usr/bin/expect 
set timeout -1
spawn ssh root@192.168.205.130
expect {
"yes/no" { send "yes\r" }
"password" { send "cjibill13\r" }
}
expect eof
