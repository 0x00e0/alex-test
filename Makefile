release:
	echo -n "\033[32mlocal iamge is $(local_image_full_name)\033[0m"
	docker build --target prod -t $(local_image_full_name) .

build_reproducible_docker:
	echo -n "\033[32mlocal iamge is ${LOCAL_IMAGE_FULL_NAME}, make reproducible image\033[0m"
	echo -n "\033[32mcommit id is: ${COMMIT_ID}\033[0m"
	echo  -n "\033[32mgithub repo is: ${GITHUB_REPO}\033[0m"
	echo  -n "\033[32mimage tag is: ${IMAGE_TAG}\033[0m"
	echo -n "\033[32menvironment is: ${ENVIRONMENT}\033[0m"
	echo -n "\033[32mtarget is: ${TARGET}\033[0m"
	docker build -t ${LOCAL_IMAGE_FULL_NAME} .
	docker push ${LOCAL_IMAGE_FULL_NAME} alextest

