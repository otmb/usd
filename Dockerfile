FROM ubuntu:20.04

ENV TZ=Asia
ENV PYTHONPATH="$PYTHONPATH:/usr/local/USD/lib/python"
ENV PATH="$PATH:/usr/local/USD/bin"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update
RUN apt install -y build-essential cmake git libglew-dev libglib2.0-0 libx11-dev
RUN apt install -y python python3 python3-pip
RUN pip3 install PySide2 PyOpenGL jinja2
RUN git clone https://github.com/PixarAnimationStudios/USD
RUN python3 USD/build_scripts/build_usd.py /usr/local/USD

WORKDIR /opt/

