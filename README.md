Introduction_to_Haskell
=======================

This is source code of my book.

书中出现的错误。*表示错误严重等级

第3页 第2行中的QuickTest应该改为QuickCheck。

第14页  第10行。Haksell应该改为Haskell。

第15页  第4段，最后一句Prelude如定义3curry 。。。 改为Prelude中定义了curry。。。

第19页  第2段，以一个小开头。应该改为以一个小写字母开头。

第21页  2.2.3标题 Enum而非Emum

第22页  图2-1中，Num类型类中没有除法/ 。

第22页  图2-1中，GHC 7.4后Num类型类将不再隐含着Eq与Ord类型类，所以对于使用GHC7.0与Hugs的读者不会有影响，所以图中虚线箭头应该去掉，这样当使用模式匹配还有case时类型上下文中需要加入Eq类型类限定。这一新的改动影响了第5章第6节第70页还有其他章节某些代码
###
    fact :: (Num a) => a -> a
    fact 0 = 1
    fact n = n * fact (n-1)
会得到如下错误：
### 
    Fact.hs:2:6:
    Could not deduce (Eq a) arising from the literal `0'
    from the context (Num a)
      bound by the type signature for fact :: Num a => a -> a
      at Fact.hs:1:9-25
    Possible fix:
      add (Eq a) to the context of
        the type signature for fact :: Num a => a -> a
    In the pattern: 0
    In an equation for `fact': fact 0 = 1

根据GHCi给出的可能修复的方式，可以加入Eq a到类型签名的上下文中，即将fact的类型签名改为：
###
    fact :: (Num a , Eq a) => a -> a

这一点影响了37页的abs函数与70页的fibonacci函数。如果读者不确定函数的类型，可以不写类型签名让GHC去推断。

第25页  倒数第10行，`to String`应该为`toString`。

第26页  `b : : Bool`应该为`b :: Bool`。

第28页  第3段`(Num a) => (a> a)> ((a> a),C)`应为`(Num a) => (a -> a) -> ((a -> a), C)`。

第29页  第3段`柯里伦`应为`柯里化`。第3段代码`Show/a`应为`Show a`。

第32页 示例中 
### 
    > f xs = let len = genericLength xs in (len,len)
    
是多余的，应该删去。

第36页 第一段代码isTwo类型签名应该为Int -> Bool，第二行Ture应该为True

第45页  倒数第6行，对照图3-3，应该为对照图3-2 。

第54页  最后一段，点击Ctrl + C组分（合）键

第59页  第二段第二行，上图（面）以字符串作为输出，如果想输入（返回）Int类型

第61页 第一段，用:browse（可简写为:bro）（浏览）一个库。

第61页 第二段，只需要确定最低为（位）是否为0

第49页  代码示例空格缺失了。应该为> flip (-) 3 8。

第51页  中间的代码，avg xs = sum xs / fromIntegral $ length xs 应该改为 avg xs = sum xs / (fromIntegral $ length xs)

第55页  prelude应为Prelude。

第63页 第三段代码facorial的类型应该为Integer -> Integer，而非Integer -> Integer -> Integer。

第81页  第二段代码, 结果多了一个逗号。应该为[5,7,10,12]。

**第90页  msort缺少递归基本条件，应该改为

###
    msort [] = [] 
    msort [x] = [x]
    msort xs = merge (msort x1) (msort x2)
           where (x1, x2) = halve xs
                 halve xs = (take l xs, drop l xs)
                 l = (length xs) `div` 2

第92页  最后一段代码， [1..]  应该改为 [1,1..] 。

第95页  take 5 nature的结果应该为[0,1,2,3,4]而非[1,2,3,4,5]

第100页 isPrime' 代码需要排除偶数的情况，看[Chapter06/Prime.hs](Chapter06/Prime.hs)

第124页  第一行`某两个列表`应为`某个列表`。

**第124页 该页的最后一段：理论上。。。以及下面的图7-1应该插入在125页练习2之后。

第125页 该页的提示是对练习2的提示，应该写在练习2后面。

第126页 最后一部分定义的 >> 全部都应该是 >>> 。

第128页 第三部分代码第二行少了一个左括号

第128页 练习，map map 前面应该是(.).(.) 而不是(.)、(.) 。

第130页 第1段第4行义模式（，）这与C语言。  原文中少了逗号

第159页 8.10 简vd单 中混进了几个字母，应该删除。

第152页 第3段最后一行与自然树（数）同构

第146页 Haskell 2000应该为Haskell 2010.

第172页 第3段最后一行，函数（子）类型类实例

第174页 第1段第1行，那么则结果为   “则”应当删去

第181页 第3段代码，>runParser num应该为>runParser number

第185页 第2段第2行，因为除了复（函）数的复合

第187页 第1行，又为又（右）结合

第203页 测试代码中，两处\x -> （Maybe 6 .. 应该改为Just 6

*第203页 最底端的代码 Just (x+y) 应为 Just (n1+n2) 。

第204页  第3段第1行，《编译原理》讲议（讲义）

第205页 最底端的代码 Prelude>提示的Prelude应该删去。

*第205页 最底端的$>运算符应该改为|>。

第215页 第1段第3行，sum等类型（函数）

第217页 第3段倒数第2行，而且setGlobalVar也无法实现用纯 ...  “实现”去掉

第220页 最后一段第2行，IORef容器来以及相应函数  “来”字去掉

第221页 第3段，第1行中“相邻读者”改为“相信读者”

第233页 11.4开始第2段.idx文件一点中：及释意（义）的长度

第237页 第1行，“列表的字符”改为“字符的列表”

**第280页 最下面倒数第2行的公式应该为m1T m2 同构于 m2T m1，同构符号右端的m2应该改为m1

* 第285页 第1段代码中m <- fresh应该插入到代码的第2行。代码中的mlabel'应该是mlabel

第311页，最后一段，第3点中第3行，表达式t中的变量被则被限定了.. 去掉第一个被

第312页 Beta化简中的+应该去掉。

第312页 计算W W时，等号后面应该是希腊字母Beta而不是数字8.

第326页 Ivar' 应为 'IVar'

第358页 第一个参考文献中的Functiondl应该为Functional。
