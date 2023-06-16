
# Ответы на домашнее задание к занятию 2. «Применение принципов IaaC в работе с виртуальными машинами»

## Задача 1

- Опишите основные преимущества применения на практике IaaC-паттернов.

> Позволяется быстрее обнаруживать ошибки, ускоряются и автоматизируются процессы тестирования и развертывания продукта, что в свою очередь сокращает время на доставку его конечному пользователю.

- Какой из принципов IaaC является основополагающим?

>Идемпотентность


## Задача 2

- Чем Ansible выгодно отличается от других систем управление конфигурациями?

> Не требует установки агента на хостах. Использует для управления SSH.

- Какой, на ваш взгляд, метод работы систем конфигурации более надёжный — push или pull?

> На мой взгляд - push, т.к. этот метод можно использовать без агента на целевом хосте и не нужно заботиться о его работоспособности в момент запуска каких-либо задач.


## Задача 3

Установите на личный компьютер:

- [VirtualBox](https://www.virtualbox.org/),

```
user@server-ubuntu2204:~$ vboxmanage --version
6.1.38_Ubuntur153438
```

- [Vagrant](https://github.com/netology-code/devops-materials),

```
user@server-ubuntu2204:~$ vagrant --version
Vagrant 2.3.6
```

- [Terraform](https://github.com/netology-code/devops-materials/blob/master/README.md),

```
user@server-ubuntu2204:~$ terraform --version
Terraform v1.4.6
on linux_amd64

Your version of Terraform is out of date! The latest version
is 1.5.0. You can update by downloading from https://www.terraform.io/downloads.html
```

- Ansible.

```
user@server-ubuntu2204:~$ ansible --version
ansible 2.10.8
  config file = None
  configured module search path = ['/home/user/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']      
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.10.6 (main, May 29 2023, 11:10:38) [GCC 11.3.0]
```

*Приложите вывод команд установленных версий каждой из программ, оформленный в Markdown.*

## Задача 4 

Воспроизведите практическую часть лекции самостоятельно.

- Создайте виртуальную машину.

```
user@server-ubuntu2204:~/virt-homeworks/05-virt-02-iaac/src/vagrant$ vagrant status
Current machine states:

server1.netology          running (virtualbox)

The VM is running. To stop this VM, you can run `vagrant halt` to
shut it down forcefully, or you can run `vagrant suspend` to simply
suspend the virtual machine. In either case, to restart it again,
simply run `vagrant up`.
```

- Зайдите внутрь ВМ, убедитесь, что Docker установлен с помощью команды ``` docker ps```

```
vagrant@server1:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```