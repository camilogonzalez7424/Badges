kubectl apply -f ./pvc/ -n databases
kubectl apply -f ./deployments/ -n databases
kubectl apply -f ./services/ -n databases