# How To

## Interact with Consul

`kubectl port-forward pods/consul-server-0 8500:8500`

<http://localhost:8500/>

## Deploy HashiCups

`kubectl apply -f .`

## Explore HashiCups

`kubectl port-forward service/nginx 18080:80 --address 0.0.0.0`

<http://localhost:18080/>

### Links

Based on: <https://learn.hashicorp.com/tutorials/consul/service-mesh-deploy/>
