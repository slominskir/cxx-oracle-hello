FROM almalinux:9.7

USER root

RUN dnf upgrade -y --refresh \
    && dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm \
    && /usr/bin/crb enable \
    && dnf install -y git tini vim zip gcc g++ libaio \
    && dnf clean all \
    && curl -O https://download.oracle.com/otn_software/linux/instantclient/2112000/el9/oracle-instantclient-basic-21.12.0.0.0-1.el9.x86_64.rpm \
    && curl -O https://download.oracle.com/otn_software/linux/instantclient/2112000/el9/oracle-instantclient-devel-21.12.0.0.0-1.el9.x86_64.rpm \
    && rpm -ivh oracle-instantclient-basic-21.12.0.0.0-1.el9.x86_64.rpm \
    && rpm -ivh oracle-instantclient-devel-21.12.0.0.0-1.el9.x86_64.rpm \
    && rm -rf oracle-instantclient-basic-21.12.0.0.0-1.el9.x86_64.rpm \
    && rm -rf oracle-instantclient-devel-21.12.0.0.0-1.el9.x86_64.rpm

USER root
WORKDIR /root
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/bin/bash"]
