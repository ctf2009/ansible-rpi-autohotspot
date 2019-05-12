## Ansible RPi Auto Hotspot 

This is an example that demonstrates how to deploy the auto hotspot as described at 

[http://www.raspberryconnect.com/network/item/331-raspberry-pi-auto-wifi-hotspot-switch-no-internet-routing]()

All credit for the auto hotspot scripts go to raspberryconnect.com

This is simply a demonstration of how to automate this for simple deployment onto a raspberry pi

This has been tested on Raspbian Jessie

### Prerequisites 
This guide assumes the following. 

- You are running this from a *nix based OS
- You have Ansible installed: [https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html]()
- You have a freshly minted Raspberry Pi Raspbian SD card ready to go
- Your Raspberry Pi is running and is accessible from the local machine and has SSH enabled

If you have changed the hostname or the default user (pi) you will have to update the inventory file to reflect this

### How to Run

- Clone this repository to your local machine
- Run the `run_ping.sh` script to verify that the Pi is available. e.g

```
./run_ping.sh 
SSH password: 

PLAY [all] *************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************
ok: [raspberrypi.local]

TASK [ping : ping] *****************************************************************************************************
ok: [raspberrypi.local]

PLAY RECAP *************************************************************************************************************
raspberrypi.local          : ok=2    changed=0    unreachable=0    failed=0 

```
- If all is good. Try running the `run_provision.sh` script. This may take a few minutes to complete. e.g 

```
./run_provision.sh 
SSH password: 
/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/requests/__init__.py:91: RequestsDependencyWarning: urllib3 (1.24) or chardet (3.0.4) doesn't match a supported version!
  RequestsDependencyWarning)

PLAY [all] *******************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************
ok: [raspberrypi.local]

TASK [autohotspot : create required directories] *****************************************************************************************************************************
changed: [raspberrypi.local] => (item=/home/pi/autohotspot)

TASK [autohotspot : apt install libs] ****************************************************************************************************************************************
[DEPRECATION WARNING]: Invoking "apt" only once while using a loop via squash_actions is deprecated. Instead of using a loop to supply multiple items and specifying `name: 
{{item}}`, please use `name: [u'hostapd', u'dnsmasq']` and remove the loop. This feature will be removed in version 2.11. Deprecation warnings can be disabled by setting 
deprecation_warnings=False in ansible.cfg.
changed: [raspberrypi.local] => (item=[u'hostapd', u'dnsmasq'])

TASK [autohotspot : stop services from running] ******************************************************************************************************************************
changed: [raspberrypi.local] => (item=hostapd)
changed: [raspberrypi.local] => (item=dnsmasq)

TASK [autohotspot : sysctl] **************************************************************************************************************************************************
changed: [raspberrypi.local]

TASK [autohotspot : hostapd configuration] ***********************************************************************************************************************************
changed: [raspberrypi.local]

TASK [autohotspot : hostapd defaults] ****************************************************************************************************************************************
changed: [raspberrypi.local]

TASK [autohotspot : dnsmasq config] ******************************************************************************************************************************************
changed: [raspberrypi.local]

TASK [autohotspot : copy example wpa_supplicant] *****************************************************************************************************************************
changed: [raspberrypi.local]

TASK [autohotspot : lineinfile] **********************************************************************************************************************************************
changed: [raspberrypi.local]

TASK [autohotspot : autohotspot script] **************************************************************************************************************************************
changed: [raspberrypi.local]

TASK [autohotspot : autohotspot service file] ********************************************************************************************************************************
changed: [raspberrypi.local]

TASK [autohotspot : autohotspot service] *************************************************************************************************************************************
changed: [raspberrypi.local]

TASK [autohotspot : scripts] *************************************************************************************************************************************************
changed: [raspberrypi.local] => (item=disable.sh)
changed: [raspberrypi.local] => (item=enable.sh)
changed: [raspberrypi.local] => (item=check.sh)

RUNNING HANDLER [autohotspot : reload systemd] *******************************************************************************************************************************
changed: [raspberrypi.local]

PLAY RECAP *******************************************************************************************************************************************************************
raspberrypi.local          : ok=15   changed=14   unreachable=0    failed=0 
```

Once completed, the auto hotspot should be enabled by default. If on restart a known Wifi connection cannot be found, the Pi will create its own Hotspot named `raspberrypi`

### Known Issues

There is a potential issue where hostapd will not start correctly with the error

```
Failed to start hostapd.service: Unit hostapd.service is masked.
```

To correct this run `sudo systemctl unmask hostapd` 
This will be corrected in the scripts shortly


There are also come deprication warnings with ansible > v2.7 
This will be corrected shortly






