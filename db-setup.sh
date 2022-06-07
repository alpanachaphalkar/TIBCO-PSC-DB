kubectl create ns psc-db

cd "C:\Users\ALCH390\GolandProjects\TIBCO-PSC-DB\postgresql\9.6\helm"
helm install -n psc-db postgres -f minikube-values.yaml .

minikube tunnel