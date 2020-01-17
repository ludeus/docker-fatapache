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
    libapache2-mod-php7.3 libargon2-0 php7.3-common php7.3 php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline psmisc tzdata \
    php7.3-mbstring php7.3-xmlrpc php7.3-xml php7.3-intl php7.3-zip php7.3-curl php7.3-pgsql php7.3-sqlite3 php7.3-mysql php7.3-gd php7.3-dev \
    php-pear php7.3-imagick php7.3-imap php7.3-memcache php7.3-pspell php7.3-xsl php7.3-gettext php7.3-zmq php7.3-soap php7.3-xdebug php7.3-pcov php7.3-ldap \
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
