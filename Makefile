release:
	echo -n "\033[32mlocal iamge is $(local_image_full_name)\033[0m"
	docker build --target prod -t $(local_image_full_name) .
    