# hadoop-cluster-ansible
Ansible을 사용한 Hadoop cluster 구축

---

### 1. Python 가상환경 실행
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
