#!/usr/bin/env bash

set -euo pipefail

(
	cd winres
	go-winres simply --icon icon.ico --arch amd64,386,arm64
)

GOOS=windows
MAIN=./cmd/main.go
LDFLAGS='-H windowsgui -s -w'

GOOS=$GOOS GOARCH=amd64 go build -o KakaoTalkAdBlock_amd64.exe -ldflags="$LDFLAGS" "$MAIN"
GOOS=$GOOS GOARCH=386 go build -o KakaoTalkAdBlock_i386.exe -ldflags="$LDFLAGS" "$MAIN"
GOOS=$GOOS GOARCH=arm64 go build -o KakaoTalkAdBlock_arm64.exe -ldflags="$LDFLAGS" "$MAIN"
