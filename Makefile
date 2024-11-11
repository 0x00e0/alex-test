DOCKER_BUILDKIT=1

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
	# docker build -t ${LOCAL_IMAGE_FULL_NAME} .
	# docker tag ${LOCAL_IMAGE_FULL_NAME} 545408478668.dkr.ecr.ap-northeast-1.amazonaws.com/alextest:${IMAGE_TAG}
	# docker push 545408478668.dkr.ecr.ap-northeast-1.amazonaws.com/alextest:${IMAGE_TAG}
	
    export DOCKER_BUILDKIT=1; \
    export SOURCE_DATE_EPOCH="$$EPOCH"; \
	docker buildx create --use --driver-opt image=moby/buildkit:v0.15.1; \
	docker buildx build \
	-f Dockerfile \
	--output type=image,rewrite-timestamp=true,push=true,\"name=545408478668.dkr.ecr.ap-northeast-1.amazonaws.com/alextest:${IMAGE_TAG}\" \
	--provenance false \
	--platform linux/amd64 \
	--progress=plain \
	.

	docker buildx rm
