arch=$(uname -m)
if [ "$arch" == "i686" -o "$arch" == "i386" -o "$arch" == "i486" -o "$arch" == "i586" ]; then
flag=1
else
flag=0
fi
echo "Installing OpenCV 3.0.0"
mkdir OpenCV
cd OpenCV
echo "Removing any pre-installed ffmpeg and x264"
sudo apt-get -y remove ffmpeg x264 libx264-dev
echo "Installing Dependencies"
sudo apt-get -y install libopencv-dev
sudo apt-get -y install build-essential checkinstall cmake pkg-config yasm
sudo apt-get -y install libtiff4-dev libjpeg-dev libjasper-dev
sudo apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev
sudo apt-get -y install libtbb-dev
sudo apt-get -y install libqt4-dev libgtk2.0-dev
sudo apt-get -y install libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev
sudo apt-get -y install x264 v4l-utils ffmpeg
echo "Downloading OpenCV 3.0.0"
wget -O OpenCV-3.0.0.zip https://sourceforge.net/projects/opencvlibrary/files/opencv-unix/3.0.0/opencv-3.0.0.zip/download
echo "Installing OpenCV 3.0.0"
unzip OpenCV-3.0.0.zip
cd opencv-3.0.0
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D BUILD_SHARED_LIBS=OFF -D BUILD_FAT_JAVA_LIB=ON -D BUILD_EXAMPLES=OFF -D BUILD_DOCS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_TESTS=OFF -D WITH_TBB=ON -D WITH_V4L=ON -D WITH_1394=OFF -D WITH_QT=ON -D WITH_OPENGL=ON ..
make -j4
sudo make install
sudo sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig
echo "Removing Build Dependencies"
sudo apt-get -y remove libopencv-dev
sudo apt-get -y remove build-essential checkinstall cmake pkg-config yasm
sudo apt-get -y remove libtiff4-dev libjpeg-dev libjasper-dev
sudo apt-get -y remove libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev
sudo apt-get -y remove libtbb-dev
sudo apt-get -y remove libqt4-dev libgtk2.0-dev
sudo apt-get -y remove libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev
sudo apt-get -y remove x264 v4l-utils ffmpeg
echo "Installing Runtime Dependencies"
sudo apt-get -y install libtbb2 libtiff4 libopenexr6 libgstreamer-plugins-base0.10-0 libv4l-0 libavcodec53 libavformat53 libswscale2 libqt4-opengl libqt4-test
echo "OpenCV 3.0.0 ready to be used"
