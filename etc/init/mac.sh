
# ネットワークドライブに.DS_Storeを作らない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# USBドライブに.DS_Storeを作らない
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# 写真アプリの自動起動の抑止
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool YES


