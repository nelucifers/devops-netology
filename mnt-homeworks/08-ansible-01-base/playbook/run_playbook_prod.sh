#!/bin/bash
### В корне проект добавлены файлы ansible.cfg (добавлено расположение файла с паролем) и .vault_pass (файл с паролем)

# Запуск контейнеров
docker run --name centos7 -d centos sleep infinity
docker run --name fedora -d pycontribs/fedora sleep infinity
docker run --name ubuntu -d matthewfeickert/docker-python3-ubuntu sleep infinity

# Запуск плейбука
ansible-playbook site.yml -i inventory/prod.yml

# Остановка контейнеров
docker stop centos7 fedora ubuntu

