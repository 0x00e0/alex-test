release:
	docker build --target prod -t $local_image_full_name .
    