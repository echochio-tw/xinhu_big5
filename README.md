# 信呼，免費開源的辦公OA系統 _ BIG5 修改

開發者：雨中磐石（rai​​nrock）

郵箱：admin@rockoa.com

公司團隊：信呼開發團隊

官網網站：HTTP：//www.rockoa.com/

源碼僅供學習二次開發使用，禁止用於商業用途出售等（違者必究）

版權所有@ 2017信呼開發團隊

版本整理時間：2017-10-26 22:00:00

版本號：V1.6.0


### V1.6.0更新說明
1，完善系統安全性。

2，更多升級日誌詳見：HTTP：//www.rockoa.com/view_core.html


###安裝說明

如圖1所示，環境要求：可以運行在贏/ Linux的系統下，PHP5.3 +，mysql5.3 +

2，測試環境搭建詳見：HTTP：//www.rockoa.com/view_install.html

3，自己手動安裝詳見：HTTP：//www.rockoa.com/view_anzz.html

如圖4所示，配置文件：webmain / webmainConfig.php，也可到【系統→系統工具→系統設置】下修改

5，打開瀏覽器訪問：HTTP：//您的地址/

6，您使用此系統時，請務必遵守我們的開源思想，請尊重我們的勞動成果，謝謝！



###開發幫助文檔

地址：http：//www.rockoa.com/help.html



###信呼相關產品

1，信呼系統（後台/手機網頁版/ REIM）

2，安卓APP

3，信呼服務端（即時通信，計劃任務使用）

4，REIM即時通信PC客戶端

5，以上下載地址：HTTP：//www.rockoa.com/view_down.html

###信呼聲明

1，沒有一款系統是100％安全，信呼也是如此，任何暴露在公網中的系統，都有數據洩露的風險，一旦您決定將信呼部署在公網環境中，請仔細評估可能由此帶來的風
險，並盡可能的加強安全措施。

2，或許您覺得此系統是辣雞，歡迎提意見和您的想法給我們，或者發郵件給我們：admin@rockoa.com。

###聲明感謝

系統有用到一些開源的項目，特別感謝他們提供奉獻，不分先後順序。

1，PHP後端語言：HTTP：//www.php.net/

2中，MySQL數據庫：HTTPS：//www.mysql.com/

3，引導後台樣式組件：HTTP：//v3.bootcss.com/components/

4，字體圖標：HTTP：//www.bootcss.com/p/font-awesome/

5，Jquery的框架：HTTP：//jquery.com/

6，PHPMailer的郵件發送組件：HTTPS：//github.com/PHPMailer/PHPMailer

7，kindeditor富文本編輯器：HTTP：//kindeditor.net/

8，pdfjs預覽PDF：HTTP：//mozilla.github.io/pdf.js/

9，weui手機端框架：HTTPS：//weui.io/0.4.x/#/

10，phpqrcode生成二維碼：HTTP：//phpqrcode.sourceforge.net/

11，JPush極光推送：HTTPS：//www.jiguang.cn/

12，小米推送：HTTPS：//dev.mi.com/console/appservice/push.html

13，workerman服務端phpsocket框架：HTTP：//www.workerman.net/

14，nwjs的PC客戶端框架：HTTPS：//nwjs.io/

15，iconfont圖標庫：HTTP：//www.iconfont.cn/

16，騰訊地圖：HTTP：//map.qq.com/

16，的NodeJS：HTTPS：//nodejs.org/

### 修改代碼為 big5 可使用,尚未發現問題

代碼是用下列工具轉換的

iconv -sc -f utf8 -t gb2312 export.sql | iconv -sc -f gb2312 -t big5 | iconv -sc -f big5 -t utf8 > big5.sql

少數代碼用 "Unicode编码转换" 工具先轉換成 GB2312 再轉 big5
