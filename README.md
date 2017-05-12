
ReactiveCocoa

ReactiveCocoa（简称为RAC）,是由Github开源的一个应用于iOS和OS开发的框架,RAC具有函数式编程和响应式编程的特性。现在ReactiveCocoa已经到RAC5，支持swift3，由于项目是使用的OC,所以我使用的是ReactiveCocoa2.5。如果你的项目是纯OC，也可以使用ReactiveObjC。

ReactiveCocoa的函数式编程方式的学习成本比较大，想要学习ReactiveCocoa的可以看这里。
MVVM

MVVM是一个UI设计模式。它是MV模式集合中的一员。MV模式还包含MVC(Model View Controller)、MVP(Model View Presenter)等。这些模式的目的在于将UI逻辑与业务逻辑分离，以让程序更容易开发和测试。其中 ViewModel 的主要职责是处理业务逻辑并提供 View 所需的数据，这样 VC 就不用关心业务，自然也就瘦了下来。ViewModel 只关心业务数据不关心 View，所以不会与 View 产生耦合，也就更方便进行单元测试。

MVVM.png

MVVM模式依赖于数据绑定，由于iOS没有数据绑定框架。但幸运的是ReactiveCocoa可以很方便的实现这个，所以ReactiveCocoa是实现MVVM的最佳方式。不通过ReactiveCocoa也可以实现MVVM一样可以实现，感兴趣的可以看这篇博客。
