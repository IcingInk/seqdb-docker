FROM openjdk:8
LABEL Author <ingimar.erlingsson@nrm.se>
LABEL ca.gc.aafc.seqdb="v3.28.1" \ 
      ca.gc.aafc.seqdb.release-date="2018-03-08"

RUN apt-get update && apt-get -y upgrade

# for the brady printer (sentinel_share)
RUN mkdir -p /mnt/sentinel_share

#Start: new directories from 2017-02-13
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

#End: new directories from 2017-02-13

ADD seqdbweb.war /root
ADD seqdbconfig.yml /root

EXPOSE 8080

CMD ["/usr/bin/java", "-jar", "-Dspring.config.additional-location=/root/seqdbconfig.yml","/root/seqdbweb.war"]
