FROM debian:jessie
MAINTAINER Simão Martins "simao.martins@tecnico.ulisboa.pt"

RUN apt-get -qq -y update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y vim krb5-user \
    openafs-client openafs-krb5 openafs-modules-dkms && \
  apt-get clean

COPY init-script.sh configureAFSClient.sh configureKerberosClient.sh /tmp/
CMD /tmp/init-script.sh