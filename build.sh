#!/bin/bash

# Использование значений переменных окружения по умолчанию, если они не заданы
GOOS=${GOOS:-linux}
GOARCH=${GOARCH:-amd64}

# Установка переменных окружения для компиляции под нужную платформу
export GOOS=$GOOS
export GOARCH=$GOARCH

# Компиляция
go build -o hello$([ "$GOOS" == "windows" ] && echo ".exe") main/main.go

# Сообщение о завершении компиляции
echo "Build completed for OS=$GOOS, ARCH=$GOARCH."
