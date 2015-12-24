.PHONY: setup test run build install

default: run

setup:
	go get -t ./...
	go get github.com/smartystreets/goconvey
	go get github.com/mailgun/godebug
	go get -u github.com/jteeuwen/go-bindata/...

build:
	go-bindata templates/
	go build

run:
	make build
	./etch

install:
	make build
	sudo mv ./etch /usr/local/bin

test:
	go test -timeout=60s ./...
