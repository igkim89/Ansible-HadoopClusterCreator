#!/usr/bin/env bash
#
#/**
# * Licensed to the Apache Software Foundation (ASF) under one
# * or more contributor license agreements.  See the NOTICE file
# * distributed with this work for additional information
# * regarding copyright ownership.  The ASF licenses this file
# * to you under the Apache License, Version 2.0 (the
# * "License"); you may not use this file except in compliance
# * with the License.  You may obtain a copy of the License at
# *
# *     http://www.apache.org/licenses/LICENSE-2.0
# *
# * Unless required by applicable law or agreed to in writing, software
# * distributed under the License is distributed on an "AS IS" BASIS,
# * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# * See the License for the specific language governing permissions and
# * limitations under the License.
# */

export JAVA_HOME={{ java_home }}
export HBASE_CLASSPATH=${HBASE_CLASSPATH}:$HADOOP_HOME/conf
export HBASE_LOG_DIR={{ bigdata_home }}/hbase/logs
export HBASE_MANAGES_ZK=false

export HBASE_MASTER_OPTS="$HBASE_MASTER_OPTS -javaagent:{{ bigdata_home }}/hbase/tools/{{ installer.jmx_exporter }}={{ hbase_jmx_exporter.master_port }}:{{ bigdata_home }}/hbase/conf/hbase-jmx.yml -Xmx{{ hbase.master_heapsize }}"
export HBASE_REGIONSERVER_OPTS="$HBASE_REGIONSERVER_OPTS -javaagent:{{ bigdata_home }}/hbase/tools/{{ installer.jmx_exporter }}={{ hbase_jmx_exporter.region_port }}:{{ bigdata_home }}/hbase/conf/hbase-jmx.yml -Xmx{{ hbase.region_heapsize }} -XX:MaxDirectMemorySize={{ hbase.max_direct_mem_size }}"

#export HBASE_OPTS="$HBASE_OPTS -javaagent:{{ bigdata_home }}/hbase/tools/{{ installer.jmx_exporter }}={{ hbase_jmx_exporter.port }}:{{ bigdata_home }}/hbase/conf/hbase-jmx.yml"