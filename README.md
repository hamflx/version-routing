# 根据 http 头路由 index.html 文件

通过 `try_files` 采用请求头中的版本号进行拼接，如：`X-Client-Version: 0cee3361`，配置为：`try_files $uri $uri/ /index.$http_x_client_version.html;`，则会访问 `index.0cee3361.html`。

注意，需要增加额外的安全验证条件才可，避免产生安全隐患。

测试命令：

```shell
docker build -t nginx-demo .
docker run --name nginx-demo -it --rm -p 8080:80 nginx-demo

curl -H "X-Client-Version: 0cee3361" http://localhost:8080/invite
curl -H "X-Client-Version: 60d0cfc5" http://localhost:8080/invite
```
