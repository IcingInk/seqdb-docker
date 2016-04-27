FROM ubuntu:14.04

MAINTAINER Inki

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections

RUN apt-get install oracle-java8-installer -y
# Define commonly used JAVA_HOME variable 
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

#mkdir /mnt/sentinel_share

#RUN chmod 777 /seqdb_working/seqdbweb
#RUN chmod 777 /seqdb_working/sanger_sequences
#RUN chmod 777 /seqdb_working/sanger_fragments

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

ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 8080
EXPOSE 8009
VOLUME "/opt/tomcat/webapps"
WORKDIR /opt/tomcat

# Launch Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
