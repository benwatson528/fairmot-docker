FROM continuumio/anaconda3
#RUN conda update -n base -c defaults conda

RUN apt-get update && apt-get -y install build-essential \
 && rm -rf /var/lib/apt/lists/*

# FairMOT installation - https://github.com/ifzhang/FairMOT
RUN git clone https://github.com/ifzhang/FairMOT.git \
 && cd FairMOT \
 && conda init bash \
 && conda install pytorch==1.2.0 torchvision==0.4.0 cudatoolkit=10.0 -c pytorch \
 && pip install -r requirements.txt \
 && cd src/lib/models/networks/DCNv2 sh make.sh \
