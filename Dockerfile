FROM golang:1.15
RUN go get -u github.com/nirmoy/kubevirt-serial
RUN go install github.com/nirmoy/kubevirt-serial
ENTRYPOINT ["kubevirt-serial"]
