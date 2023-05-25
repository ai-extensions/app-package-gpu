FROM mambaorg/micromamba:1.4-jammy

USER root

ENV USERNAME=mambauser \
    PATH=/opt/conda/envs/env_gpu/bin:$PATH \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl sudo git gcc build-essential \
        nvidia-driver-510 \
        nvidia-cuda-toolkit \
        nvidia-cuda-toolkit-gcc && \
        apt-get clean


# RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
#     && chmod 0440 /etc/sudoers.d/$USERNAME

RUN mkdir -p /srv/conda && \ 
    chown -R mambauser:1000 /srv/conda/ && \
    mkdir -p /workspaces && \ 
    chown -R 1000:1000 /workspaces

USER mambauser

# RUN \
#     echo "**** install cuda ****" && \ 
#     mamba install -y -c conda-forge cudatoolkit=11.5.0 && \
#     /opt/conda/bin/pip3 install nvidia-cudnn-cu11==8.6.0.163 tensorflow==2.12.*  && \
#     mamba clean -y -a
ADD environment.yml /tmp/environment.yml

RUN micromamba create -r /opt/conda -n env_gpu -f /tmp/environment.yml && \
    micromamba clean -y -a

ENV CUDNN_PATH=/opt/conda/envs/env_gpu/lib/python3.10/site-packages/nvidia/cudnn \
    CONDA_PREFIX=/opt/conda \
    LD_LIBRARY_PATH=/lib/:/opt/conda/lib:/opt/conda/env_gpu/lib/python3.10/site-packages/nvidia/cudnn/lib

ADD app.py /workspaces/app.py

WORKDIR /home/mambauser