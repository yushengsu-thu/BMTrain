FROM nvidia/cuda:10.2-devel
WORKDIR /build
RUN apt update && apt install -y --no-install-recommends \
    build-essential \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel
RUN pip3 install torch==1.10.0 -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip3 install numpy -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN apt install iputils-ping -y --no-install-recommends
RUN pip3 install cpm_kernels>=1.0.8 -i https://pypi.tuna.tsinghua.edu.cn/simple
ADD . .
RUN python3 setup.py install

WORKDIR /root
ADD example example