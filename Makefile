release:
	echo -n "\033[32mlocal iamge is $(local_image_full_name)\033[0m"
	docker build --target prod -t $(local_image_full_name) .

build_reproducible_docker:
	echo -n "\033[32mlocal iamge is $(local_image_full_name), make reproducible image\033[0m"
	docker build --target prod -t $(local_image_full_name) .
