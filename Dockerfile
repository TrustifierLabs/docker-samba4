FROM phusion/baseimage
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y build-essential libacl1-dev libattr1-dev \
      libblkid-dev libgnutls-dev libreadline-dev python-dev libpam0g-dev \
      python-dnspython gdb pkg-config libpopt-dev libldap2-dev \
      dnsutils libbsd-dev attr krb5-user docbook-xsl libcups2-dev acl
RUN apt-get install -y samba smbclient krb5-kdc
RUN apt-get install -y expect pwgen sssd sssd-tools

ADD sssd.conf /etc/sssd/sssd.conf
RUN chmod 0600 /etc/sssd/sssd.conf

RUN mkdir -p /etc/my_init.d
ADD samba_start /etc/my_init.d/samba_start
RUN chmod +x /etc/my_init.d/samba_start

VOLUME ["/var/lib/samba", "/etc/samba"]
EXPOSE 53 389 88 135 139 138 445 464 3268 3269
EXPOSE 53/udp
