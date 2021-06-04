pulumi config set serviceImageTag "$REPOSITORY_IMAGE_TAG" --cwd pulumi --stack "$STACK_NAME"
cat pulumi/Pulumi.huginn.stag.yaml