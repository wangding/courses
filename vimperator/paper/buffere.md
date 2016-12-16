# 缓冲区

缓冲区
Contents缓冲区信息滚动命令跳到元素缩放使用框架复制文本备选样式表Vimperator给每个标签页生成一个缓冲区对象。它通常是具有高级特性的(X)HTML文档。buffer-information缓冲区信息

<C-g><C-g>
        显示当前文件名。也会显示其他文件信息，如文件大小和上次修改日期。
    


g<C-g>g<C-g>
        显示文件信息。等同于:pageinfo。
    


:pa:pageinfo:pa[geinfo]
        显示各种页面信息。请参阅:help pageinfo了解可用选项。
    


gfgf
        在渲染视图和源码视图间切换。让当前标签页中的页面在正常渲染视图和内部编辑器源码视图间切换。
    


gFgF
        使用外部编辑器查看源代码。外部编辑器由'editor'选项指定。目前，此处指定的外部编辑器必须能下载和打开远程网址中的文件。
    


:vie:viewsource:vie[wsource][!] [url]
        查看当前文档的源代码。如果给出了[url]，则查看此网址页面的源代码。如果给出了[!]，则使用外部编辑器打开。
    



motionscrolling滚动命令

^00
        滚动到页面最左侧。与Vim不同，这里0和^的作用是相同的。
    


$$
        滚动到文档最右侧。
    


<Home>gg[count]gg
        滚动到页面顶端。与[count]联用时，例如35gg则滚动到页面35%高度的位置。
    


<End>G[count]G
        滚动到页面最底端。与[count]联用时，例如35G则滚动到页面35%高度的位置。
    


N%{count}%
        滚动页面到百分之{count}高度的位置。
    


<Left>h[count]h
        往左滚动页面。如果给出了[count]，则往左滚动[count]次。
        如果无法进一步滚动，则发出哔哔声（除非设置了'visualbell'）。
    


<C-e><Down>j[count]j
        往下滚动页面。如果给出了[count]，则往下滚动[count]次。
        如果无法进一步滚动，则发出哔哔声（除非设置了'visualbell'）。
    


<C-y><Up>k[count]k
        往上滚动页面。如果给出了[count]，则往上滚动[count]次。
        如果无法进一步滚动，则发出哔哔声（除非设置了'visualbell'）。
    


<Right>l[count]l
        往右滚动页面。如果给出了[count]，则往右滚动[count]次。
        如果无法进一步滚动，则发出哔哔声（除非设置了'visualbell'）。
    


<C-d>[count]<C-d>
        在缓冲区中往下滚动窗口。'scroll'选项可设置滚动的行数，默认为半个页面。如果给出了[count]，则首先设置'scroll'选项为这个值。
    


<C-u>[count]<C-u>
        在缓冲区中往上滚动窗口。'scroll'选项可设置滚动的行数，默认为半个页面。如果给出了[count]，则首先设置'scroll'选项为这个值。
    


<S-Space><PageUp><C-b>[count]<C-b>
        往上滚动一屏页面。在缓冲区中往上滚动[count]个页面。
    


<Space><PageDown><C-f>[count]<C-f>
        往下滚动一屏页面。在缓冲区中往下滚动[count]页面。
    


jumping跳到元素

<Tab><Tab>
        将键盘焦点移到后一个元素。
    


<S-Tab><S-Tab>
        将键盘焦点移到前一个元素。
    


gi[count]gi
        设置键盘焦点到最近使用的输入字段。如果没有，则设置到首个输入字段。与[count]联用时，直接跳转到第[count]个输入字段。
    


]f[count]]f
        设置焦点到后一个框架。将键盘焦点设置到按顺序排列的后面第[count]个框架。新获取焦点的框架会短暂地以红色标识。并不包围起来。
    


[f[count][f
        设置焦点到前一个框架。将键盘焦点设置到按顺序排列的前面第[count]个框架。新获取焦点的框架会短暂地以红色标识。并不包围起来。
    


]][count]]]
        若存在，则打开文字中含next或>的链接。在浏览论坛或文档时很方便。通过'nextpattern'可改变其行为。它同时跟踪文件间的关系。
    


[[[count][[
        若存在，则打开文字中含prev、previous或<的链接。在浏览论坛或文档时很方便。通过'previouspattern'可改变其行为。它同时跟踪文件间的关系。
    


zoomingzoom缩放缩放命令依赖两个属性：缩放区域和缩放级别。页面缩放的绝对值限定在设定的缩放范围内（默认：30%--300%）的某个值。zi/zo及类似的命令会使用缩放级别来逐步改变缩放值。默认的缩放级别为30%、50%、67%、80%、90%、100%、110%、120%、133%、150%、170%、200%、240%、300%。有效的缩放区域可通过设置'zoom.minPercent'和'zoom.maxPercent'Firefox选项来改变。缩放级别则使用'toolkit.ZoomManager.zoomLevels'选项改变。Note: 'toolkit.ZoomManager.zoomLevels'只能介于0和1之间的某个值，不能是百分数。

+zi[count]zi
        放大当前网页的文本。速记：zoom in。
    


zm[count]zm
        大比例放大当前网页的文本。速记：zoom more。
    


-zo[count]zo
        缩小当前网页的文本。速记：zoom out。
    


zr[count]zr
        大比例缩小当前网页的文本。速记：zoom reduce。
    


zz[count]zz
        设置当前网页文本的缩放比例。缩放比例可介于30%和300%之间。若省略，则将文本缩放比例重置为100%。
    


zI[count]zI
        放大当前网页的所有内容。速记：zoom in。
    


zM[count]zM
        大比例放大当前网页的所有内容。速记：zoom more。
    


zO[count]zO
        缩小当前网页的所有内容。速记：zoom out。
    


zR[count]zR
        大比例缩小当前网页的所有内容。速记：zoom reduce。
    


zZ[count]zZ
        设置当前网页所有内容的缩放比例。缩放比例可介于30%和300%之间。若省略，则将所有内容缩放比例重置为100%。
    


:zo:zoom:zo[om][!] [value]:zo[om][!] +{value} | -{value}
        设置当前网页的缩放比例。[value]可以是介于30%和300%之间的绝对值，或者以“-”或“+”开头的相对值。如果省略[value]，则重置缩放比例为100%。

        一般情况下此命令仅应用于文本缩放，若与[!]联用，则应用于所有内容。
    


frames使用框架

:frameo:frameonly:frameo[nly]
        仅显示当前框架的页面。
    


copyingyanking复制文本在X11上使用时，下列命令不仅会复制文本到剪贴板同时也会存入X11选区，这样可使用鼠标中键粘贴内容：yy
        复制当前位置到剪贴板。在X11上使用时，还会同时复制地址到选区中，接着可以通过鼠标中键来粘贴。
    


YY
        复制当前选择的文本到系统剪贴板。
    


alternate-stylesheet备选样式表页面作者可以为HTML文档指定备选的样式表。用户就可以在这些样式表之间切换，选择自己最喜欢的。:pagest:pagestyle:pagest[yle] [stylesheet]
        选择要应用的由作者提供的样式表。如果未给出[stylesheet]，则使用默认样式表。

        通过设置'usermode'选项可移除所有作者样式。