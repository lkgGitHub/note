
# 1. install

# 2. quick start

## 2.1 topic
```shell
bin/kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 2
bin/kafka-topics.sh --bootstrap-server localhost:9092 --list 
bin/kafka-topics.sh --bootstrap-server localhost:9092 --describe --topic quickstart-events 
```
--partitions    分区
--replication-factor 副本数  < brokers

## 2.2 producer
```shell
bin/kafka-console-producer.sh --bootstrap-server localhost:9092 --topic quickstart-events
```

## 2.3 consumer
```shell
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic quickstart-events --from-beginning 
```
--from-beginning


# 数据
__consumer_offsets-%d   默认50个分区一个副本
topic-0     topic+分区号
.index
.log
.timeindex
leader-epoch-checkpoint

