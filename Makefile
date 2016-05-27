build:
	docker build -t jmcarbo/samba4 .

run:
	#docker run --privileged -v /data/etc:/etc/samba -v /data/var:/var/lib/samba --rm -ti -e "SAMBA_DOMAIN=samdom" -e "SAMBA_REALM=samdom.example.com" --name dc1 --dns 127.0.0.1  --hostname dc1.samdom.example.com jmcarbo/samba4
	docker run --privileged -d -e "SAMBA_DOMAIN=samdom" -e "SAMBA_REALM=samdom.example.com" --name dc1 --dns 127.0.0.1  --hostname dc1.samdom.example.com jmcarbo/samba4
