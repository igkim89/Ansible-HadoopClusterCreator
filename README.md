# hadoop-cluster-ansible
Ansible을 사용한 Hadoop cluster 구축

---

## 목차

* **[환경 구성](#환경-구성)**
  * [SSH Key 설정](#ssh-key-설정)
  * [Pyenv 설치](#pyenv-설치)
  * [Python 설치](#python-설치)
  * [Python 가상환경 구성](#python-가상환경-구성)
  * [Ansible 설치](#ansible-설치)
* **[S/W 설치](#S/W-설치)**
* **[서비스 배포 (서비스 시작 포함)](#서비스-배포-(서비스-시작-포함))**
  * [Zookeeper 배포](#zookeeper-배포)
  * [Kafka 배포](#kafka-배포)
  * [Hadoop 배포](#hadoop-배포)
  * [MySQL 배포](#mysql-배포)
  * [Hive 배포](#hive-배포)
  * [HBase 배포](#hbase-배포)
* **[서비스 시작](#서비스-시작)**
  * [Zookeeper 시작](#zookeeper-시작)
  * [Kafka 시작](#kafka-시작)
  * [Hadoop 시작](#hadoop-시작)
  * [MySQL 시작](#mysql-시작)
  * [Hive 시작](#hive-시작)
  * [HBase 시작](#hbase-시작)
* **[서비스 테스트](#서비스-테스트)**
  * [Zookeeper 테스트](#zookeeper-테스트)
  * [Kafka 테스트](#kafka-테스트)
  * [Hadoop 테스트](#hadoop-테스트)
  * [MySQL 테스트](#mysql-테스트)
  * [Hive 테스트](#hive-테스트)
  * [HBase 테스트](#hbase-테스트)
* **[서비스 중지](#서비스-중지)**
  * [Zookeeper 중지](#zookeeper-중지)
  * [Kafka 중지](#kafka-중지)
  * [Hadoop 중지](#hadoop-중지)
  * [MySQL 중지](#mysql-중지)
  * [Hive 중지](#hive-중지)
  * [HBase 중지](#hbase-중지)
* **[서비스 제거](#서비스-제거)**
  * [Zookeeper 제거](#zookeeper-제거)
  * [Kafka 제거](#kafka-제거)
  * [Hadoop 제거](#hadoop-제거)
  * [MySQL 제거](#mysql-제거)
  * [Hive 제거](#hive-제거)
  * [HBase 제거](#hbase-제거)

---

## 환경 구성

### SSH Key 설정

작성 예정


### Pyenv 설치

Python 설치 및 버전 관리를 위해 pyenv를 사용한다.

아래 링크를 참고하여 설치한다.

[pyenv Github](https://github.com/pyenv/pyenv-installer)

[설치 가이드 블로그](https://igkim89.github.io/tech/python/2022/08/02/pyenv-offline-install/)

### Python 설치

아래 링크를 참고하여 설치한다.

[설치 가이드 블로그](https://igkim89.github.io/tech/python/2022/08/02/pyenv-offline-install/)

### Python 가상환경 구성

1. 로컬 파이썬 버전 변경

```shell script
[igkim@igkim-docker ~]$ pyenv local 3.8.9
[igkim@igkim-docker ~]$ python --version

Python 3.8.9
```

2. 가상환경 생성

```
[igkim@igkim-docker ~]$ pyenv virtualenv ansible

(ansible) [igkim@igkim-docker ~]$ 
```

### Ansible 설치

2.14.1

```

```

## S/W 설치

### Python 가상환경 실행
```
$ pyenv activate ansible
```

### 전체 서비스 환경 설정
```
$ vim environments/dev/group_vars/bigdata.yml
```

## 서비스 배포 (서비스 시작 포함)

### Zookeeper 배포
```
$ run/dev/install/install-zookeeper.sh
```

### Kafka 배포
```
$ run/dev/install/install-kafka.sh
```

### Hadoop 배포
```
$ run/dev/install/install-hadoop.sh
```

### MySQL 배포
```
$ run/dev/install/install-mysql.sh
```

### Hive 배포
```
$ run/dev/install/install-hive.sh
```

### HBase 배포
```
$ run/dev/install/install-hbase.sh
```

## 서비스 시작

### Zookeeper 시작
```
$ run/dev/start/start-zookeeper.sh
```

### Kafka 시작
```
$ run/dev/start/start-kafka.sh
```

### Hadoop 시작
```
$ run/dev/start/start-hadoop.sh
```

### MySQL 시작
```
$ run/dev/start/start-mysql.sh
```

### Hive 시작
```
$ run/dev/start/start-hive.sh
```

### HBase 시작
```
$ run/dev/start/start-hbase.sh
```

## 서비스 테스트

### Zookeeper 테스트

Install 완료시 Server status 자동 출력

### Kafka 테스트

미완료

### Hadoop 테스트

MapReduce job 테스트

```
$ run/dev/test/hadoop/mr-wordcount.sh
```

### MySQL 테스트
```
$ run/dev/test/mysql/mysql-query.sh
```

### Hive 테스트
```
$ run/dev/test/hive/hive-query.sh
```

### HBase 테스트
```
$ run/dev/test/hbase/hbase-command.sh
```

## 서비스 중지

### Zookeeper 중지
```
$ run/dev/stop/stop-zookeeper.sh
```

### Kafka 중지
```
$ run/dev/stop/stop-kafka.sh
```

### Hadoop 중지
```
$ run/dev/stop/stop-hadoop.sh
```

### MySQL 중지
```
$ run/dev/stop/stop-mysql.sh
```

### Hive 중지
```
$ run/dev/stop/stop-hive.sh
```

### HBase 중지
```
$ run/dev/stop/stop-hbase.sh
```

## 서비스 제거 (서비스 중지 포함)

### Zookeeper 제거
```
$ run/dev/uninstall/uninstall-zookeeper.sh
```

### Kafka 제거
```
$ run/dev/uninstall/uninstall-kafka.sh
```

### Hadoop 제거
```
$ run/dev/uninstall/uninstall-hadoop.sh
```

### MySQL 제거
```
$ run/dev/uninstall/uninstall-mysql.sh
```

### Hive 제거
```
$ run/dev/uninstall/uninstall-hive.sh
```

### HBase 제거
```
$ run/dev/uninstall/uninstall-hbase.sh
```

계속 작성중..

zookeeper
kafka
hadoop
mysql
hive
hbase
