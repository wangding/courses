# 标签页

标签页
Contents列出标签页打开标签页切换标签页重排序标签页关闭标签页遍历标签页

标签页用于同时浏览多个网页。每个标签页正好包含一个缓冲区—并不支持一个标签页包含多个缓冲区。因此，许多缓冲区命令和标签页命令是可以互换的。

listing-tabs列出标签页

B:tabs:ls:files:buffers:buffers [filter]B
        显示匹配[filter]的缓冲区（即标签页）列表。未给出[filter]则列出所有标签页。

        使用下列的其中一个标识符可表示缓冲区：

        %当前缓冲区#可选缓冲区，用于:e #和<C-^>
    


:keepa:keepalt:keepa[lt] {cmd}
        不改变可选缓冲区执行命令。
    


opening-tabs打开标签页

:tab:tab {cmd}
        执行{cmd}并在新标签页中显示输出内容。仅对支持标签页的命令有效，目前包括：

        
            :tab addons
            :tab downloads
            :tab extoptions
            :tab help
            :tab javascript!
            :tab preferences!
        
    


:window:wind:wind[ow] {cmd}
        执行{cmd}并在新窗口中显示输出内容。请参阅:tab了解所支持的命令列表。
    


:tabdu:tabduplicate:[count]tabdu[plicate]
        创建当前标签页的副本并切换过去。如果给出了[count]，则创建[count]个副本。
    


请参阅opening了解打开新标签页的其他方式。changing-tabs切换标签页

gb[count]gb
        重复最近的:buffer!命令。可用于在具有相似网址或标题的缓冲区之间快速切换。
    


gB[count]gB
        反向重复最近的:buffer!命令。类似与gb，但方向相反。
    


gt[count]gt
        转到下一个标签页。当选择了最后一个标签页时则循环回第一个。如果给出了[count]，则转到第[count]个标签页。
    


<C-PageDown><C-Tab><C-n>[count]<C-n>
        转到下一个标签页。当选择了最后一个标签页时则循环回第一个。如果给出了[count]，则转到后面的第[count]个标签页。
    


<C-PageUp><C-S-Tab><C-p>gT[count]gT
        转到前一个标签页。当选择了第一个标签页时则循环回最后一个。如果给出了[count]，则转到前面的第[count]个标签页。
    


:bn:bnext:tn:tnext:tabn:tabnext:[count]tabn[ext] [count]:[count]tn[ext] [count]:[count]bn[ext] [count]
        切换到下一个或第[count]个标签页。当选择了最后一个标签页且未给出[count]时，则循环回第一个。
    


:bN:bNext:bp:bprevious:tN:tNext:tabN:tabNext:tp:tprevious:tabp:tabprevious:[count]tabp[revious] [count]:[count]tp[revious] [count]:[count]tabN[ext] [count]:[count]bp[revious] [count]:[count]bN[ext] [count]
        切换到前一个标签页或后退[count]个标签页。从首个标签页绕到最后一个。
    


<C-6><C-^>[count]<C-^>
        选择前一个已选择的标签页。这里提供了在两个标签页间快速切换的方法。如果给出了[count]，则转到第[count]个标签页。.
    


b:b:buffer:[count]b[uffer][!] [url|index][count]b
        转到缓冲区列表中的指定缓冲区。参数可以是缓冲区索引或完整的网址。如果给出了[count]，则转到第[count]缓冲区。

        如果参数既不是完整的网址也不是索引值，但可唯一标识某个缓冲区，则选择此缓冲区。加上[!]则选择下一个符合参数的缓冲区，不论它是否可以被唯一标识。使用b可快速执行此命令。

        如果参数为#，则选择可选的缓冲区（请参阅<C-^>）。

        如果未给出参数，则当前缓冲区不变。
    


g^g0:bf:bfirst:br:brewind:tabfir:tabfirst:tabr:tabrewind:tabr[ewind]:tabfir[st]:br[ewind]:bf[irst]g0g^
        切换到首个标签页。
    


g$:bl:blast:tabl:tablast:tabl[ast]:bl[ast]g$
        切换到最后一个标签页。
    


:tabde:tabdetach:tabde[tach]
        分离当前标签页并将其在新窗口中打开。由于每个窗口至少必须包含一个标签页，所以无法分离窗口中的唯一一个标签页。此时可:tabduplicate先复制标签页，然后调用:tabdetach。
    


:taba:tabattach:taba[ttach] {window-index} [tab-index]
        附加当前标签页到另一个窗口。{window-index}是已打开窗口列表的索引，而[tab-index]是其他窗口标签页列表中表示将要插入的标签页索引。如果这是窗口中最后一个标签页，则会关闭窗口。
    


reordering-tabs重排序标签页

:tabm:tabmove:tabm[ove] [N]:tabm[ove][!] [+N] | [-N]
        移动当前标签页到标签页[N]之后。如果[N]为0，则当前标签页移为首个标签页。未给出[N]，则当前标签页移为最后一个。[N]前可以使用“+”或“-”表示相对当前位置的移动。如果给出了[!]，则移动操作会在到达标签页列表的开始或末尾时绕到另一端。
    



closing-tabs关闭标签页

:tabc:tabclose:bun:bunload:bw:bwipeout:bd:bdelete:[count]bd[elete][!] [-s[elect] 'lastactive|left|right'] [arg]
        关闭当前标签页。如果给出了[count]，则关闭[count]个标签页。默认情况下，会选择关闭右侧标签页。

        与[arg]联用时，关闭域名中包含[arg]的所有标签页。[!]则强制命令同时在整个网址和标签页标题中搜索[arg]，然后关闭匹配的标签页，固定标签页也不例外。请小心使用。
        [-select]选项指定关闭当前标签页后会激活哪个标签页。可选的值为：
                left
                right
                lastactive
            

        
    

d[count]d
        删除当前缓冲区标签页。如果给出了[count]，则关闭[count]个标签页。然后，会选择关闭右侧标签页。
    

D[count]D
        与d类似，不过会选择关闭左侧标签页。
    


:tabo:tabonly:tabo[nly]
        关闭其他所有标签页。
    


u:u:undo:[count]u[ndo] [url][count]u
        恢复关闭的标签页。如果给出了数字，则不是恢复最近关闭的那个标签页，而是恢复第[count]近关闭的标签页。带[url]时则恢复匹配网址的标签页。
    


:undoa:undoall:undoa[ll]
        恢复所有已关闭的标签页。Firefox最多保存10个最近关闭的标签页，重启过浏览器也如此。
    



looping-over-tabs遍历标签页

:tabd:tabdo:bufd:bufdo:tabd[o] {cmd}
        对每个标签页执行{cmd}。执行{cmd}时，从首个开始到最后一个，结束时最后一个标签页成为当前标签页。

        {cmd}不应该通过增加、关闭或重排序标签页来改变标签页列表的状态。
