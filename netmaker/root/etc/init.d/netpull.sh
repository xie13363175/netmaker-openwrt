        sleep 15
        netok=$(ping 114.114.114.114 -c3 |grep "time=")
        if [ "$netok" ]; then
           logger Network OK
           return
        else
           netclient pull
        fi
