Motivation
----------

The `vpn helper` app when configured correctly will allow you to establish existing configured vpn connaction via Network Manager from command line. This comes handy when your workflow include tiling window managers & GUI-less setups.

Prerequisites
-------------

Before running/installing the `vpn helper` app please make sure the following environment variables are set:

| Environment Variable 	| Description                                                                       	|
|----------------------	|-----------------------------------------------------------------------------------	|
| VPN_CONN_UUID        	| VPN connection UUID. Can be acquired by executing `nmcli connection show`.        	|
| VPN_CONN_DEVICE      	| VPN connection device name. Can be acquired by executing `nmcli connection show`. 	|
| VPN_PASSWORD         	| Your VPN connection super secret password.                                        	|
| VPN_PASSWORD_FILE    	| Temporary file that will be used for password store. E.g. `/tmp/vpn.pass`         	|

Installation
-------------

To install the `vpn helper` app run:

```bash
make install
```
Installation does not require elevated priviledges. All components are installed into current user space & available only to a current user.

### Components:

1. `vpn` script. Uses `nmcli` & environment variables to communicate with Network Manager.
2. `vpn.service`. Systemd oneshot unit that starts vpn connection once you are logged in.

To uninstall the `vpn helper` app run:

```bash
make uninstall
```
