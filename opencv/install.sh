#! /bin/bash

opencv_version=2.4.10.1
opencv_deps=(libopencv-dev yasm libtiff4-dev libjpeg-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev python-dev python-numpy libtbb-dev libqt4-dev libgtk2.0-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils ffmpeg)
install_deps=(curl build-essential checkinstall cmake pkg-config)

# install dependencies
apt-get update && apt-get install -y $install_deps

# download opencv
curl -sL https://github.com/Itseez/opencv/archive/$opencv_version.tar.gz | tar xvz -C /tmp

# install
cd /tmp/opencv-$opencv_version && mkdir build && cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_OPENGL=ON ..
make -j2
make install

# configure
echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf
ldconfig
ln /dev/null /dev/raw1394 # hide warning - http://stackoverflow.com/questions/12689304/ctypes-error-libdc1394-error-failed-to-initialize-libdc1394

# cleanup package manager
apt-get remove --purge -y $install_deps && apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prepare dir
mkdir /source
