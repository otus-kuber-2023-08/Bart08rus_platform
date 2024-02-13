#!/bin/bash
## Авторизуемся в Харборе
helm registry login https://harbor.158.160.128.224.nip.io --username admin --password Harbor12345

## Запковываем чарты
helm package kubernetes-templating/frontend
helm package kubernetes-templating/hipster-shop

## Пушим Чарты
helm push frontend-0.1.0.tgz oci://harbor.158.160.128.224.nip.io/library
helm push hipster-shop-0.1.0.tgz oci://harbor.158.160.128.224.nip.io/library

## Используем чарты
helm upgrade --install frontend oci://harbor.158.160.128.224.nip.io/library/frontend --version 0.1.0 --namespace hipster-shop --create-namespace
helm upgrade --install hipster-shop oci://harbor.158.160.128.224.nip.io/library/hipster-shop --version 0.1.0 --namespace hipster-shop --create-namespace