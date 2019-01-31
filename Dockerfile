FROM jenkins/jenkins:lts

USER root
# Xvfb + Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get install -y xvfb google-chrome-stable && rm -rf /var/lib/apt/lists/*

# ChromeDriver
RUN cd /opt && \
    wget https://chromedriver.storage.googleapis.com/72.0.3626.7/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && \
    chmod +x chromedriver && \
    rm chromedriver_linux64.zip

USER ${user}
