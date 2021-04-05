### Sample Execution 

#### Build

```shell
sudo podman build -t postgres:v0.2 -f Dockerfilev2
```
#### Run


```shell
sudo podman run  -d  --name=mydbv2 -e POSTGRE_ROOT_PASSWORD=root123 -e POSTGRE_USER=user1  -e POSTGRE_PASSWORD=user1 -e POSTGRE_DATABASE=items  -v /var/local/postgre2:/var/lib/pgsql/data  localhost/postgres:v0.2
```
