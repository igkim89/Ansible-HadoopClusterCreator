# Ansible-HadoopClusterCreator
Ansible을 사용한 Hadoop cluster 구축

---

## 목차

* **[환경 구성](#환경-구성)**
  * [기본 환경 설정](#기본-환경-설정)
  * [Pyenv 설치](#pyenv-설치)
  * [Python 설치](#python-설치)
  * [Python 가상환경 구성](#python-가상환경-구성)
  * [Ansible 설치](#ansible-설치)
  * [HadoopClusterCreator 환경 구성](#HadoopClusterCreator-환경-구성)
* **[S/W 설치](#S/W-설치)**
* **[서비스 배포](#서비스-배포)**
* **[서비스 시작](#서비스-시작)**
* **[서비스 테스트](#서비스-테스트)**
* **[서비스 중지](#서비스-중지)**
* **[서비스 제거](#서비스-제거)**
* **[Scaling](#scaling)**
  * [Scale-out](#scale-out)
  * [Scale-in](#scale-in)
* **[서비스 계정](#서비스-계정)**
  * [Airflow](#airflow)

---

## Installer download

설치에 사용할 설치파일을 다운로드합니다.

[Download](https://igkim89.synology.me:5001/sharing/B38dytt87)

설치를 진행할 사용자의 홈 디렉토리에 저장합니다.

e.g.

```
/home/igkim/ansible-install/R
/home/igkim/ansible-install/airflow
/home/igkim/ansible-install/ansible
/home/igkim/ansible-install/conda
/home/igkim/ansible-install/grafana

...
```

## 환경 구성

### 기본 환경 설정

- 서버 간 SSH key 교환


### Pyenv 설치

Python 설치 및 버전 관리를 위해 pyenv를 사용합니다.

아래 링크를 참고하여 설치합니다.

[pyenv Github](https://github.com/pyenv/pyenv-installer)

[설치 가이드 블로그](https://igkim89.github.io/tech/python/2022/08/02/pyenv-offline-install/)

### Python 설치

아래 링크를 참고하여 *3.10.8* 버전을 설치합니다.

[설치 가이드 블로그](https://igkim89.github.io/tech/python/2022/08/02/pyenv-offline-install/)

### Python 가상환경 구성

1. Python 버전 확인

```shell script
[igkim@igkim-docker ~]$ python -V
pyenv: python: command not found

The `python' command exists in these Python versions:
  3.10.8

Note: See 'pyenv help global' for tips on allowing both
      python2 and python3 to be found.
```

```shell script
[igkim@igkim-docker ~]$ pyenv versions

3.10.8
```

2. 가상환경 생성

```shell script
[igkim@igkim-docker ~]$ pyenv global 3.10.8
[igkim@igkim-docker ~]$ pyenv virtualenv 3.10.8 ansible
[igkim@igkim-docker ~]$ pyenv activate ansible

(ansible) [igkim@igkim-docker ~]$ python -V

Python 3.10.8
```

### Ansible 설치

위의 installer download 링크를 통해 다운로드한 Ansible 설치파일을 통해 Ansible을 설치합니다.

```shell script
(ansible) [igkim@igkim-docker ~]$ tar xvfz ansible.tgz
(ansible) [igkim@igkim-docker ~]$ pip install --no-index -f ./ansible ansible
(ansible) [igkim@igkim-docker ~]$ ansible --version

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
(ansible) [igkim@igkim-docker ~]$ wget https://github.com/igkim89/Ansible-HadoopClusterCreator/archive/refs/heads/main.zip
(ansible) [igkim@igkim-docker ~]$ unzip main.tgz
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

## 서비스 배포

서비스 배포 후 실행까지 포함되어 있습니다.

아래의 서비스는 Official Image가 아닌 수정된 이미지입니다.
- Hue (Timezone 수정)
- UI for Apache Kafka (Offline 구성을 위해 외부 api를 소스에 추가)

```shell script
$ run/dev/install/install-pyenv.sh
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
$ run/dev/install/install-nodeExporter.sh
$ run/dev/install/install-kminionExporter.sh
$ run/dev/install/install-blackboxExporter.sh
$ run/dev/install/install-checkProcessExporter.sh
$ run/dev/install/install-grafana.sh
$ run/dev/install/install-ranger.sh
```

## 서비스 시작

```shell script
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
$ run/dev/start/start-nodeExporter.sh
$ run/dev/start/start-kminionExporter.sh
$ run/dev/start/start-blackboxExporter.sh
$ run/dev/start/start-checkProcessExporter.sh
$ run/dev/start/start-grafana.sh
$ run/dev/start/start-ranger.sh
```

## 서비스 테스트

```shell script
$ run/dev/test/hadoop/mr-wordcount.sh
$ run/dev/test/mysql/mysql-query.sh
$ run/dev/test/hive/hive-query.sh
$ run/dev/test/hbase/hbase-command.sh
$ run/dev/test/spark/pyspark-wordcount.sh
$ run/dev/test/spark/pyspark-hive.sh
```

## 서비스 중지

```shell script
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
$ run/dev/stop/stop-nodeExporter.sh
$ run/dev/stop/stop-kminionExporter.sh
$ run/dev/stop/stop-blackboxExporter.sh
$ run/dev/stop/stop-checkProcessExporter.sh
$ run/dev/stop/stop-grafana.sh
$ run/dev/stop/stop-ranger.sh
```

## 서비스 제거 (서비스 중지 포함)

```shell script
$ run/dev/uninstall/uninstall-pyenv.sh
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
$ run/dev/uninstall/uninstall-nodeExporter.sh
$ run/dev/uninstall/uninstall-kminionExporter.sh
$ run/dev/uninstall/uninstall-blackboxExporter.sh
$ run/dev/uninstall/uninstall-checkProcessExporter.sh
$ run/dev/uninstall/uninstall-grafana.sh
$ run/dev/uninstall/uninstall-ranger.sh
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

## 서비스 계정

### Airflow

```
http://hostname:50073/
```
```
ID: admin
PW: bigdata123
```

### Zeppelin

```
http://hostname:28080/
```
```
ID: bigdata
PW: bigdata123
```

### Grafana

```
http://hostname:50075/
```
```
ID: admin
PW: admin
```