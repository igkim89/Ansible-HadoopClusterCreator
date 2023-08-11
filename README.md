# Ansible-HadoopClusterCreator
Ansible을 사용한 Hadoop cluster 구축

---

## 목차

* **[환경 구성](#환경-구성)**
  * [SSH Key 설정](#ssh-key-설정)
  * [Pyenv 설치](#pyenv-설치)
  * [Python 설치](#python-설치)
  * [Python 가상환경 구성](#python-가상환경-구성)
  * [Ansible 설치](#ansible-설치)
  * [HadoopClusterCreator 환경 구성](#HadoopClusterCreator-환경-구성)
* **[S/W 설치](#S/W-설치)**
* **[서비스 배포 (서비스 시작 포함)](#서비스-배포-(서비스-시작-포함))**
* **[서비스 시작](#서비스-시작)**
* **[서비스 테스트](#서비스-테스트)**
* **[서비스 중지](#서비스-중지)**
* **[서비스 제거](#서비스-제거)**
* **[Scaling](#scaling)**
  * [Scale-out](#scale-out)
  * [Scale-in](#scale-in)

---

## Installer download

설치에 사용할 설치파일을 다운로드한다.

[Download](https://igkim89.synology.me:5001/sharing/B38dytt87)

## 환경 구성

### 기본 환경 설정

- 서버 간 SSH key 교환


### Pyenv 설치

Python 설치 및 버전 관리를 위해 pyenv를 사용한다.

아래 링크를 참고하여 설치한다.

[pyenv Github](https://github.com/pyenv/pyenv-installer)

[설치 가이드 블로그](https://igkim89.github.io/tech/python/2022/08/02/pyenv-offline-install/)

### Python 설치

아래 링크를 참고하여 *3.10.8* 버전을 설치한다.

[설치 가이드 블로그](https://igkim89.github.io/tech/python/2022/08/02/pyenv-offline-install/)

### Python 가상환경 구성

1. Python 버전 확인

```shell script
[igkim@igkim-docker ~]$ pyenv versions

3.10.8
```

2. 가상환경 생성

```
[igkim@igkim-docker ~]$ pyenv virtualenv 3.10.8 ansible
[igkim@igkim-docker ~]$ pyenv activate ansible

(ansible) [igkim@igkim-docker ~]$ python -V

Python 3.10.8
```

### Ansible 설치

위의 installer download 링크를 통해 2.14.1 버전 설치를 위한 ansible.tgz를 다운로드한다.

```
[igkim@igkim-docker ~]$ tar xvfz ansible.tgz
[igkim@igkim-docker ~]$ pip install --no-index -f ./ansible ansible
[igkim@igkim-docker ~]$ ansible --version

ansible [core 2.14.0]
  config file = None
  configured module search path = ['/home/cloud-user/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/cloud-user/.pyenv/versions/3.10.8/envs/ansible/lib/python3.10/site-packages/ansible
  ansible collection location = /home/cloud-user/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/cloud-user/.pyenv/versions/ansible/bin/ansible
  python version = 3.10.8 (main, Jul 31 2023, 03:01:55) [GCC 8.5.0 20210514 (Red Hat 8.5.0-18)] (/home/cloud-user/.pyenv/versions/3.10.8/envs/ansible/bin/python3.10)
  jinja version = 3.1.2
  libyaml = True
```

### HadoopClusterCreator 환경 구성

소스 코드 다운로드

```
[igkim@igkim-docker ~]$ wget https://github.com/igkim89/Ansible-HadoopClusterCreator/archive/refs/heads/main.zip
[igkim@igkim-docker ~]$ unzip main.tgz
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
