yum update -y
yum install -y curl unzip
curl -sSL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64${AWS_CLI_VER_STRING}.zip" -o "awscliv2.zip"
unzip -q -o awscliv2.zip
./aws/install
rm awscliv2.zip