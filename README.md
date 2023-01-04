# hadoop-cluster-ansible
Ansible을 사용한 Hadoop cluster 구축

---

## 목차

* **[환경 구성](#환경-구성)**
  * [Pyenv 설치](#pyenv-설치)
  * [Python 설치](#python-설치)
  * [Python 가상환경 구성](#python-가상환경-구성)
  * [Ansible 설치](#ansible-설치)
* **[S/W 설치]()**
* **[S/W 테스트]()**
* **[S/W 제거]()**

---

## 환경 구성

### Pyenv 설치

Python 설치 및 버전 관리를 위해 pyenv를 사용한다.

https://github.com/pyenv/pyenv-installer

### Python 설치

### Python 가상환경 구성

### Ansible 설치

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
