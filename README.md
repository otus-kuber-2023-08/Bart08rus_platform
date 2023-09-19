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
