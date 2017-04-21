## Varnish Image

* Ubuntu 16.04
* S6 overlay for service control
* Varnish 5.1 deb package from varnish-cache.org
* mount vcl dir as volume to /etc/varnish in container
* reload vcl with `/usr/bin/docker exec varnish /usr/share/varnish/reload-vcl`

Work in progress ...
