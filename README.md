# host-docker-internal
Testing Linux behavior for `host.docker.internal`

On linux you must use `extra_hosts` `"host.docker.internal:host-gateway"`

See: https://stackoverflow.com/a/67158212

## Output

The difference between `test-1` and `test-2` is that `test-2` has the `extra_hosts` definition

```
$ docker compose run test-1
[+] Building 0.0s (0/0)
[+] Creating 1/0
 ✔ Container host-docker-internal-web-1  Running                                                                                                          0.0s
[+] Building 0.0s (0/0)
-------
Content of /etc/hosts
-------
127.0.0.1	localhost
::1	localhost ip6-localhost ip6-loopback
fe00::0	ip6-localnet
ff00::0	ip6-mcastprefix
ff02::1	ip6-allnodes
ff02::2	ip6-allrouters
172.24.0.3	83c6d6256131
-------
Trying to reach host.docker.internal
-------
curl: (6) Could not resolve host: host.docker.internal
```

```
$ docker compose run test-2
[+] Building 0.0s (0/0)
[+] Creating 1/0
 ✔ Container host-docker-internal-web-1  Running                                                                                                          0.0s
[+] Building 0.0s (0/0)
-------
Content of /etc/hosts
-------
127.0.0.1	localhost
::1	localhost ip6-localhost ip6-loopback
fe00::0	ip6-localnet
ff00::0	ip6-mcastprefix
ff02::1	ip6-allnodes
ff02::2	ip6-allrouters
172.17.0.1	host.docker.internal
172.24.0.3	58fcfbafddb3
-------
Trying to reach host.docker.internal
-------
HTTP/1.1 200 OK
Server: nginx/1.25.1
Date: Sun, 18 Jun 2023 18:53:52 GMT
Content-Type: text/html
Content-Length: 615
Last-Modified: Tue, 13 Jun 2023 17:34:28 GMT
Connection: keep-alive
ETag: "6488a8a4-267"
Accept-Ranges: bytes
```
