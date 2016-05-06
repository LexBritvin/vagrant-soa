## Что это

Проект содержит конфигурацию Vagrant с LAMP (Linux, Apache2, MySQL, PHP) для выполнения заданий по курсу Веб сервисы

## Что необходимо установить

1. [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. [Vagrant](https://www.vagrantup.com/downloads.html)

## Что установлено

* apache2
* php7.0
* mysql5.5
* phpmyadmin

## Как запустить

### Windows

// TODO: Проверить Windows

### Linux

```
   git clone git ...
   cd vagrant-soa-ws
   vagrant up
```

Чтобы зайти на виртуальную машину
```
   vagrant ssh
```
Виртуальные машины доступны из virtualbox.

## Проверить, что всё работает

Перейти на страницу **PhpMyAdmin**

http://localhost:8080/phpmyadmin

Логин: root

Пароль: root

## Как это устроено

В папке www должны лежать файлы ваши задания. 
В папке apache2-sites располагаются конфигурации виртуальных серверов apache2, в эту папку можно положить свои конфиги и перезагрузить Vagrant с помощью "vagrant reload"


