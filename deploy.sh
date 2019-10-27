docker build -t avincze73/complex-client:latest -t avincze73/complex-client:$SHA -f ./client/Dockerfile ./client
docker build -t avincze73/complex-server:latest -t avincze73/complex-server:$SHA -f ./server/Dockerfile ./server
docker build -t avincze73/complex-worker:latest -t avincze73/complex-worker:$SHA -f ./worker/Dockerfile ./worker

docker push avincze73/complex-client:latest
docker push avincze73/complex-server:latest
docker push avincze73/complex-worker:latest

docker push avincze73/complex-client:$SHA
docker push avincze73/complex-server:$SHA
docker push avincze73/complex-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=avincze73/complex-server:$SHA
kubectl set image deployments/client-deployment client=avincze73/complex-client:$SHA
kubectl set image deployments/worker-deployment worker=avincze73/complex-worker:$SHA