# Выполнено ДЗ №1

 - [+] Основное ДЗ
 - [+] Задание со *

## В процессе сделано:
 - Настроил локальное окружение
 - Создал Dockerfile запускающий веб-сервер на порту 8000, отдающий содержимое директории /app внутри контейнера по корневой ссылке / и работающий с UID 1001
 - Создал Docker-образ [my-app-nonroot] на основе созданного Dockerfile
 - Написал манифест [web-pod.yaml](kubernetes-intro/web-pod.yaml) для создания pod `web` содержащий контейнер из созданного образа my-app-nonroot.
 - Создал Docker-образ [hipstershop-fe] фронтенд микросервисного приложения [Hipster Shop]
 - Написал манифест [frontend-pod-healthy.yaml](kubernetes-intro/frontend-pod-healty.yaml) для создания pod `frontend` содержащий контейнер из образа

## Как запустить проект:
 - Запустить pod `web`
 ```
 kubectl apply -f kubernetes-intro/web-pod.yaml
 ```
 - Запустить pod `frontend`
 ```
 kubectl apply -f kubernetes-intro/frontend-pod-healty.yaml
 ```

## Как проверить работоспособность:
 - Для проверки pod `web` воспользуемся командой kubectl port-forward
 ```
 kubectl port-forward --address 0.0.0.0 pod/web 8000:8000
 ```
 - Перейти по ссылке http://localhost:8000
 - Для проверки pod `frontend` проверим статус приложения командой
 ```
 kubectl get po frontend
 ```

## PR checklist:
 - [+] Выставлен label с темой домашнего задания

