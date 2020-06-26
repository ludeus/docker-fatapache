FROM ubuntu:20.04

RUN apt update && apt upgrade \
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
    libapache2-mod-php libargon2-0 php-common php php-cli php-common php-json php-readline php-mbstring \
    php-xmlrpc php-xml php-intl php-zip php-curl php-pgsql php-sqlite3 php-mysql php-gd php-dev php-pear php-imagick \
    php-imap php-pspell php-zmq php-soap php-xdebug php-ldap php-pcov php-http \
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
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && wget http://ressources.libriciel.fr/public/asalae/sf && chmod +x sf && mv sf /usr/bin/sf && sf -update

