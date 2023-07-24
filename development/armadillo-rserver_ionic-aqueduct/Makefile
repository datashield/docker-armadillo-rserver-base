#
# Docker builder
#

docker_file=Dockerfile
no_cache=true
name=datashield/armadillo-rserver_ionic-aqueduct
tag=1.0.0

# Build Docker image
build-image:
	docker build --file $(docker_file) --no-cache=$(no_cache) --tag="${name}:$(tag)" .

# Push Docker image
push-image:
	docker image push ${name}:$(tag)

# Clean Up
clean:
	rm -rf target
