# rut-conntrack-parser

This is a small awk program to parse `/proc/net/nf_conntrack` into meaningful form on Teltonika RUTx routers running RutOS (OpenWrt fork). See [forum thread](https://community.teltonika-networks.com/66676/realtime-connections-showing-impossible-incorrect-information) for more info.

Only tested on firmware 7.04.3.

## Instructions

1. ssh to your RUTx router as root
2. download `conntrack.awk` from this repo to the router, e.g. with this command:

```shell
curl -Lso /etc/conntrack.awk https://raw.githubusercontent.com/luckman212/rut-conntrack-parser/main/conntrack.awk
```

3. run the command (example):

```shell
awk -f /etc/conntrack.awk /proc/net/nf_conntrack | sort -rn | head -20
```

- It should display the top 20 traffic senders, sorted by MB sent
- Adjust the `-20` argument to `head` to see different # of results.

## Example output

> _the columns are: `
MB, #packets, protocol, src[:port], dst[:port]`_

```
52.6 160761 tcp4 23.21.95.209:5672 → 41.52.63.74:38622
37.6 112630 tcp4 23.21.95.209:5672 → 41.52.63.74:49082
34.2 27998 udp4 65.206.58.209:443 → 41.52.63.74:45517
4.0 34294 tcp4 52.72.68.64:9999 → 41.52.63.74:48686
3.7 15180 tcp4 72.4.242.105:6801 → 41.52.63.74:6936
3.7 14946 tcp4 72.4.242.105:6801 → 41.52.63.74:6957
3.5 14125 tcp4 72.4.242.106:6801 → 41.52.63.74:6943
3.4 14108 tcp4 72.4.242.104:6801 → 41.52.63.74:6924
3.1 7705 tcp4 3.138.240.185:443 → 41.52.63.74:60043
2.8 2330 udp4 65.206.58.146:443 → 41.52.63.74:54149
2.8 2299 udp4 63.117.14.80:443 → 41.52.63.74:52619
1.7 12669 udp4 34.201.228.143:4000 → 41.52.63.74:30020
1.5 18146 udp4 67.212.145.11:3478 → 41.52.63.74:40114
1.5 18140 udp4 67.212.145.11:3478 → 41.52.63.74:47748
1.3 1066 udp4 63.117.14.14:443 → 41.52.63.74:34889
1.2 10014 tcp4 3.69.112.66:15010 → 41.52.63.74:36910
1.1 12917 udp4 192.168.1.1:53 → 192.168.1.203:59234
1.1 12746 udp4 192.168.1.1:53 → 192.168.1.138:36474
1.0 12029 udp4 192.168.1.1:53 → 192.168.1.147:39190
1.0 11640 udp4 192.168.1.1:53 → 192.168.1.207:60045
```
