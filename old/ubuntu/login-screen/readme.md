
* change login screen background
```
sudo vim /etc/alternatives/gdm3.css
```

```
#lockDialogGroup {
  background-color: #000000;
}
```

* disable user list

```
/etc/gdm3/greeter.dconf-defaults
```

```
[org/gnome/login-screen]
disable-user-list=true
```
