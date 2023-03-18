# how to setup Proxmox in laptop

## disable suspend

```bash
$ systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

```bash
$ nano /etc/systemd/logind.conf

---

HandleSuspendKey=ignore
HandleHibernateKey=ignore
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore

---

$ systemctl restart systemd-logind
```

## links

[disable suspend1](https://warumono.com/2022/02/20/%e3%83%8e%e3%83%bc%e3%83%88%ef%bd%90c%e3%81%ae%e7%94%bb%e9%9d%a2%e9%96%89%e3%81%98%e3%81%9f%e6%99%82%e3%81%aeproxmox%e8%a8%ad%e5%ae%9a%e3%83%a1%e3%83%a2/)

[disable suspend2](https://serverfault.com/questions/1045949/how-to-disable-suspend-on-ubuntu-20-04-systemd-via-cli)

[if you delete /var/log](https://forum.proxmox.com/threads/cannot-access-web-gui.107376/)