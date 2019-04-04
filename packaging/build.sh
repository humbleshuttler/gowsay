#! /bin/bash
version=$(cat packaging/cowsay.goospec | sed -nE 's/.*"version":.*"(.+)".*/\1/p')
if [[ $? -ne 0 ]]; then
    echo "could not match version in goospec"
    exit 1
fi

echo "present working directory is $PWD"
GOOS=windows /tmp/go/bin/go build -ldflags "-X main.version=${version}" -o cowsay.exe
