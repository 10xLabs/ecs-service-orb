echo "export REPOSITORY_ENDPOINT=$(pulumi stack output RepositoryEndpoint --cwd pulumi --stack "$STACK_NAME")" >> "$BASH_ENV"
echo "export REPOSITORY_IMAGE_NAME=$(pulumi stack output RepositoryImageName --cwd pulumi --stack "$STACK_NAME")" >> "$BASH_ENV"
