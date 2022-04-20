FROM ubuntu:20.04

RUN apt update && apt upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt install -y software-properties-common \
    && add-apt-repository ppa:ondrej/php -y \
    && apt update \
    && DEBIAN_FRONTEND=noninteractive \
    apt install -y \
    curl \
    wget \
    vim \
    gnupg \
    git \
    apache2 \
    php7.4 libapache2-mod-php7.4 libargon2-0 \
    php7.4-cli php7.4-json php7.4-common php7.4-mysql php7.4-zip php7.4-gd php7.4-mbstring php7.4-curl php7.4-xml php7.4-bcmath \
    php7.4-http php7.4-intl php7.4-ldap php7.4-mbstring php7.4-pgsql php7.4-propro php7.4-raphf php7.4-soap php7.4-xdebug php7.4-xsl php7.4-zmq \
    php7.4-sqlite3 php7.4-imagick php7.4-pcov php-pear \
    sqlite3 sqlite3-pcre \
    zlib1g-dev libicu-dev g++ libxml2-dev libpq-dev \
    build-essential libtool autoconf uuid-dev pkg-config libsodium-dev \
    ffmpeg \
    libreoffice-common \
    unoconv \
    xlsx2csv \
    imagemagick \
    handbrake-cli \
    soundconverter \
    poppler-utils \
    catdoc \
    webp \
    libxml2-utils \
    mediainfo \
    zip rar unrar gzip bzip2 \
    default-jre \
    libavcodec-extra \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    sudo \
    postgresql postgresql-client postgresql-contrib \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt update \
    && apt install -y xvfb xfonts-75dpi xfonts-base \
    docker-ce docker-ce-cli containerd.io \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && wget https://ressources.libriciel.fr/public/asalae/sf && chmod +x sf && mv sf /usr/bin/sf && sf -update \
    && wget https://ressources.libriciel.fr/deploiement/w/wkhtmltox-0.12.6-1.focal-amd64.deb \
    && dpkg -i wkhtmltox-0.12.6-1.focal-amd64.deb \
    && wget https://ressources.libriciel.fr/public/asalae/sonar-scanner-cli-4.5.0.2216-linux.zip \
    && unzip sonar-scanner-cli-4.5.0.2216-linux.zip \
    && mv sonar-scanner-4.5.0.2216-linux/ /opt/sonar-scanner/ \
    && rm sonar-scanner-cli-4.5.0.2216-linux.zip \
    && rm wkhtmltox-0.12.6-1.focal-amd64.deb
