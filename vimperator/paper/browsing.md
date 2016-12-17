# 网页浏览

Contents临时禁用Vimperator打开网页导航重新载入停止写入退出当前目录

## 临时禁用 Vimperator

ignoring临时禁用Vimperator为了让Vim用户更愉快地浏览网页，Vimperator几乎覆盖了Firefox所有按键。在某些情况下您可能需要把键击传给Firefox或网页，即让这些按键执行原本的功能，此时可使用下列方法：ignore-all-keys<S-Esc><Insert><S-Esc><Insert>
        禁用Vimperator所有按键，并把它们传递给下一个事件处理器。在JavaScript控制的表单（例如Gmail的RichEdit表单字段）表现异常或您想使用像Google Reader这样带大量快捷键的web程序时，这种模式可派上用场。要退出此模式，请再次按<S-Esc>。<Esc>是一种特殊情况，虽然它仍发送给网页，但仍然处理输入字段的失焦。
    


ignore-keyii
        如果您只需要传递一个键击给JavaScript表单或另一个扩展时，请在该键击前先按i键。这种方法同样适用于被Vimperator覆盖的其他Firefox快捷键，例如<C-o>。
    

## 打开网页

opening打开网页

o:o:open:o[pen] [arg1], [arg2], …o
        在当前标签页中打开一个或多个网址。多个网址间用'urlseparator'分隔（默认为“,”，注意这里逗号后的空格是必须的。）首个网址在当前标签页中打开，其余的则在新标签页中打开。 每个标记按以下顺序进行分析：

        
            如果它是已存在的相对或绝对路径文件名，则打开本地电脑上相应的文件。
                    :open /etc/fstab显示文件系统表。
                    在主目录中，:open ../other/foo.html会打开/home/other/foo.html
                
            
            如果该标记看起来像个搜索字符串且首个单词为搜索引擎名，则用指定的搜索引擎打开（如:open wikipedia linus torvalds打开维基百科的linus torvalds词条）。搜索引擎的短名称会自动根据其名称猜出。如果要设置自定义名，则可通过:dialog searchengines修改。
            如果首个单词不是搜索引擎，则用默认搜索引擎或关键字（通过'defsearch'选项指定）打开（如:open linus torvalds打开谷歌搜索linus torvalds）。
           其他情况下直接传递给Firefox（如:open www.osnews.com, www.slashdot.org会在当前标签页打开OSNews，且在后台新建标签页中打开Slashdot）。
        

        可以使用:open -tags linux torvalds过滤出含“linux”标签且含“torvalds”字串的网址。注意-tags仅用于Tab补全时，而不能用在真正的命令中。可<Tab>补全的内容在'complete'选项中定义。
    


t:t:tabopen:tabnew:tabopen[!] [arg1], [arg2], …t
        与:open类似，但首个网址也在新标签页中打开。配合[!]使用时，则关闭'activate'选项的tabopen值。
    


TT
        显示包含当前网址的:tabopen命令行提示。如果您要访问基于当前网址的其他位置，这就很方便。
    


:tabdu:tabduplicate:[count]tabdu[plicate][!]
        复制[count]次当前标签页。'activate'选项的tabopen值决定是否激活复制的最后一个标签页。配合[!]使用时，则关闭tabopen值。
    


OO
        显示包含当前网址的:open命令行提示。如果您要访问基于当前网址的其他位置，这就很方便。
    


w:winopen:wopen:wino[pen][!] [arg1], [arg2], …w
        与:tabopen类似，但最终网页会在新窗口中打开。
    


WW
        在新窗口中打开基于当前位置的一个或多个网址。与w类似，但会在:winopen命令行中预先输入当前网址。
    


<MiddleMouse>pp
        在当前缓冲区中打开当前剪贴板中的网址。您还可以仅选择（对非X11用户为复制）一些非网址的文本，然后按下p使用默认的搜索引擎或关键字（通过'defsearch'选项指定）搜索。
    


PP
        在新缓冲区中打开当前剪贴板中的网址。与p类似，但在新标签页中打开。
        'activate'选项决定了是否激活新缓冲区。
    


gPgP
        在新缓冲区中打开当前剪贴板中的网址。与P类似，但反转'activate'选项。
    


<C-x>[count]<C-x>
        将网址最后部分的数字减去1或指定的[count]。因为负数基本上用不到，所以不支持负数，最多智能减到0。
    


<C-a>[count]<C-a>
        将网址最后部分的数字增加1或指定的[count]。
    


~~
        打开主目录。此时您可以使用hint，这可能是地球上最快的文件浏览器。：）
    


## 导航

H<C-o>CTRL-O:ba:back:[count]ba[ck] [url]:ba[ck]!CTRL-o
        在浏览历史中后退[count]页。如果给出了[url]，则后退到首个匹配的网址。特别形式:back!则后退到浏览历史中首个页面。
    


L<C-i>CTRL-i:fo:fw:forward:[count]fo[rward] [url]:fo[rward]!CTRL-i
        在浏览历史中前进[count]页。如果给出了[url]，则前进到首个匹配的网址。特别形式:forward!则前进到浏览历史中最后一个页面。
    


:ju:jumps:ju[mps]
        列出所有跳转点，即当前标签页的浏览历史，也称为会话历史。

        当前位置用>标识，跳转数字用于:back（0以上数字）或:forward（0以下数字）中的计数。
    


ghgh
        打开主页。在当前标签页中打开主页。
    


gHgH
        在新标签页中打开主页。在新标签页中打开主页。'activate'选项决定是否激活新标签页。
    


gu[count]gu
        转到基于当前目录的第[count]层父目录。

        重复按gu会以下面的顺序往上转到此网址：
        
            http://www.example.com/path/to/file.txt?query=value#anchor
            http://www.example.com/path/to/file.txt?query=value
            http://www.example.com/path/to/file.txt
            http://www.example.com/path/to/
            http://www.example.com/path/
            http://www.example.com/
            http://example.com/
        

    


gUgU
        转到网站根目录。

        在http://www.example.com/dir1/dir2/file.htm时按下gU会打开http://www.example.com/。浏览本地目录时，会转到相应根目录。
    


## 重新载入

rr
        强制重新载入当前页。
    


RR
        忽略缓存内容强制重新载入当前页。
    


:re:reload:re[load][!]
        重新载入当前页。强制重新载入当前页。如果给出[!]，则跳过缓存。
    


:reloada:reloadall:reloada[ll][!]
        重新载入所有页面。强制重新载入所有页面。如果给出[!]，则跳过缓存。
    


## 停止

<C-c><C-c>
        停止载入当前页。仅在未选择文本时才有效，否则复制选择的文本到剪贴板。通常这都不是问题，在加载页面时一般都不会有需要复制的文本。
    


:st:stop:st[op]
        停止载入当前页。
    


:stopa:stopall:stopa[ll]
        停止载入所有页面。
    


writingsave-file写入

:w:write:sav:saveas:sav[eas][!] [file]
        保存当前页到磁盘。如果省略[file]，则保存为页面的默认文件名。只有指定[!]时才会覆盖已有的同名文件。
    


## 退出

### ZQ
不保存会话而退出。与 :qall 作用相同。

### ZZ
保存会话后退出。无论打开了多少个标签页/窗口，都退出 Vimperator。会话被保存。与 :xall 作用相同。

## 当前目录

【什么时候用呢？跟网页的资源管理器结合使用会比较好用。】

### :cd [-|path]
改变当前目录。:cd -改变为前一个访问的目录。

### :pwd 
显示当前目录名。