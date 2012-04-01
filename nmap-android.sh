STARTTIME=`date +%s`
cd ~
wget https://sourcery.mentor.com/sgpp/lite/arm/portal/package9728/public/arm-none-linux-gnueabi/arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
tar -xjf arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2 
export PATH=~/arm-2011.09/bin:$PATH
rm arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
mkdir nmap-android
cd nmap-android
wget http://nmap.org/dist/nmap-5.51.tar.bz2
tar -xjf nmap-5.51.tar.bz2
rm nmap-5.51.tar.bz2
cd nmap-5.51
ac_cv_func_getpgrp=yes ac_cv_func_setpgrp=yes ac_cv_linux_vers=3.0.16 RANLIB='arm-none-linux-gnueabi-ranlib' LD='arm-none-linux-gnueabi-ld' AR='arm-none-linux-gnueabi-ar' CC='arm-none-linux-gnueabi-gcc' CXX='arm-none-linux-gnueabi-g++' ./configure --host=arm-linux --without-nmapfe --with-pcap=linux --with-libpcap=included --with-liblua=included
# sed -i 's/STATIC = /STATIC = -static/g' Makefile
make static
cd ..
mkdir bin
cp nmap-5.51/nmap bin/
cp nmap-5.51/nmap-mac-prefixes bin/
cp nmap-5.51/nmap-os-db bin/
cp nmap-5.51/nmap-payloads bin/
cp nmap-5.51/nmap-protocols bin/
cp nmap-5.51/nmap-rpc bin/
cp nmap-5.51/nmap-service-probes bin/
cp nmap-5.51/nmap-services bin/
cp nmap-5.51/nse_main.lua bin/
cp -r nmap-5.51/nselib/ bin/ 
cp -r nmap-5.51/scripts/ bin/
cp nmap-5.51/nping/nping bin/
cp nmap-5.51/ncat/ncat bin/
ENDTIME=`date +%s`
TOTAL_SECS=$(($ENDTIME - $STARTTIME))
TOTAL_MINS=$(($TOTAL_SECS / 60))
TOTAL_HOURS=$((TOTAL_MINS / 60))
echo Build time\: $TOTAL_HOURS hours $(($TOTAL_MINS % 60)) mins $((TOTAL_SECS % 60)) secs