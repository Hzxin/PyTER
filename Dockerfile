FROM marinelay/pypebugs:base

USER root
RUN mkdir /pyter && chmod 777 /pyter
RUN apt-get install dos2unix
RUN pyenv install 3.9.1
RUN pyenv global 3.9.1
WORKDIR /pyter

RUN git clone https://github.com/Hzxin/PyTER.git /pyter
ENV LC_ALL=C.UTF-8
ENV TZ=Asia/Singapore
RUN apt-get update && apt-get install -y tzdata
RUN ln -fs /usr/share/zoneinfo/Asia/Singapore /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

RUN pip install astpretty
RUN pip install iteration-utilities

WORKDIR /pyter
RUN git clone https://github.com/Hzxin/pyter_tool.git
CMD ["/bin/bash"]
