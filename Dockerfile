FROM ubuntu:18.10
MAINTAINER Kok How, Teh <kokhow.teh@taiger.com>
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y git wget sudo python curl apt-transport-https gnupg libasound2
#RUN groupadd -r elasticsearch && useradd -r -g elasticsearch elasticsearch
RUN wget -q -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/11.0.1+13/90cf5d8f270a4347a95050320eef3fb7/jdk-11.0.1_linux-x64_bin.deb -P /tmp
RUN dpkg -i /tmp/jdk-11.0.1_linux-x64_bin.deb
RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-11.0.1/bin/java 2
RUN update-alternatives --config java
RUN update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk-11.0.1/bin/jar 2
RUN update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-11.0.1/bin/javac 2
RUN update-alternatives --set jar /usr/lib/jvm/jdk-11.0.1/bin/jar
RUN update-alternatives --set javac /usr/lib/jvm/jdk-11.0.1/bin/javac
#RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
#RUN echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list
#RUN apt update -y
#RUN apt install -y elasticsearch
RUN wget -q https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.5.4.deb -P /tmp
RUN dpkg -i /tmp/elasticsearch-6.5.4.deb
#RUN cd /usr/src && git clone git://github.com/mobz/elasticsearch-head.git
#RUN npm install -g npm@latest && npm cache verify
#RUN cd /usr/src/elasticsearch-head && npm install
ADD elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
RUN chown -R root:elasticsearch /etc/elasticsearch
#ADD elasticsearch-head.service /etc/systemd/system/elasticsearch-head.service
#ADD start.sh /usr/local/bin/start-elasticsearch-head.sh
ADD 20-nproc.conf /etc/security/limits.d/20-nproc.conf
ADD run.sh /usr/local/bin/run.sh
ADD iconverse /opt/iconverse
#RUN chmod +x /usr/local/bin/start-elasticsearch-head.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh
ENTRYPOINT ["run.sh"]
EXPOSE 9200
CMD ["bash"]
