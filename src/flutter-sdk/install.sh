#!/bin/sh
export DEBIAN_FRONTEND=noninteractive

apt-get update -y && apt-get upgrade -y;
apt-get install -y curl git unzip xz-utils zip libglu1-mesa --no-install-recommends

baseURL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux"
fileName="flutter_linux_3.22.2-stable.tar.xz"
curl -LO "$baseURL/$fileName"
tar -xf $fileName -C /usr/bin/
rm $fileName

chmod 755 /usr/bin/flutter
chmod 755 /usr/bin/flutter/bin

echo 'export PATH="/usr/bin/flutter/bin:$PATH"' >> ~/.bash_profile
echo 'export PATH="/usr/bin/flutter/bin:$PATH"' >> ~/.zshenv
