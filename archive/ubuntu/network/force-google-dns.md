
* disable network manager dns
```
sudo vim /etc/NetworkManager/NetworkManager.conf
```

```
...
[main]
dns=none
...
```

* add google dns

```
sudo vim /etc/resolv.conf
```

```
nameserver 8.8.8.8
nameserver 8.8.4.4
```

