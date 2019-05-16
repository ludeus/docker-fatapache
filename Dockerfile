FROM ubuntu:18.04

RUN apt update && DEBIAN_FRONTEND=noninteractive \
    apt install -y \
    curl \
    wget \
    vim \
    gnupg \
    git \
    apache2 \
    libapache2-mod-php7.2 libargon2-0 php-common php7.2 php7.2-cli php7.2-common php7.2-json php7.2-opcache php7.2-readline psmisc tzdata \
    php7.2-mbstring php7.2-xmlrpc php7.2-xml php7.2-intl php7.2-zip php7.2-curl php7.2-pgsql php7.2-sqlite3 php7.2-mysql php7.2-gd php7.2-dev \
    php-pear php-imagick php7.2-imap php-memcache php7.2-pspell php7.2-recode php7.2-xsl php-gettext php7.2-zmq php7.2-soap php7.2-xdebug \
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

RUN apt install -y php7.2-ldap
