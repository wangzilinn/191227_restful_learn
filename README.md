# restful_learn

这是一个学习如何调用restful接口的flutter的练习

## Getting Started

YouTube教程在这里:https://www.youtube.com/watch?v=M8zM48Jytv0&list=PL_Wj0DgxTlJeLFYfRBfpFveEd9cQfIpDx

## 笔记
### 工程结构
1. models里面是数据结构
2. services里面是一个联网的服务
### main.dart
#### setupLoactor():
main()最开始先创建了一个setupLocator()函数,这个函数通过**GetIt**注册了一个服务:NotesService,这个服务是用来连接网络获取消息的

注册服务的时候选择了懒汉单例模式,其传入的参数为一个**工厂函数**,这个工厂返回一个NotesService类的构造函数

使用GetIt的原因是:他是一个全局可见的服务,这样就可以在任意一个组件中使用注册的服务了, 免去了要在每个组件中声明这个服务的麻烦.

#### NoteList
App的主页是一个NoteList(), 这个



