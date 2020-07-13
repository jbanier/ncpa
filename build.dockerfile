FROM centos
WORKDIR /build
ADD . /build
RUN yum install -y which gcc openssl-devel bzip2-devel python2 python2-devel
RUN cd build &&\
    yes | ./build.sh 
RUN python2 -m pip install -r build/resources/require.txt 
RUN rpm -Uvh ./build/ncpa-2.2.2-1.el8.x86_64.rpm
RUN /etc/init.d/ncpa_passive start
