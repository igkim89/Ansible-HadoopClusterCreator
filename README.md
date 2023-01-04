# hadoop-cluster-ansible
Ansible을 사용한 Hadoop cluster 구축

---

## 목차

* [1. 환경 구성](#1.-환경-구성)
  * [1.1. Pyenv 설치](#1.1.-pyenv-설치)
  * [1.2. Python 설치](#1.2.-python-설치)
  * [1.3. Python 가상환경 구성](#1.3.-python-가상환경-구성)
  * 1.4. [Ansible 설치](#1.4.-ansible-install)
* [2. S/W 설치]()
* [3. S/W 테스트]()
* [4. S/W 제거]()

### 1. 환경 구성

#### 1.1. Pyenv 설치

Python 설치 및 버전 관리를 위해 pyenv를 사용한다.

https://github.com/pyenv/pyenv-installer

#### 1.2. Python 설치

#### 1.3. Python 가상환경 구성

#### 1.4. Ansible install

### 2. S/W 설치

#### 1.1. Python 가상환경 실행
```
$ pyenv activate ansible
```

### 2. 전체 서비스 환경 설정
```
$ vim environments/igkim/group_vars/bigdata.yml
```

### 3. 서비스 배포

#### 3.1. Zookeeper 배포
```
$ run/igkim/install/install-zookeeper.sh
```

#### 3.2. Hadoop 배포
```
$ run/igkim/install/install-hadoop.sh
```

### 4. 서비스 제거

#### 3.1. Zookeeper 제거
```
$ run/igkim/uninstall/uninstall-zookeeper.sh
```

#### 3.2. Hadoop 제거
```
$ run/igkim/uninstall/uninstall-hadoop.sh
```

계속 작성중..
