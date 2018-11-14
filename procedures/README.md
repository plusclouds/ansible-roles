# Plusclouds Ansible

## Ansible Kurulumu
```
$ sudo apt-get update
$ sudo apt-get install software-properties-common git
$ sudo apt-add-repository ppa:ansible/ansible
$ sudo apt-get update
$ sudo apt-get install ansible
```

## Standartlar

### ansible.cfg dosyasi
**Ilgili dosya kesinlikle degistirilmemelidir.**

* "inventory" hostlarin bulundugu dosyayi gostermektedir.
* "roles" rollerin bulundugu klasoru isaret etmektedir.
[Kullanilabilecek diger parametreler](http://docs.ansible.com/ansible/latest/intro_configuration.html)

### hosts dosyasi
ilgili dosyaya anlik olarak kullanilacak hostlar eklenerek playbooklar calistirilmalidir.

Ornek kullanim;

```
[yeni-redis-yenibosna-musteri-2]
100.100.100.100:9987 ansible_user=root ...
```
[Kullanilabilecek diger parametreler](http://docs.ansible.com/ansible/latest/intro_inventory.html)

### Playbook
Yeni bir playbook eklemek icin;

* hosts dosyasina ilgili playbook icin sunucu ayarlari eklenmeli.
* Kullanilacak roller playbooka eklenmeli.
* "playbooks" dizininde ansible calistirilmalidir.

Ornek playbook dosyasi;

```
- hosts: yeni-redis-yenibosna-musteri-2
  become: true
  roles:
    - RHEL7-CIS

```