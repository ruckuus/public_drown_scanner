FROM alpine:3.3

RUN apk update
RUN apk add scapy --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk add --update tcpdump python py-enum34 py-asn1 py-crypto py-pip scapy && rm /var/cache/apk/*
RUN pip install scapy-ssl_tls

ADD pyx509 pyx509
ADD scapy-ssl_tls scapy-ssl_tls
ADD scanner.py scanner.py

ENTRYPOINT ["/usr/bin/env", "python", "scanner.py"]
CMD ["localhost", "443"]
