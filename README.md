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