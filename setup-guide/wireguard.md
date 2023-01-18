## Install wireguard

```bash
$ sudo apt install wireguard
```

## Edit config file

```bash
$ sudo vi /etc/wireguard/wg0.conf
```

## Start & Enable VPN

```bash
$ sudo systemctl enable wg-quick@wg0
$ sudo systemctl start wg-quick@wg0
```
