#生成渠道包
#./gradlew clean assembleReleaseChannels
#支持 productFlavors
#./gradlew clean assembleMeituanReleaseChannels
#gradle  clean assembleProductRelease -PchannelList=qihu,vivo,lenovo
#gradle clean assembleProductRelease -PchannelFile=channel


#gradle clean assembleProductReleaseChannels
gradle clean assembleCheckReleaseChannels
#选中渠道打包
#gradle assembleProductRelease -PchannelList=qihu,vivo,lenovo

