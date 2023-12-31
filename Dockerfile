FROM quay.io/ansible/awx-operator:2.5.1
USER root
RUN sed -i 's/\(def in_container():\)/\1\n    return False/g' /usr/lib64/python*/*-packages/rhsm/config.py
RUN subscription-manager register --username rajeshtanuku --password India@12031984 --auto-attach
RUN subscription-manager refresh
RUN yum update subscription-manager-rhsm-certificates -y
RUN dnf update python38-libs -y
RUN dnf update python3-cloud-what -y
RUN dnf update sqlite-libs -y
RUN dnf update python3-libs -y
RUN dnf update platform-python -y
RUN pip install certifi==2023.7.22
USER 1001
