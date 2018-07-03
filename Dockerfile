
FROM ubuntu:14.04

# 安装 apache2
RUN apt-get update && apt install -y \
    apache2 \
  && rm -rf /var/lib/apt/lists/* && apt-get clean

RUN apt-get update && apt-get install -y \
    php5 \
    php5-curl \
    php5-mcrypt \
    php5-xdebug \
    php5-mongo \
  && rm -rf /var/lib/apt/lists/* && apt-get clean

# 自定义配置
COPY common.ini /etc/php5/mods-available/common.ini
RUN php5enmod common \
  && php5enmod mcrypt \
  && a2enmod rewrite
