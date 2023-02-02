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
* **[S/W 설치]()**
* **[S/W 테스트]()**
* **[S/W 제거]()**

---

## 환경 구성

### SSH Key 설정
ㅓ

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
$ vim environments/igkim/group_vars/bigdata.yml
```

### 서비스 배포

### Zookeeper 배포
```
$ run/igkim/install/install-zookeeper.sh
```

### Hadoop 배포
```
$ run/igkim/install/install-hadoop.sh
```

## 서비스 제거

### Zookeeper 제거
```
$ run/igkim/uninstall/uninstall-zookeeper.sh
```

### Hadoop 제거
```
$ run/igkim/uninstall/uninstall-hadoop.sh
```

계속 작성중..
