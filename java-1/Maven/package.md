# maven 相关

## 1 | 命令

mvn compile test package install

mvn clean install -U

mvn dependency:tree  

！注意：以上命令要在pom.xml 所在目录执行

## 2 | maven 打包

如何打一个fatjar(AllInOne)包，即所有的依赖包都包含在这个包里，可以run anywhere 

1. pom.xml 文件中添加

```xml
   <build>
        <plugins>
            <plugin>
                <artifactId>maven-assembly-plugin</artifactId>
                <configuration>
                    <descriptorRefs>
                        <descriptorRef>jar-with-dependencies</descriptorRef>
                    </descriptorRefs>
                    <archive>
                        <manifest>
                            <mainClass>WatchDemo.Executor</mainClass>
                        </manifest>
                    </archive>
                </configuration>
                <executions>
                    <execution>
                        <id>make-assembly</id>
                        <phase>package</phase>
                        <goals>
                            <goal>single</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>
        </plugins>
    </build>

```

2. pom.xml 文件下

执行mvn clean install，生成的jar包在target 目录下。