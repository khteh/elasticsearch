FROM elasticsearch:7.4.2
ADD limits.conf /etc/security/limits.conf
ADD elasticsearch_systemd.conf /etc/systemd/system/elasticsearch.service.d/override.conf
ADD entrypoint.sh /usr/local/bin/entrypoint.sh
EXPOSE 9200 9300
ENTRYPOINT ["entrypoint.sh"]
CMD ["elasticsearch"]
