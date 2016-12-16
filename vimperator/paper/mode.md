# 模式

命令行模式
Contents命令行编辑命令行补全命令行模式用于执行Ex命令（:）和文本搜索（/和?）。::
        启动命令行模式。在命令行模式中可以执行扩展命令，不过可能需要参数。
    



cmdline-editing命令行编辑

c_<C-c><C-c>
        不执行命令退出命令行模式。
    


c_<C-]><C-]>
        展开命令行缩写词。
    


c_<Up><Up>
        从历史列表中调入匹配当前命令行内容的前一个命令。
    


c_<Down><Down>
        从历史列表中调入匹配当前命令行内容的后一个命令。
    


c_<S-Up>c_<PageUp><S-Up><PageUp>
        从历史列表中调入前一个命令。
    


c_<S-Down>c_<PageDown><S-Down><PageDown>
        从劣势列表中调入后一个命令。
    


cmdline-completion命令行补全

c_<Tab><Tab>
        根据'wildmode'选项设定的行为补全光标前的单词。如果'wildmode'包含“list”且有多个符合条件的项，则打开补全菜单窗口。
    


c_<S-Tab><S-Tab>
        当'wildmode'选项中含“full”时补全为前一个完全匹配项。




————————————————————————————

插入模式
Contents插入模式专用键

插入模式用于在文本框和文本区域中输入文本。开启'insertmode'选项时，当焦点设置到文本区域时会立即切换到插入模式。

i_ii_i
        在关闭'insertmode'选项时，启动文本区域的插入模式。
    



ins-special-keys插入模式专用键

i_<C-i><C-i>
        调用外部编辑器。请参阅'editor'选项。
    


i_<C-]><C-]>
        展开插入模式的缩写词。
