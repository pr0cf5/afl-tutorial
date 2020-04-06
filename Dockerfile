FROM ubuntu:18.04

ENV user fuzz
ENV DEBIAN_FRONTEND=noninteractive 

RUN echo "deb-src http://archive.ubuntu.com/ubuntu/ bionic main" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get build-dep -y python3.6
RUN apt-get install -y build-essential afl

RUN adduser $user
ADD ./build.sh /home/$user/build.sh
ADD ./run.sh /home/$user/run.sh
ADD ./harness.c /home/$user/harness.c
ADD ./tester.c /home/$user/tester.c
ADD ./make_seeds.py /home/$user/make_seeds.py
COPY ./cpython /home/$user/cpython

RUN chown root:$user /home/$user/build.sh
RUN chmod 750 /home/$user/build.sh
RUN chown root:$user /home/$user/run.sh
RUN chmod 750 /home/$user/run.sh
RUN chown root:$user /home/$user/make_seeds.py
RUN chmod 750 /home/$user/make_seeds.py

RUN /home/$user/build.sh
USER $user
CMD /home/$user/run.sh
