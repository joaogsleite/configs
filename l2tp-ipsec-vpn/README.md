

### Fix DNS

```
sudo vim /etc/systemd/resolved.conf
```

```
DNS=8.8.8.8 2001:4860:4860::8888
FallbackDNS=8.8.4.4 2001:4860:4860::8844
```
