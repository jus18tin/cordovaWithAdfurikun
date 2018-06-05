# cordovaWithAdfurikun

### cordoba-plugin-adfurikun導入
```
cordova plugin add [adfurikun pluginのディレクトリ]
```
例：
```
cordova plugin add /Users/xxx.xxx/xxx/xxx/adfurikun
```

### cordoba-plugin-adfurikun部品
`plugin.xml`を参考し、Xcode内以下のフィアル追加したことを確認  
* cordoba adapter files:
  * `CDVAdfurikun.h`
  * `CDVAdfurikun.m`
* adfurikun sdk
  * `ADFMovieReward.framework`
* ADNW sdk & adapter
  * (例) Nend
    * `NendAd.framework`
    * `NendAdResource.bundle`
    * `MovieReward6009.h`
    * `MovieReward6009.m`
    * `MovieInterstitial6009.h`
    * `MovieInterstitial6009.m`


### plugin使い方
* アドフリくんの初期化（広告読み込み）
```
cordova.exec(onSuccess,
                 onFail,
                 "adfurikun",
                 "initWithAppID",
                 ["アドフリくん枠id"]);
```

* リワード動画の再生
```
cordova.exec(onSuccess,
                 onFail,
                 "adfurikun",
                 "showReward",
                 ["アドフリくん枠id"]);
```
