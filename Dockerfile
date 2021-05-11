FROM golang:1.15
RUN git clone https://github.com/nirmoy/kubevirt-serial
WORKDIR kubevirt-serial
RUN go build
RUN cp ./kubevirt-serial /
#RUN go get -u github.com/nirmoy/kubevirt-serial
ENTRYPOINT ["/kubevirt-serial"]
