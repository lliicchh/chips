# 命令：
# 检索文件内容grep ：
grep -o 'engine\[0-9a-z]*\]'
grep -v 'grep'

# 对文件内容统计awk：涉及到操作的操作，如print等，需要用{}
awk '{print$1, $3}' netstat.txt
awk '$1 == “tcp” && $2 == 1{print$1}' netstat.txt
awk '{enginearr[$1]++}END{for(i in enginearr)print i "\t" enginearr[i]}'
#
# 批量替换文件内容：sed：stream editor
sed -i 's/^Str/string/' replace.java ## -i 选项才会对源文件修改，没有该选项则只会将改动输出到标准输出
sed -i 's/\.$/\;/' replace.java      ## $ 匹配文件末尾，这句是将.结尾的行改为;结尾
sed -i 's/jack/me/g' replace.java    ##没有g时，只替换每一行的第一个匹配项
sed -i '/java/d' replace.java        ## 末尾的d是删除的意思，删除一行不是对字符串有效，则不再需要前面的s