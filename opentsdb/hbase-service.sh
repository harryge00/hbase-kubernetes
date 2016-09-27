#!/bin/sh

cat <<EOF > /opt/hbase/conf/hbase-site.xml
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
  <property>
    <name>hbase.rootdir</name>
    <value>file:///${HBASE_DATA}/hbase\${user.name}/hbase</value>
  </property>
</configuration>
EOF

exec /opt/hbase/bin/hbase master start
