
### Fix eGPU on Ubuntu 19.10

* Edit xorg nvidia conf
```
sudo vim /usr/share/X11/xorg.conf.d/10-nvidia.conf
```

* Add this line

```
Option "AllowExternalGpus" "true"
```


