# 注意
多个.操作，要检查空指针。

# 锁
sync.Mutex： 互斥锁
sync.RWMutex： 读写锁，RWMutex 基于 Mutex 实现


# go build 
-o  output 标记可以指定输出文件
-v	打印出那些被编译的代码包的名字


# 字符串拼接
1. 在已有字符串数组的场合，使用 strings.Join() 能有比较好的性能
2. 在一些性能要求较高的场合，尽量使用 buffer.WriteString() 以获得更好的性能
3. 性能要求不太高的场合，直接使用运算符，代码更简短清晰，能获得比较好的可读性
4. 如果需要拼接的不仅仅是字符串，还有数字之类的其他需求的话，可以考虑 fmt.Sprintf()

# 性能分析 pprof
