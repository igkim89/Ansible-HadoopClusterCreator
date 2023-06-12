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
  * [Spark 배포](#spark-배포)
  * [UI for Apache Kafka 배포](#ui-for-apache-kafka-배포)
  * [Hue 배포](#hue-배포)
  * [R 배포 (RStudio 포함)](#r-배포-(rstudio-포함))
  * [Redis 배포](#redis-배포)
  * [Airflow 배포](#airflow-배포)
  * [Zeppelin 배포](#zeppelin-배포)
  * [Prometheus 배포](#prometheus-배포)
  * [Grafana 배포](#grafana-배포)
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
* **[Scaling](#scaling)
  * [Scale-out](#scale-out)
  * [Scale-in](#scale-in)

---

## Installer download

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

### Spark 배포
```
$ run/dev/install/install-spark.sh
```

### UI for Apache Kafka 배포
```
$ run/dev/install/install-ufk.sh
```

### Hue 배포
```
$ run/dev/install/install-hue.sh
```

### R 배포 (RStudio 포함)
```
$ run/dev/install/install-R.sh
```

### Redis 배포
```
$ run/dev/install/install-redis.sh
```

### Airflow 배포
```
$ run/dev/install/install-airflow.sh
```

### Zeppelin 배포
```
$ run/dev/install/install-zeppelin.sh
```

### Prometheus 배포
```
$ run/dev/install/install-prometheus.sh
```

### Grafana 배포
```
$ run/dev/install/install-grafana.sh
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

### Spark 시작
```
$ run/dev/start/start-spark.sh
```

### UI for Apache Kafka 시작
```
$ run/dev/start/start-ufk.sh
```

### Hue 시작
```
$ run/dev/start/start-hue.sh
```

### R 시작
```
$ run/dev/start/start-R.sh
```

### Redis 시작
```
$ run/dev/start/start-redis.sh
```

### Airflow 시작
```
$ run/dev/start/start-airflow.sh
```

### Zeppelin 시작
```
$ run/dev/start/start-zeppelin.sh
```

### Prometheus 시작
```
$ run/dev/start/start-prometheus.sh
```

### Grafana 시작
```
$ run/dev/start/start-grafana.sh
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

### Spark 테스트

Spark Wordcount 테스트

```
$ run/dev/test/spark/pyspark-wordcount.sh
```

Spark SQL 테스트

```
$ run/dev/test/spark/pyspark-hive.sh
```

### UI for Apache Kafka 테스트

Web UI 접속 및 확인

### Hue 테스트

Web UI 접속 및 확인

### R 테스트

RStudio Web UI 접속 및 확인

### Redis 테스트

TBD

### Airflow 테스트

Web UI 접속 및 확인

### Zeppelin 테스트

Web UI 접속 및 확인

### Prometheus 테스트

Web UI 접속 및 확인

### Grafana 테스트

Web UI 접속 및 확인

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

### Spark 중지
```
$ run/dev/stop/stop-spark.sh
```

### UI for Apache Kafka 중지
```
$ run/dev/stop/stop-ufk.sh
```

### Hue 중지
```
$ run/dev/stop/stop-hue.sh
```

### R 중지
```
$ run/dev/stop/stop-R.sh
```

### Redis 중지
```
$ run/dev/stop/stop-redis.sh
```

### Airflow 중지
```
$ run/dev/stop/stop-airflow.sh
```

### Zeppelin 중지
```
$ run/dev/stop/stop-zeppelin.sh
```

### Prometheus 중지
```
$ run/dev/stop/stop-prometheus.sh
```

### Grafana 중지
```
$ run/dev/stop/stop-grafana.sh
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

### Spark 제거
```
$ run/dev/uninstall/uninstall-spark.sh
```

### UI for Apache Kafka 제거
```
$ run/dev/uninstall/uninstall-ufk.sh
```

### Hue 제거
```
$ run/dev/uninstall/uninstall-hue.sh
```

### R 제거
```
$ run/dev/uninstall/uninstall-R.sh
```

### Redis 제거
```
$ run/dev/uninstall/uninstall-redis.sh
```

### Airflow 제거
```
$ run/dev/uninstall/uninstall-airflow.sh
```

### Zeppelin 제거
```
$ run/dev/uninstall/uninstall-zeppelin.sh
```

### Prometheus 제거
```
$ run/dev/uninstall/uninstall-prometheus.sh
```

### Grafana 제거
```
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
