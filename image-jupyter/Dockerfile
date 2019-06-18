FROM niicloudoperation/notebook:latest

USER root

# Xvfb + Chrome
RUN apt-get update && apt-get install -y gnupg2 && rm -rf /var/lib/apt/lists/*
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get install -y xvfb google-chrome-stable && rm -rf /var/lib/apt/lists/*

# ChromeDriver
ENV CHROMEDRIVER_VERSION=75.0.3770.90
RUN cd /usr/local/sbin/ && \
    wget https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && \
    chmod +x chromedriver && \
    rm chromedriver_linux64.zip

RUN pip --no-cache-dir install selenium

# Locale -> Japanese
RUN apt-get update && \
    apt-get install -y locales && \
    rm -rf /var/lib/apt/lists/* && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8

USER ${NB_USER}
