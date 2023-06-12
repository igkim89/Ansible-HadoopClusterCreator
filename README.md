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
* **[서비스 시작](#서비스-시작)**
  * [Zookeeper 시작](#zookeeper-시작)
  * [Kafka 시작](#kafka-시작)
  * [Hadoop 시작](#hadoop-시작)
  * [MySQL 시작](#mysql-시작)
  * [Hive 시작](#hive-시작)
  * [HBase 시작](#hbase-시작)
  * [Spark 시작](#spark-시작)
  * [UI for Apache Kafka 시작](#ui-for-apache-kafka-시작)
  * [Hue 시작](#hue-시작)
  * [R 시작](#r-시작)
  * [Redis 시작](#redis-시작)
  * [Airflow 시작](#airflow-시작)
  * [Zeppelin 시작](#zeppelin-시작)
  * [Prometheus 시작](#prometheus-시작)
  * [Grafana 시작](#grafana-시작)
* **[서비스 테스트](#서비스-테스트)**
  * [Zookeeper 테스트](#zookeeper-테스트)
  * [Kafka 테스트](#kafka-테스트)
  * [Hadoop 테스트](#hadoop-테스트)
  * [MySQL 테스트](#mysql-테스트)
  * [Hive 테스트](#hive-테스트)
  * [HBase 테스트](#hbase-테스트)
  * [Spark 테스트](#spark-테스트)
  * [UI for Apache Kafka 테스트](#ui-for-apache-kafka-테스트)
  * [Hue 테스트](#hue-테스트)
  * [R 테스트](#r-테스트)
  * [Redis 테스트](#redis-테스트)
  * [Airflow 테스트](#airflow-테스트)
  * [Zeppelin 테스트](#zeppelin-테스트)
  * [Prometheus 테스트](#prometheus-테스트)
  * [Grafana 테스트](#grafana-테스트)
* **[서비스 중지](#서비스-중지)**
  * [Zookeeper 중지](#zookeeper-중지)
  * [Kafka 중지](#kafka-중지)
  * [Hadoop 중지](#hadoop-중지)
  * [MySQL 중지](#mysql-중지)
  * [Hive 중지](#hive-중지)
  * [HBase 중지](#hbase-중지)
  * [Spark 중지](#spark-중지)
  * [UI for Apache Kafka 중지](#ui-for-apache-kafka-중지)
  * [Hue 중지](#hue-중지)
  * [R 중지](#r-중지)
  * [Redis 중지](#redis-중지)
  * [Airflow 중지](#airflow-중지)
  * [Zeppelin 중지](#zeppelin-중지)
  * [Prometheus 중지](#prometheus-중지)
  * [Grafana 중지](#grafana-중지)
* **[서비스 제거](#서비스-제거)**
  * [Zookeeper 제거](#zookeeper-제거)
  * [Kafka 제거](#kafka-제거)
  * [Hadoop 제거](#hadoop-제거)
  * [MySQL 제거](#mysql-제거)
  * [Hive 제거](#hive-제거)
  * [HBase 제거](#hbase-제거)
  * [Spark 제거](#spark-제거)
  * [UI for Apache Kafka 제거](#ui-for-apache-kafka-제거)
  * [Hue 제거](#hue-제거)
  * [R 제거](#r-제거)
  * [Redis 제거](#redis-제거)
  * [Airflow 제거](#airflow-제거)
  * [Zeppelin 제거](#zeppelin-제거)
  * [Prometheus 제거](#prometheus-제거)
  * [Grafana 제거](#grafana-제거)
* **[Scaling](#scaling)**
  * [Scale-out](#scale-out)
  * [Scale-in](#scale-in)

---

## Installer download

설치에 사용할 설치파일을 다운로드한다.

[Download](https://igkim89.synology.me:5001/sharing/B38dytt87)

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

아래의 서비스는 Official Image가 아닌 수정된 이미지이다.
- Hue (Timezone 수정)
- UI for Apache Kafka (Offline 구성을 위해 외부 api를 소스에 추가)

```
$ run/dev/install/install-zookeeper.sh
$ run/dev/install/install-kafka.sh
$ run/dev/install/install-hadoop.sh
$ run/dev/install/install-mysql.sh
$ run/dev/install/install-hive.sh
$ run/dev/install/install-hbase.sh
$ run/dev/install/install-spark.sh
$ run/dev/install/install-ufk.sh
$ run/dev/install/install-hue.sh
$ run/dev/install/install-R.sh
$ run/dev/install/install-redis.sh
$ run/dev/install/install-airflow.sh
$ run/dev/install/install-zeppelin.sh
$ run/dev/install/install-prometheus.sh
$ run/dev/install/install-grafana.sh
```

## 서비스 시작

```
$ run/dev/start/start-zookeeper.sh
$ run/dev/start/start-kafka.sh
$ run/dev/start/start-hadoop.sh
$ run/dev/start/start-mysql.sh
$ run/dev/start/start-hive.sh
$ run/dev/start/start-hbase.sh
$ run/dev/start/start-spark.sh
$ run/dev/start/start-ufk.sh
$ run/dev/start/start-hue.sh
$ run/dev/start/start-R.sh
$ run/dev/start/start-redis.sh
$ run/dev/start/start-airflow.sh
$ run/dev/start/start-zeppelin.sh
$ run/dev/start/start-prometheus.sh
$ run/dev/start/start-grafana.sh
```

## 서비스 테스트

```
$ run/dev/test/hadoop/mr-wordcount.sh
$ run/dev/test/mysql/mysql-query.sh
$ run/dev/test/hive/hive-query.sh
$ run/dev/test/hbase/hbase-command.sh
$ run/dev/test/spark/pyspark-wordcount.sh
$ run/dev/test/spark/pyspark-hive.sh
```

## 서비스 중지

```
$ run/dev/stop/stop-zookeeper.sh
$ run/dev/stop/stop-kafka.sh
$ run/dev/stop/stop-hadoop.sh
$ run/dev/stop/stop-mysql.sh
$ run/dev/stop/stop-hive.sh
$ run/dev/stop/stop-hbase.sh
$ run/dev/stop/stop-spark.sh
$ run/dev/stop/stop-ufk.sh
$ run/dev/stop/stop-hue.sh
$ run/dev/stop/stop-R.sh
$ run/dev/stop/stop-redis.sh
$ run/dev/stop/stop-airflow.sh
$ run/dev/stop/stop-zeppelin.sh
$ run/dev/stop/stop-prometheus.sh
$ run/dev/stop/stop-grafana.sh
```

## 서비스 제거 (서비스 중지 포함)

```
$ run/dev/uninstall/uninstall-zookeeper.sh
$ run/dev/uninstall/uninstall-kafka.sh
$ run/dev/uninstall/uninstall-hadoop.sh
$ run/dev/uninstall/uninstall-mysql.sh
$ run/dev/uninstall/uninstall-hive.sh
$ run/dev/uninstall/uninstall-hbase.sh
$ run/dev/uninstall/uninstall-spark.sh
$ run/dev/uninstall/uninstall-ufk.sh
$ run/dev/uninstall/uninstall-hue.sh
$ run/dev/uninstall/uninstall-R.sh
$ run/dev/uninstall/uninstall-redis.sh
$ run/dev/uninstall/uninstall-airflow.sh
$ run/dev/uninstall/uninstall-zeppelin.sh
$ run/dev/uninstall/uninstall-prometheus.sh
$ run/dev/uninstall/uninstall-grafana.sh
```

## Scaling

### Scale-out
```
Scale-out test
```

### Scale-in
```
Scale-in test
```