[//]:
    [my-app-nonroot]:<https://hub.docker.com/r/bart08rus/my-app-nonroot>
    [hipstershop-fe]:<https://hub.docker.com/r/bart08rus/hipstershop-fe>
    [Hipster Shop]:<https://github.com/GoogleCloudPlatform/microservices-demo>

# Выполнено ДЗ №2

 - [+] Основное ДЗ
 - [+] Задание со *
 - [+] Задание со **

## В процессе сделано:
 - Настроил локальное окружение. Создал кластер
 - Написал манифест [frontend-replicaset.yaml](kubernetes-controllers/frontend-replicaset.yaml) для создания `ReplicaSet` состоящего из 3 реплик миркросервиса `frontend`
 - Написал манифест [paymentservice-replicaset.yaml](kubernetes-controllers/paymentservice-replicaset.yaml) для создания `ReplicaSet` состоящего из 3 реплик миркросервиса `paymentservice`
 - Написал манифест [paymentservice-deployment.yaml](kubernetes-controllers/paymentservice-deployment.yaml) для создания `Deployment` состоящего из 3 реплик миркросервиса `paymentservice`
 - Написал манифест [paymentservice-deployment-bg.yaml](kubernetes-controllers/paymentservice-deployment-bg.yaml) для создания `Deployment` состоящего из 3 реплик миркросервиса `paymentservice` со сценарием развертывания аналог blue-green
 - Написал манифест [paymentservice-deployment-reverse.yaml](kubernetes-controllers/paymentservice-deployment-reverse.yaml) для создания `Deployment` состоящего из 3 реплик миркросервиса `paymentservice` со сценарием развертывания Reverse Rolling Update
 - Написал манифест [frontend-deployment.yaml](kubernetes-controllers/frontend-deployment.yaml) для создания `Deployment` состоящего из 3 реплик миркросервиса `frontend`, а так же добавил `readinessProbe`
 - Написал манифест [node-exporter-daemonset.yaml](kubernetes-controllers/node-exporter-daemonset.yaml) для создания `DaemonSet` который развёртывает `Node Exporter` на каждой ноде, включая `control-plane` ноду.

## Как запустить проект:
 - Для запуска [frontend-replicaset.yaml]:
 ```
 kubectl apply -f kubernetes-controllers/frontend-replicaset.yaml
 ```
 - Для запуска [paymentservice-replicaset.yaml]
 ```
 kubectl apply -f kubernetes-controllers/paymentservice-replicaset.yaml
 ```
 - Для запуска [paymentservice-deployment.yaml]
 ```
 kubectl apply -f kubernetes-controllers/paymentservice-deployment.yaml
 ```
 - Для запуска [paymentservice-deployment-bg.yaml]
 ```
 kubectl apply -f kubernetes-controllers/paymentservice-deployment-bg.yaml
 ```
 - Для запуска [paymentservice-deployment-reverse.yaml]
 ```
 kubectl apply -f kubernetes-controllers/paymentservice-deployment-reverse.yaml
 ```
 - Для запуска [frontend-deployment.yaml]
 ```
 kubectl apply -f kubernetes-controllers/frontend-deployment.yaml
 ```
 - Для запуска [node-exporter-daemonset.yaml]
 ```
 kubectl apply -f kubernetes-controllers/node-exporter-daemonset.yaml
 ```

## Как проверить работоспособность:
 ```
 kubectl get pods -o wide
 kubectl get deployments.apps -o wide
 kubectl get replicasets.apps -o wide
 ```


## PR checklist:
 - [+] Выставлен label с темой домашнего задания

# Выполнено ДЗ №3

 - [+] Основное ДЗ
 - [+] Задание со *

## В процессе сделано:
 - Добавлены проверки readinessProbe и livenessProbe в Pod [intro/web-pod.yml](kubernetes-intro/web-pod.yaml)
 - Создан Deployment [web-deploy.yaml](kubernetes-networks/web-deploy.yaml)
 - Созданы сервисы типа [ClusterIP](kubernetes-networks/web-svc-cip.yaml), [LoadBalancer](kubernetes-networks/web-svc-lb.yaml) и [Headless](kubernetes-networks/web-svc-headless.yaml)
 - Включил IPVS
    ```
    ...
    ipvs:
        strictARP: true
    ...
    mode: "ipvs"
    ...
    ```
 - Установил MetalLB
 - Настроил балансировщик с помощью `ConfigMap`, манифест: [metallb-config.yaml](kubernetes-networks/metallb-config.yaml)
 - Сделаны манифесты сервисов типа `LoadBalancer`, которые откроют доступ к CoreDNS снаружи кластера (позволит получать записи через внешний IP).
 - Установлен `Ingress`
 - Создан файл [nginx-lb.yaml](kubernetes-networks/nginx-lb.yaml) c конфигурацией `LoadBalancer` - сервиса.
 - Создан Headless-сервис [web-svc-headless.yaml](kubernetes-networks/web-svc-headless.yaml) для нашего веб-приложения.
 - Настроен наш ingress-прокси, манифест с ресурсом `Ingress` [web-ingress.yaml](kubernetes-networks/web-ingress.yaml)
 - Установлен `kubernetes-dashboard`. Манифесты в подкаталоге [./dashboard](kubernetes-networks/.dashboard)
 - Реализовано канареечное развертывание с помощью `ingress-nginx`. Манифесты в подкаталоге [./canary](kubernetes-networks/.canary)

## Как запустить проект:
 - Установка `MetalLB` и настройка балансировщика с помощью `ConfigMap` из каталога `kubernetes-networks`
    ```sh
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.12/config/manifests/metallb-native.yaml
    kubectl apply -f metallb-config.yaml
    ```
 - Установка `Ingress` и настройка ingress-прокси из каталога `kubernetes-networks`
    ```
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/baremetal/deploy.yaml
    kubectl apply -f nginx-lb.yaml
    ```
 - Запуск веб-приложения из каталога `kubernetes-networks`
    ```
    kubectl apply -f web-deploy.yaml -f web-svc-cip.yaml -f web-svc-headless.yaml -f web-svc-lb.yaml
    ```
 - Запуск сервиса для открытия доступа к CoreDNS снаружи кластера из каталога `/kubernetes-networks/.coredns`
    ```
    kubectl apply -f .
    ```
 - Установка `kubernetes-dashboard` и открытие доступа через наш Ingress-прокси производится из каталога `./kubernetes-networks/.dashboard`
    ```
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
    kubectl apply -f .
    ```
 - Запуск веб-приложения реализовного через канареечное развертывание из каталога `/kubernetes-networks/.canary`
    ```
    kubectl apply -f .
    ```

## Как проверить работоспособность:
 - Проверка работоспособности web-приложения. Перейти по ссылке http://{ingress-nginx-service-lb-ip}/web
 - Проверка работоспособности kubernetes-dashboard. Перейти по ссылке http://{ingress-nginx-service-lb-ip}/dashboard
 - Проверка канареечного развертывания
    Запрос без HTTP-заголовка:
    ```
    curl http://{ingress-nginx-service-lb-ip}/web | grep HOSTNAME
    ```
    Ответ:
    ```
    export HOSTNAME='web-769478cfc8-l6p7g'
    ```
    Запрос с HTTP-заголовком "canary: true":
    ```
    curl -H "canary: true" http://{ingress-nginx-service-lb-ip}/web | grep HOSTNAME
    ```
    Ответ:
    ```
    export HOSTNAME='canary-b6f6ccd4d-xzxp4'
    ```

## PR checklist:
 - [+] Выставлен label с темой домашнего задания

# Выполнено ДЗ №5

 - [+] Основное ДЗ
 - [+] Задание со *

## В процессе сделано:
 - Созданы манифесты для запуска `minio` в конфигурации `StatefulSet` и headless сервиса
 - Создан манифест для установки `Secret` с переменными для `minio`
 - Внесены правки в манифест `minio-statefulset.yaml` на использование данных из `secret`'а
 - Создан манифест для проверки работоспособности и доступности `minio` в пределах кластера

## Как запустить проект:
 - Переходим в каталог `kubernetes-volumes`
 - Сперва устанавливаем `Secret`
   ```
   kubectl apply -f minio-secret.yaml
   ```
 - Запускаем `minio`
   ```
   kubectl apply -f minio-statefulset.yaml
   ```
 - Создаём `Headless Service`
   ```
   kubectl apply -f minio-headless-service.yaml 
   ```

## Как проверить работоспособность:
 - Запускаем pod с `minio-client`'ом
   ```
   kubectl apply -f minio-client-pod.yaml
   ```
 - Смотрим лог
   ```
   kubectl logs minio-client
   ```   

## PR checklist:
 - [+] Выставлен label с темой домашнего задания