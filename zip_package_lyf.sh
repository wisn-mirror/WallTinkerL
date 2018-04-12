
WORKSPACE=/Users/mac/Desktop/Android_lyf_ody/lyf_app/
jgPath=/Users/mac/Desktop/tool/360jiagu/jiagu
keystorePath=${WORKSPACE}/keystore
wallePath=/Users/mac/Desktop/tool/walle/walle-cli
buildtools25=/Users/mac/Library/Android/sdk/build-tools/25.0.2
echo 开始打包
gradle clean assembleRelease

java -jar ${jgPath}/jiagu.jar -login wuyishun_kmk@outlook.com nihao@123456
java -jar ${jgPath}/jiagu.jar -importsign ${keystorePath}/laiyifen.key laiyifen laiyifen  laiyifen
java -jar ${jgPath}/jiagu.jar -showsign
java -jar ${jgPath}/jiagu.jar -showconfig
java -jar ${jgPath}/jiagu.jar  -showmulpkg


rm -rf ${WORKSPACE}/build/outputs/jiagu
mkdir ${WORKSPACE}/build/outputs/jiagu
#加固
echo 开始加固
ls ${WORKSPACE}/build/outputs/apk/ |grep -v 'apkjiagulist.txt' > ${WORKSPACE}/build/apkjiagulist.txt
while read lineapk
do
echo ${WORKSPACE}/build/outputs/apk/${lineapk}
java -jar ${jgPath}/jiagu.jar -jiagu ${WORKSPACE}/build/outputs/apk/${lineapk} ${WORKSPACE}/build/outputs/jiagu/ -autosign
done < ${WORKSPACE}/build/apkjiagulist.txt
echo 加固结束


rm -rf ${WORKSPACE}/build/outputs/duiqi
mkdir ${WORKSPACE}/build/outputs/duiqi
#对齐
echo start4k
ls ${WORKSPACE}/build/outputs/jiagu/ |grep -v 'apkduiqilist.txt' > ${WORKSPACE}/build/apkduiqilist.txt
while read lineduiqi
do
echo ${WORKSPACE}/build/outputs/jiagu/${lineduiqi}
${buildtools25}/zipalign -v 4   ${WORKSPACE}/build/outputs/jiagu/${lineduiqi}  ${WORKSPACE}/build/outputs/duiqi/${lineduiqi}
done < ${WORKSPACE}/build/apkduiqilist.txt
echo 4kok

#签名
echo startsign
ls ${WORKSPACE}/build/outputs/duiqi/ |grep -v 'apksign.txt' > ${WORKSPACE}/build/apksign.txt
while read linesign
do
echo ${WORKSPACE}/build/outputs/duiqi/${linesign}
${buildtools25}/apksigner sign --ks   ${keystorePath}/laiyifen.key --ks-key-alias laiyifen --ks-pass pass:laiyifen  ${WORKSPACE}/build/outputs/duiqi/${linesign}
done < ${WORKSPACE}/build/apksign.txt
echo signsuccess


rm -rf ${WORKSPACE}/build/outputs/channels
mkdir ${WORKSPACE}/build/outputs/channels
#多渠道
echo startwalleChannels
ls ${WORKSPACE}/build/outputs/duiqi/ |grep -v 'apkchannels.txt' > ${WORKSPACE}/build/apkchannels.txt
while read linechannel
do
echo  ${WORKSPACE}/build/outputs/duiqi/${linechannel}
java -jar ${wallePath}/walle-cli-all.jar batch -f ${WORKSPACE}/channel  ${WORKSPACE}/build/outputs/duiqi/${linechannel}  ${WORKSPACE}/build/outputs/channels
done < ${WORKSPACE}/build/apkchannels.txt
echo endWalleChannels