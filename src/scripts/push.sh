REPOSITORY_IMAGE_TAG=$(echo "$CIRCLE_SHA1" | cut -c -7)
REPOSITORY_IMAGE="$REPOSITORY_IMAGE_NAME:$REPOSITORY_IMAGE_TAG"

docker build -t "$REPOSITORY_IMAGE" .
aws ecr get-login-password --region=us-east-1 | docker login --username AWS --password-stdin "$REPOSITORY_ENDPOINT"
docker tag "$REPOSITORY_IMAGE" "$REPOSITORY_ENDPOINT/$REPOSITORY_IMAGE"
docker push "$REPOSITORY_ENDPOINT/$REPOSITORY_IMAGE"
