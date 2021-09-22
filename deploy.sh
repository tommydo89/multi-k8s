docker build -t tommydo89/multi-client -f ./client/Dockerfile ./client
docker build -t tommydo89/multi-server -f ./server/Dockerfile ./server 
docker build -t tommydo89/multi-worker -f ./worker/Dockerfile ./worker
docker push tommydo89/multi-client
docker push tommydo89/multi-server
docker push tommydo89/multi-worker 
kubectl apply -f k8s 
kubectl rollout restart deployment/server-deployment
kubectl rollout restart deployment/client-deployment
kubectl rollout restart deployment/worker-deployment

