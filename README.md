## О проекте

Проект содержит конфигурацию Vagrant с LAMP (Linux, Apache2, MySQL, PHP) для выполнения заданий по курсу Веб сервисы

## Как установить

### Что необходимо установить

1. [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. [Vagrant](https://www.vagrantup.com/downloads.html)

### Что используется в Vagrant

* ubuntu 14.04 x64
* apache2.4
* php7.0
* mysql5.5
* phpmyadmin

### Как запустить

#### Windows

Рано или поздно, всё равно пришлось бы установить Git, поэтому:

1. Скачиваем и устанавливаем [Git для Windows](https://git-scm.com/download/win)
2. Запускаем Git Bash из меню Пуск
3. Всё, ребята, Вы с нами, дальше как на Linux.

#### Linux
Если ещё не стоит git:
```
sudo apt-get install git
```

Скачиваем последнюю версию проекта:

```
git clone https://github.com/LexBritvin/vagrant-soa.git
cd vagrant-soa
vagrant up
```

Чтобы обновить проект, в папке с проектом необходимо ввести:

```
git pull
```

Чтобы зайти на виртуальную машину по SSH
```
vagrant ssh
```
Виртуальные машины доступны из virtualbox.

#### Проверить, что всё работает

Перейти на страницу PhpMyAdmin
```
http://localhost:8080/phpmyadmin
```
* Логин: root
* Пароль: root

## Как это устроено

* В папке www должны лежать файлы ваши задания. 
* В папке apache2-sites располагаются конфигурации виртуальных серверов apache2, в эту папку можно положить свои конфиги и перезагрузить Vagrant с помощью "vagrant reload"


