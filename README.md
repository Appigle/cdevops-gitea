# cdevops-gitea

k8s gitea lab to take dev (sqlite based) to prod (mysql based)

TLDR;

```bash
cd dev && ansible-playbook up.yaml
```

If that fails you may need some pre-requisites

1. Make sure that docker is running by doing `docker ps` until it shows

```
CONTAINER ID   IMAGE                            COMMAND                  CREATED         STATUS         PORTS                             NAMES

```

2. run `ansible-playbook --version` to see if you have ansible. If not run:

```bash
bash <(curl -Ls https://raw.githubusercontent.com/conestogac-acsit/cdevops-bootstrap/refs/heads/main/bootstrap.sh)
```

3. run `kubectl get ns default` to see if you have a cluster. The expected result is:

```
NAME      STATUS   AGE
default   Active   29m
```

If you have another result try installing a k8s cluster:

```bash
bash <(curl -Ls https://raw.githubusercontent.com//conestogac-acsit/cdevops-bootstrap/refs/heads/main/k8s.sh)
```

Once you have made it through the `up.yaml` playbook you can forward the port:

```bash
kubectl port-forward svc/gitea-http 3000:3000
```

Now you should be able to access gitea in development mode.

The challenge is to run this in production mode from a prod folder at the same level as the dev folder with it's own up, down and values.yaml.

### Points to Cover

## Marking

| Item                                                                                                                   | Out Of |
| ---------------------------------------------------------------------------------------------------------------------- | -----: |
| use [the gitea helm](https://gitea.com/gitea/helm-gitea) to make the repository data persistent                        |      2 |
| change the root password for the provided mysql service                                                                |      2 |
| make gitea use the provided mysql service                                                                              |      2 |
| Use [this article](https://blog.techiescamp.com/using-ngrok-with-kubernetes/) to expose your gitea instance publically |      2 |
| create a public clone of your finished work, based on this template on your gitea                                      |      1 |
| make sure that your instance is running for marking and submit a link to the repository from the previous step         |      1 |
|                                                                                                                        |        |
| total                                                                                                                  |     10 |

```
kubectl port-forward mysql-6d544974d7-pf2sr 8080:8080
```

https://github.com/rhildred/bootstrap

To get to these machines go to `ssh ubuntu@10.172.27.31` for instance. The password is Secret55

sudo rm /etc/apt/source.list

https://dash.cloudflare.com/argotunnel?aud=&callback=https%3A%2F%2Flogin.cloudflareaccess.org%2FjR_RYTLfL_hKBMNpH5Ev066WEX0VCKiBYYGWdpPlNVQ%3D

Created tunnel ray_cloudflare_tunnel_container_orc with id f4f36cda-477d-4b94-8564-d00b95ddb4fe
