FROM python:2.7
RUN groupadd nagios
RUN useradd -g nagios nagios
WORKDIR /home/nagios
ADD . /home/nagios
RUN python2 -m pip install -r build/resources/require.txt 
COPY agent /usr/local/ncpa
RUN chown -R nagios:nagios /usr/local/ncpa
USER nagios
RUN /usr/local/ncpa/ncpa_passive.py -n
