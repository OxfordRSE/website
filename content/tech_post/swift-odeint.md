---
title: "Swift implementation of Dormond Price RK5(4) ODE integration"
date: 2020-05-20
draft: false
syntax_highlighting: false
mathjax: false
---

[Swift](https://swift.org/) is a relatively new language that was initially developed by 
Apple and released to the open source community on December 3, 2015. It is a compiled, 
type-safe language built upon the [LLVM](https://llvm.org/) infrastructure, with a focus 
on safety, speed and expressiveness. One of its notable features is the use of 
[protocol-orientated 
programming](https://www.hackingwithswift.com/example-code/language/what-is-protocol-oriented-programming), 
or the ability to specify abstract protocols that concrete types can then conform to, 
allowing swift programmers write 
[type-generic](https://en.wikipedia.org/wiki/Generic_programming) algorithms in a safer, 
more expressive manner. The use of static analysis in conjunction with protocols means 
that IDEs can highlight mistakes in generic code while the code is being written, rather 
than at compile time. The main IDE support for swift is using Apple's proprietary 
[Xcode](https://developer.apple.com/xcode/) IDE, however plugins for other IDEs such as 
[vim](https://github.com/klaaspieter/coc-sourcekit) and 
[vscode](https://marketplace.visualstudio.com/items?itemName=Kasik96.swift) can also be 
used.

To learn a bit more about this language, and to see how it can be used in numerical 
programming, one of our RSEs, [Martin Robinson](https://github.com/martinjrobins), 
implemented an adaptive time-stepping [ODE integrator in 
swift](https://github.com/martinjrobins/swift-odeint), based on the Dormond Price RK5(4) 
method [1]. Anyone interested should feel free to contact Martin, he would be very keen 
to hear how far swift is being used in academia!

[1] Dormand, J. R., & Prince, P. J. (1980). A family of embedded Runge-Kutta formulae. 
    Journal of computational and applied mathematics, 6(1), 19-26.

