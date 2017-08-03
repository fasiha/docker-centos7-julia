make_docker_image: Dockerfile
	docker build -t marconi_julia .
	touch make_docker_image

PYPACKAGES=$(shell cat python-libraries.txt)

install_packages:
	mkdir -p dot-julia
	docker run -it --rm -v $(shell pwd)/dot-julia:/root/.julia marconi_julia julia -e "Pkg.init()"
	cp -f REQUIRE dot-julia/v0.5/
	docker run -it --rm -v $(shell pwd)/dot-julia:/root/.julia marconi_julia julia -e "Pkg.resolve()"
	docker run -it --rm -v $(shell pwd)/dot-julia:/root/.julia marconi_julia /root/.julia/v0.5/Conda/deps/usr/bin/pip install ${PYPACKAGES}

