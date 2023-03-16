---
title: aelf错误归纳
date: 2022-06-20 09:32:00
tags: 大创
categories: note
---

> ### summary
>
> 记录一些遇到的问题及错误

<!--more-->

1. 类型‘ ’中不存在类型名‘’

![image-20220620094656590](image-20220620094656590.png)

解决方法：在类声明处添加partial，如下

![image-20220620100811478](image-20220620100811478.png)

在代码生成器中上图中红色方框加上不能省

2. proto问题，添加新的proto文件后build无效没有生成对应文件

build无效即没在generated下生成对应文件

![image-20220620205148011](image-20220620205148011.png)

解决方法：导航到如下路径下的csproj文件，然后加上方框内如下所示代码

```csproj
    <ContractReference Include="..\..\protobuf\token_contract.proto">
      <Link>Protobuf/Proto/token_contract.proto</Link>
    </ContractReference>
```



![image-20220620204743677](image-20220620204743677.png)

3. 关于新建对象明明定义了，却说没有，如下图

![image-20220621165902989](aelf错误归纳/image-20220621165902989.png)

解决方法：将logined，改为Logined即可，即首字母需要大写，无论你在proto里首字母定义的大写或小写

