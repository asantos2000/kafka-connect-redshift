# Ref: https://github.com/Landoop/fast-data-dev
# Start UI at: http://localhost:3030/
# Default ports
# 9092 : Kafka Broker                   9581 : JMX
# 8081 : Schema Registry                9582 : JMX
# 8082 : Kafka REST Proxy               9583 : JMX
# 8083 : Kafka Connect Distributed      9584 : JMX
# 2181 : ZooKeeper                      9585 : JMX
# 3030 : Web Server

docker network create my-net

docker run \
 --rm \
 --name kafka \
 -h kafka \
 --network my-net \
 -p 2181:2181 \
 -p 3030:3030 \
 -p 8081-8083:8081-8083 \
 -p 9581-9585:9581-9585 \
 -p 9092:9092 \
 -e ADV_HOST=127.0.0.1 \
 -e RUNTESTS=0 \
 -v $PWD/connect/RedshiftJDBC42-1.2.16.1027.jar:/opt/landoop/connectors/third-party/kafka-connect-jdbc/RedshiftJDBC.jar \
 -v $PWD/myfiles:/myfiles \
 -v $PWD/myfiles/data:/data \
 -v $PWD/myfiles/logs:/var/log \
 landoop/fast-data-dev