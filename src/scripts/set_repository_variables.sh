echo "export REPOSITORY_ENDPOINT=$(pulumi stack output stack --json --cwd "$WORKING_DIRECTORY" --stack "$STACK_NAME" | jq '.repository.endpoint')" >> "$BASH_ENV"
echo "export REPOSITORY_IMAGE_NAME=$(pulumi stack output stack --json --cwd "$WORKING_DIRECTORY" --stack "$STACK_NAME" | jq '.repository.imageName')" >> "$BASH_ENV"
