FROM ubuntu:16.04

# Update Ubuntu
RUN apt-get update && apt-get -y upgrade
# Add oracle java 8 repository
RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get -y update
# Accept the Oracle Java license
RUN echo "oracle-java7-installer shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections

# Install Oracle Java
RUN apt-get --force-yes install oracle-java8-installer -y
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# for the brady printer (sentinel_share)
RUN mkdir -p /mnt/sentinel_share

# start: new directories from 2017-02-13
RUN mkdir -p \
/mnt/sentinel_share/container_jobs \
/mnt/sentinel_share/labels \
/mnt/sentinel_share/mixed_specimen_jobs \
/mnt/sentinel_share/primer_jobs \ 
/mnt/sentinel_share/product_jobs \
/mnt/sentinel_share/sample_jobs \
/mnt/sentinel_share/specimen_jobs \
/mnt/sentinel_share/storage_jobs

RUN mkdir -p \
/var/lib/seqdb \
/var/lib/seqdb/specimenfiles \
/var/lib/seqdb/mixedSpecimenfiles \
/var/lib/seqdb/samplefiles \
/var/lib/seqdb/pcrbatchfiles \
/var/lib/seqdb/importpermitfiles \
/var/lib/seqdb/import_page_documentation \
/var/lib/seqdb/mmtlSubmissions \
/var/lib/seqdb/sanger_sequences \
/var/lib/seqdb/sanger_fragments

RUN chmod -R 777 /var/lib/seqdb/

# end: new directories from 2017-02-13

#https://archive.apache.org/dist/tomcat/tomcat-7
#ENV TOMCAT_VERSION 7.0.69
ENV TOMCAT_VERSION 7.0.76
RUN wget --quiet --no-cookies https://archive.apache.org/dist/tomcat/tomcat-7/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O /tmp/tomcat.tgz && \
tar xzvf /tmp/tomcat.tgz -C /opt && \
mv /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat && \
rm /tmp/tomcat.tgz && \
rm -rf /opt/tomcat/webapps/examples && \
rm -rf /opt/tomcat/webapps/docs && \
rm -rf /opt/tomcat/webapps/ROOT

# Add admin/admin user
ADD catalina.sh /opt/tomcat/bin/
RUN chmod 755 /opt/tomcat/bin/catalina.sh
ADD tomcat-users.xml /opt/tomcat/conf/
ADD context.xml /opt/tomcat/conf/
ADD server.xml /opt/tomcat/conf/
ADD javax.mail.jar /opt/tomcat/lib/
# Adding latest release from: 2018-02-08
ADD seqdb.web-3.189.war /opt/tomcat/webapps


ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 8080
#EXPOSE 8009
VOLUME "/opt/tomcat/webapps"
WORKDIR /opt/tomcat

# tini, zombie reaper
ENV TINI_VERSION v0.10.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini.asc /tini.asc
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7 \
 && gpg --verify /tini.asc

RUN chmod +x /tini

ENTRYPOINT ["/tini", "--"]

# Launch Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
