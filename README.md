```
git clone http://github.com/metacoma/geomap
cd geomap/k8s/geomap-chart 
#helm install --namespace geomap -f values.yaml .
helm upgrade geomap . --install --namespace geomap -f values.yaml
```
