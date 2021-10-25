# plusclouds.nginx.proxy_manager.setup

This role sets up the nginx proxy manager.

## Role Variables

| Variable           | Required | Default | Choices | Comments                                          |
| ------------------ | -------- | ------- | ------- | ------------------------------------------------- |
| proxy_manager_port | yes      |         |         | Port that nginx proxy manager's UI will listen on |
| folder_path        | yes      |         |         | Path to place default docker-compose file to      |

## Example Playbook

```yaml
- name: Setup nginx proxy manager
  hosts: targetvm
  roles:
    - plusclouds.nginx.proxy_manager.setup
  vars:
    - proxy_manager_port: 81
    - folder_path: /root/npm/
```
