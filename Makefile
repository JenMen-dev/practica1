## Configure Go build options
GIN_MODE = "release"
CGO_ENABLED = 0

## Configure DB connection params
DB = "root:password@(localhost:3306)/library"

run:
	 cd cmd/geekshubs-library && GIN_MODE=${GIN_MODE} DB=${DB} go run main.go

test:
	cd pkg && CGO_ENABLED=${CGO_ENABLED} go test ./...

lint:
	go get -u golang.org/x/lint/golint
	golint -set_exit_status ./...

accept:
	curl --fail http://localhost:8080/api/

run-docker:
	docker-compose up -d

build:
	# MacOS
	cd cmd/geekshubs-library && GOOS=darwin GOARCH=amd64 go build -o ../../bin/main-darwin-amd64 main.go
	# Linux
	cd cmd/geekshubs-library && GOOS=linux GOARCH=amd64 go build -o ../../bin/main-linux-amd64 main.go
	# Windows
	cd cmd/geekshubs-library && GOOS=windows GOARCH=amd64 go build -o ../../bin/main-windows-amd64 main.go

