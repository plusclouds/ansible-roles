# plusclouds.leo.iaas.vm.template.prepare

This role prepares the VM for the plusclouds_service script.

- Installs python3, python3-pip, and required python libraries for the script.
- Configures rc.local to execute script on boot.
- Adds the crontab rule for the script execution every 30 secs.

## Requirements

- Works on Debian and RedHat OS families.

## Example Playbook

```yaml
- name: Prepare template
  hosts: test_node
  become: false
  gather_facts: yes
  roles:
    - role: plusclouds.leo.iaas.vm.template.prepare
```

## Author Information

Talha Unsel talha.unsel@plusclouds.com
