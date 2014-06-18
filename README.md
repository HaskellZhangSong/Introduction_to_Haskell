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

第45页  倒数第6行，对照图3-3，应该为对照图3-2 。

第49页  代码示例空格缺失了。应该为> flip (-) 3 8。

第51页  中间的代码，avg xs = sum xs / fromIntegral $ length xs 应该改为 avg xs = sum xs / (fromIntegral $ length xs)

第81页  第二段代码, 结果多了一个逗号。应该为[5,7,10,12]。

**第90页  msort缺少递归基本条件，应该改为

msort [] = [] 
msort [x] = [x]
msort xs = merge (msort x1) (msort x2)
           where (x1, x2) = halve xs
                 halve xs = (take l xs, drop l xs)
                 l = (length xs) `div` 2

第92页  最后一段代码， [1..]  应该改为 [1,1..] 。

**第124页 该页的最后一段：理论上。。。以及下面的图7-1应该插入在125页练习2之后。

第125页 该页的提示是对练习2的提示，应该写在练习2后面。

第126页 最后一部分定义的 >> 全部都应该是 >>> 。

第128页 练习，map map 前面应该是(.).(.) 而不是(.)、(.) 。

第159页 8.10 简vd单 中混进了几个字母，应该删除。

第146页 Haskell 2000应该为Haskell 2010.

第203页 测试代码中，两处\x -> （Maybe 6 .. 应该改为Just 6

*第203页 最底端的代码 Just (x+y) 应为 Just (n1+n2) 。

第205页 最底端的代码 Prelude>提示的Prelude应该删去。

*第205页 最底端的$>运算符应该改为|>。

第221页 第3段，第1行中“相邻读者”改为“相信读者”

**第280页 最下面倒数第2行的公式应该为m1T m2 同构于 m2T m1，同构符号右端的m2应该改为m1

第312页 Beta化简中的+应该去掉。

第312页 计算W W时，等号后面应该是希腊字母Beta而不是数字8.

第358页 第一个参考文献中的Functiondl应该为Functional。
