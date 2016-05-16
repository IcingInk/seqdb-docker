FROM ubuntu:14.04


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

# from provision-seqdb-localfs.sh
RUN mkdir -p \
/seqdb_working/seqdbweb \
/seqdb_working/specimenfiles \
/seqdb_working/samplefiles \
/seqdb_working/pcrbatchfiles \
/seqdb_working/importpermitfiles \ 
/seqdb_working/import_page_documentation \
/seqdb_working/mmtlSubmissions \ 
/seqdb_working/sanger_sequences \
/seqdb_working/sanger_fragments

RUN mkdir -p /mnt/sentinel_share

RUN chmod 777 /seqdb_working/seqdbweb
RUN chmod 777 /seqdb_working/sanger_sequences
RUN chmod 777 /seqdb_working/sanger_fragments

ENV TOMCAT_VERSION 7.0.69
RUN wget --quiet --no-cookies http://apache.rediris.es/tomcat/tomcat-7/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O /tmp/tomcat.tgz && \
tar xzvf /tmp/tomcat.tgz -C /opt && \
mv /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat && \
rm /tmp/tomcat.tgz && \
rm -rf /opt/tomcat/webapps/examples && \
rm -rf /opt/tomcat/webapps/docs && \
rm -rf /opt/tomcat/webapps/ROOT

# Add admin/admin user
ADD tomcat-users.xml /opt/tomcat/conf/
ADD context.xml /opt/tomcat/conf/
ADD server.xml /opt/tomcat/conf/
ADD javax.mail.jar /opt/tomcat/lib/
ADD seqdbweb.war /opt/tomcat/webapps


ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 8080
#EXPOSE 8009
VOLUME "/opt/tomcat/webapps"
WORKDIR /opt/tomcat

# Launch Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
