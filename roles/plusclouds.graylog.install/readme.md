# GrayLog 3.3 Ansible role

This role will install graylog 3.3 on Debian

## Requirements



## Role Handlers

## Tags

## Role Variables

## Example

### Requirements

_Use a fixed tag instead of origin/master if possible_

### Playbook

```yaml
- name: Deploy LNMP Wordpress Requirements
  hosts: test_server
  become: yes
  gather_facts: yes
  roles:
    - role: plusclouds.graylog.install

```

### Inventory



## Notes
