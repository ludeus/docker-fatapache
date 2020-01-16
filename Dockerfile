FROM ubuntu:18.04

RUN apt update \
    && apt install -y software-properties-common \
    && add-apt-repository ppa:ondrej/php -y \
    && DEBIAN_FRONTEND=noninteractive \
    apt install -y \
    curl \
    wget \
    vim \
    gnupg \
    git \
    apache2 \
    libapache2-mod-php7.4 libargon2-0 php-common php7.4 php7.4-cli php7.4-common php7.4-json php7.4-opcache php7.4-readline psmisc tzdata \
    php7.4-mbstring php7.4-xmlrpc php7.4-xml php7.4-intl php7.4-zip php7.4-curl php7.4-pgsql php7.4-sqlite3 php7.4-mysql php7.4-gd php7.4-dev \
    php-pear php-imagick php7.4-imap php-memcache php7.4-pspell php7.4-xsl php-gettext php-zmq php7.4-soap php-xdebug php7.4-pcov php7.4-ldap \
    sqlite3 \
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
    && wget -qO - https://bintray.com/user/downloadSubjectPublicKey?username=bintray | apt-key add - \
    && echo "deb http://dl.bintray.com/siegfried/debian wheezy main" | tee -a /etc/apt/sources.list.d/siegfried.list \
    && apt update && apt install -y \
    libavcodec-extra \
    siegfried \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"
