FROM golang:1.17 as build

WORKDIR /usr/src/app

COPY ./app/ .

RUN go mod edit -module=example.com/mod

RUN go build code-education.go

FROM scratch

WORKDIR /usr/src/app

COPY --from=build /usr/src/app .

ENTRYPOINT [ "./code-education" ]
