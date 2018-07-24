FROM nginx:latest
RUN apt update && apt install -y python-pip
RUN pip install jinja2-cli[yaml]
COPY nginx/site.conf /etc/nginx/conf.d/default.conf
COPY static /usr/share/nginx/geomap
WORKDIR /usr/share/nginx/geomap
RUN (cat config.yml | jinja2 deployments.yaml.j2; cat config.yml)  | python -c 'import sys, yaml, json; y=yaml.load(sys.stdin.read()); print json.dumps(y)' > deployments.geojson
