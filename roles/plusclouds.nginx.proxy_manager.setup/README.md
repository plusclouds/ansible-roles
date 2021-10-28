# plusclouds.nginx.proxy_manager.setup

This role sets up the nginx proxy manager.

## Role Variables

| Variable                    | Required | Default              | Choices | Comments                                          |
| --------------------------- | -------- | -------------------- | ------- | ------------------------------------------------- |
| proxy_manager_port          | yes      | 81                   |         | Port that nginx proxy manager's UI will listen on |
| folder_path                 | yes      | /root/npm            |         | Path to place default docker-compose file to      |
| proxy_manager_user_name     | yes      | root                 |         |                                                   |
| proxy_manager_user_password | yes      | changethis           |         |                                                   |
| proxy_manager_user_email    | yes      | admin@plusclouds.com |         |                                                   |

## Example Playbook

```yaml
- name: Setup nginx proxy manager
  hosts: targetvm
  roles:
    - plusclouds.nginx.proxy_manager.setup
  vars:
    - proxy_manager_port: 81
    - folder_path: /root/npm/
    - proxy_manager_user_name: root
    - proxy_manager_user_password: changethis
    - proxy_manager_user_email: admin@plusclouds.com
```

## Author Information

Talha Unsel - talha.unsel@plusclouds.com
