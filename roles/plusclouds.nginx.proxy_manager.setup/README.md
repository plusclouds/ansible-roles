# plusclouds.nginx.proxy_manager.setup

This role sets up the nginx proxy manager.

## Role Variables

| Variable    | Required | Default | Choices | Comments                                     |
| ----------- | -------- | ------- | ------- | -------------------------------------------- |
| folder_path | yes      |         |         | Path to place default docker-compose file to |

## Example Playbook

```yaml
- name: Setup nginx proxy manager
  hosts: targetvm
  roles:
    - plusclouds.nginx.proxy_manager.setup
  vars:
    - folder_path: /root/dr1/
```
