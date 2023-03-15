---
title: redis基本使用
date: 2022-07-06 20:35:34
tags: [redis,note]
categories: 数据库
---

> ### Summary
>
> 本贴记录一些基本redis使用,值得一说的是用chocolate不太行，其库早已不再维护，但是有新的库仍在维护windows版本，地址如下https://github.com/tporadowski/redis/releases,快去升级

<!--more-->

### Redis数据结构

- String: 字符串-就是字符串，可以存任何数据甚至图片最大512M-->set和get
- Hash: 散列-一个 string 类型(表名)的 field(属性名) 和 value(属性对应值) 的映射表适合用于存储对象-->HMSET，hkeys，hget，hset
- List: 列表-字符串列表按顺序插入，可以在头或尾-->lpush，lrange
- Set: 集合-string类型无序集合-->sadd，smembers
- Sorted Set: 有序集合-string类型元素的集合,且不允许重复的成员,不同的是每个元素都会关联一个double类型的分数。redis正是通过分数来为集合中的成员进行从小到大的排序。-->zadd，ZRANGEBYSCORE

### 常用基本使用操作

1. string

```redis
127.0.0.1:6379> set key0 value0
OK
127.0.0.1:6379> get key0
"value0"
```

2. hash

```redis
127.0.0.1:6379> hmset hash0 field0 "value0" field1 "value1"
OK
127.0.0.1:6379> hget hash0 field0
"value0"
127.0.0.1:6379> hkeys hash0
1) "field0"
2) "field1"
127.0.0.1:6379> hset hash0 field0 "change"
(integer) 0
127.0.0.1:6379> hget hash0 field0
"change"
```

3. list

```redis
127.0.0.1:6379> lpush list 2
(integer) 1
127.0.0.1:6379> lrange list 0 10
1) "2"
127.0.0.1:6379> lpush list 1
(integer) 2
127.0.0.1:6379> rpush list 3
(integer) 3
127.0.0.1:6379> lrange list 0 10
1) "1"
2) "2"
3) "3"
```

4. set

```redis
127.0.0.1:6379> sadd set member0
(integer) 1
127.0.0.1:6379> sadd set member1
(integer) 1
127.0.0.1:6379> sadd set member2
(integer) 1
127.0.0.1:6379> smembers set
1) "member0"
2) "member2"
3) "member1"
```

5. zset

```redis
127.0.0.1:6379> zadd zset 0 member0
(integer) 1
127.0.0.1:6379> zadd zset 0 member1
(integer) 1
127.0.0.1:6379> zadd zset 3 member2
(integer) 1
127.0.0.1:6379> zadd zset 4 member3
(integer) 1
127.0.0.1:6379> zrange zset 0 10
1) "member0"
2) "member1"
3) "member2"
4) "member3"
```

### 项目中使用

- nodejs

关于redis版本问题，暂时不要使用v4版本建议，有些地方玩不明白

**Basic Usage**

```js
import { createClient } from 'redis';

const client = createClient();

client.on('error', (err) => console.log('Redis Client Error', err));

await client.connect();//使用V4版本的话不会自动连接，需要加上此举，V3与V4区别见参考链接

await client.set('key', 'value');
const value = await client.get('key');
```

**Redis Command**

```js
// raw Redis commands
await client.HSET('key', 'field', 'value');
await client.HGETALL('key');

// friendly JavaScript commands
await client.hSet('key', 'field', 'value');
await client.hGetAll('key');
```

使用JavaScript对象指定命令的修饰符:

```js
await client.set('key', 'value', {
  EX: 10,
  NX: true
});
```



### 参考链接

[必看redis@3.1.2文档](https://github.com/redis/node-redis/tree/v3.1.2)

[Redis 哈希(Hash) | 菜鸟教程 (runoob.com)](https://www.runoob.com/redis/redis-hashes.html)

[redis/node-redis: A high-performance Node.js Redis client. (github.com)](https://github.com/redis/node-redis)

https://github.com/redis/node-redis/blob/master/docs/v3-to-v4.md

[Redis command 查询](https://redis.io/commands/)
