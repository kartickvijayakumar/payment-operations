FROM amazonlinux:2

RUN amazon-linux-extras install -y postgresql10 
RUN yum install -y postgresql-devel git htop

RUN amazon-linux-extras install -y ruby2.6
RUN yum install -y ruby-devel
RUN yum install -y redhat-rpm-config

RUN gem install bundler -v 2.1.2

RUN yum install -y make gcc-c++ sudo

RUN mkdir /payment-operations
WORKDIR /payment-operations
ADD . /payment-operations

RUN bundle install
EXPOSE 80
CMD /payment-operations/run.sh