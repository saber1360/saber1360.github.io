---
title: aelf设置
date: 2022-06-23 20:13:16
tags: 大创
categories: note
---

> ### Summary
>
> 记录一些设置方便写代码和debug

<!--more-->

### 1. 控制台信息输出过多

解决方法:修改以下选项

给出[Logging in .NET | Microsoft Docs](https://docs.microsoft.com/en-us/dotnet/core/extensions/logging?tabs=command-line)

![image-20220623201550242](image-20220623201550242.png)

给出选项名和意

| Critical    | 5    | Logs that describe an unrecoverable application or system crash, or a catastrophic failure that requires immediate attention. |
| ----------- | ---- | ------------------------------------------------------------ |
| Debug       | 1    | Logs that are used for interactive investigation during development. These logs should primarily contain information useful for debugging and have no long-term value. |
| Error       | 4    | Logs that highlight when the current flow of execution is stopped due to a failure. These should indicate a failure in the current activity, not an application-wide failure. |
| Information | 2    | Logs that track the general flow of the application. These logs should have long-term value. |
| None        | 6    | Not used for writing log messages. Specifies that a logging category should not write any messages. |
| Trace       | 0    | Logs that contain the most detailed messages. These messages may contain sensitive application data. These messages are disabled by default and should never be enabled in a production environment. |
| Warning     | 3    | Logs that highlight an abnormal or unexpected event in the application flow, but do not otherwise cause the application execution to stop |
