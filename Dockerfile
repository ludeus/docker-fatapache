FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

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
    php8.1 libapache2-mod-php8.1 libargon2-0 \
    php8.1-cli php8.1-common php8.1-mysql php8.1-zip php8.1-gd php8.1-mbstring php8.1-curl php8.1-xml php8.1-bcmath \
    php8.1-http php8.1-intl php8.1-ldap php8.1-mbstring php8.1-pgsql php8.1-raphf php8.1-soap php8.1-xdebug php8.1-xsl php8.1-zmq \
    php8.1-sqlite3 php8.1-imagick php8.1-pcov php-pear \
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
    && wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.jammy_amd64.deb \
    && dpkg -i wkhtmltox_0.12.6.1-2.jammy_amd64.deb \
    && wget https://ressources.libriciel.fr/public/asalae/sonar-scanner-cli-4.5.0.2216-linux.zip \
    && unzip sonar-scanner-cli-4.5.0.2216-linux.zip \
    && mv sonar-scanner-4.5.0.2216-linux/ /opt/sonar-scanner/ \
    && rm sonar-scanner-cli-4.5.0.2216-linux.zip \
    && rm wkhtmltox_0.12.6.1-2.jammy_amd64.deb \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt install -y ./google-chrome-stable_current_amd64.deb \
    && apt update \
    && apt install -y beanstalkd \
    && apt update && apt install -y locales \
    && sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen \
    && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales

RUN apt update && apt install -y clamav clamav-daemon clamav-freshclam libclamunrar9 \
    && mkdir -p /var/lib/clamav/daily \
    && echo "TCPSocket 3310" >> /etc/clamav/clamd.conf \
    && printf "/usr/sbin/clamd {\n/data/ r,\n/data/** r,\n}" > /etc/apparmor.d/local/usr.sbin.clamd \
    && freshclam

RUN apt update && apt install -y dbus \
    && mkdir -p /var/run/dbus \
    && dbus-daemon --config-file=/usr/share/dbus-1/system.conf --print-address
