# 搜索文本

文本搜索命令
Contents

Vimperator提供了一个类似Vim的界面来访问Firefox标准文本搜索功能。搜索命令不支持正则表达式，因为Firefox没有提供提供原生的正则支持。而且很可能永远不会有。

//{pattern}[/]<CR>
        向前搜索首个匹配{pattern}的文本。

        如果模式中包含\c，则如同开启了'ignorecase'，对整个模式进行匹配时不区分大小写。\C则强制区分大小写进行匹配。
        如果模式中包含\l，则如同开启了'linksearch'，匹配时仅搜索链接文本。\L则强制搜索整个页面。
    


??{pattern}[?]<CR>
        向后搜索{pattern}。

        {pattern}可以使用与/中相同的修饰符。

        Note: 目前增量搜索仅在正向有效。
    


nn
        查找下一个。重复一次最近的搜索（目前还不支持count）。
    


NN
        查找上一个。反向重复一次最近的搜索（目前尚不支持count）。
    


**
        向前查找光标下的单词。
    


##
        向后查找光标下的单词。
    


:noh:nohlsearch:noh[lsearch]
        关闭搜索高亮。进行新搜索或开启'hlsearch'选项后，高亮会再次打开。
