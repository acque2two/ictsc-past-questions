# Answer

## 再現playbookでの解答

* 

* slave
  - master_hostの設定ミス
  - master_log_fileの設定ミス
  - master_log_posの設定ミス
  - /etc/my.cnfのserver-id設定ミス

## 公式の解答

[ICTSC tech blog - ICTSC6 全問題の解説](http://icttoracon.net/tech-blog/2016/09/23/ictsc6-problems-explanation/)

* mysqlのレプリケーションが上手く動作しない問題
  - /etc/my.cnfの設定ミス
    + server-id等
  - mysql slave側の設定ミス
    + master_log_file
    + master_log_pos等

## URL

* [ICTSC tech blog - ICTSC6 全問題の解説](http://icttoracon.net/tech-blog/2016/09/23/ictsc6-problems-explanation/)
* [WCDIチームのwriteup](http://blog.hnron.net/entry/2016/09/06/220845)
