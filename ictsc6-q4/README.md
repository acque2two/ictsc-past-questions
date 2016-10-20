# 問題4 「アップローダが動きません!」

出題大会: ICTSC6

出題時間: 2日目午前

問題技術: inode

点数: 30点満点

### 問題文

とある喫茶店では、「らびっとほーす」というサービスをWebにて提供している。

このサービスはログイン不要で自由にファイルをアップロード/ダウンロードできるサービスです。

このサービスは今まで順調に稼働していたが、ある日を境に突然アップロードができなくなってしまった。

まだ調査が進んでおらず、原因が分かっていないので。原因究明を行ってほしい。また、可能であれば対処を行ってほしい。

ただ、このサービスはある程度のユーザーがおり、アップロードができない状態でもダウンロードを行うユーザーはいるため、できる限り復旧時にダウンタイムを設定しないこと。

また、喫茶店の一人娘の自称姉がよくわからないままに立てたサービスであるため、サーバーのログイン情報以外のことは分かっていません。

このサービスは人気であるため、ダウンタイムが発生すると減点される可能があります。

![トポロジ](http://i1.wp.com/icttoracon.net/tech-blog/wp-content/uploads/2016/09/problem-04.png?w=759)

[ICTSC tech blog - ICTSC6 全問題の解説](http://icttoracon.net/tech-blog/2016/09/23/ictsc6-problems-explanation/) からコピー

### 環境

#### 構成情報
* Rabbit-Horse (rabbit)
  - CentOS 6.8
  - IP: 192.168.11.2
* SLA-Checker (sla)
  - IP: 192.168.11.3
* 元の問題にはVirtual Routerがありますが、現地点では作成していません。

### 使い方

#### Vagrant

```
$ git clone https://github.com/naoki912/ictsc-past-questions.git
$ cd ictsc-past-questions/ictsc6-q4/vagrant
$ vagrant up

$ vagrant ssh rabbit
$ vagrant ssh sla
```

#### Ansible

Ansibleを使用する際に、IPを変更したい場合はhostsファイルをいじってください。ただしIPを変更すると問題に影響が出るかもです。

```
$ cd ictsc-past-questions/ictsc6-q4/ansible
$ vim hosts
$ ansible-playbook -i hosts playbook.yml
```

### 注意点
* 元の問題では別ディスクとして存在していましたが、Vagrantで別ディスクをアタッチするのは別のプラグインが必要だったり、Ansibleでも別ディスクが存在している必要がある等、**簡単に**問題を再現できなくなるような問題が起きないよう、別ディスクは同じディスクの中にイメージファイルとして設置し、`qemu-nbd`で/dev/nbd0と関連付けています。

### 解答

[Answer.md](Answer.md)

### 備考
* 使用した vagrant box
  - https://atlas.hashicorp.com/kaorimatz/boxes/centos-6.8-x86_64/
