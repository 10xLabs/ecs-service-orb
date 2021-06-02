sudo apt-get update -y
sudo apt-get install -y curl
curl -sSL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64${AWS_CLI_VER_STRING}.zip" -o "awscliv2.zip"
unzip -q -o awscliv2.zip
sudo ./aws/install
rm awscliv2.zip