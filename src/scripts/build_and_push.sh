if [ "$IMAGE_NAME" == "" ]; then
    IMAGE_NAME="$CIRCLE_PROJECT_REPONAME"
fi
if [ "$IMAGE_TAG" == "" ]; then
    IMAGE_TAG=$(echo "$CIRCLE_SHA1" | cut -c -7)
fi
if [ "$REPOSITORY" == "" ]; then
    REGION=$(aws ec2 describe-availability-zones --output text --query 'AvailabilityZones[0].[RegionName]')
    ACCOUNT=$(aws sts get-caller-identity --query Account --output text)
    REPOSITORY="$ACCOUNT.dkr.ecr.$REGION.amazonaws.com"
fi

IMAGE="$IMAGE_NAME:$IMAGE_TAG"

echo "$IMAGE_NAME"
echo "$IMAGE_TAG"
echo "$REPOSITORY"
echo "$IMAGE"

docker build -t "$IMAGE" .
aws ecr get-login-password --region=us-east-1 | docker login --username AWS --password-stdin "$REPOSITORY"
docker tag "$IMAGE" "$REPOSITORY/$IMAGE"
docker push "$REPOSITORY/$IMAGE"
