make_docker_image: Dockerfile
	docker build -t marconi_julia .
	touch make_docker_image

install_packages:
	docker run -it --rm -v $(pwd)/dot-julia:/root/.julia marconi_julia julia -e "Pkg.init(); Pkg.resolve()"
	docker run -it --rm -v $(pwd)/dot-julia:/root/.julia marconi_julia /root/.julia/v0.5/Conda/deps/usr/bin/pip install numpy scipy matplotlib ipython pandas pillow
