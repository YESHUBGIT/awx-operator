FROM quay.io/ansible/awx-operator:2.6.0

RUN su sed -i 's/\(def in_container():\)/\1\n    return False/g' /usr/lib64/python*/*-packages/rhsm/config.py
RUN su  subscription-manager register --username rajeshtanuku --password India@12031984 --auto-attach
RUN su subscription-manager refresh
RUN su yum update subscription-manager-rhsm-certificates -y
RUN su dnf update python38-libs -y
RUN su dnf update python3-cloud-what -y
RUN su dnf update sqlite-libs -y
RUN su dnf update python3-libs -y
RUN su dnf update platform-python -y
# CMD /bin/bash
RUN pip install certifi==2023.7.22
LABEL certifi_only=true
