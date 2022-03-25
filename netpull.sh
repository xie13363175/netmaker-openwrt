        sleep 15
        netok=$(ping 192.168.88.1 -c3 |grep "time=")
        if [ "$netok" ]; then
           logger Network OK
           return
        else
           netclient pull
        fi
