# tag

标签操作
    添加标签
    删除标签
    推送标签

- git tag 操作

    ```bash
    # 给当前的 HEAD 指针处贴标签 foo
    git tag foo

    # 给任意的一个提交贴标签 foo
    git tag foo <SHAI>

    # 给当前的 HEAD 指针处贴标签 foo
    git tag foo -m "message"

    # 删除标签 foo
    git tag -d foo

    # 将所有标签推送到远程仓库中
    git push --tags

    # 将具体某个标签推送到远程仓库中
    git push origin v0.1
```