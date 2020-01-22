# restful_learn

这是一个学习如何调用restful接口的flutter的练习

## Getting Started

YouTube教程在这里:https://www.youtube.com/watch?v=M8zM48Jytv0&list=PL_Wj0DgxTlJeLFYfRBfpFveEd9cQfIpDx

# 笔记:

## 知识点

1. get/set

2. factory
3. @required
4. return { //map}
5. .then()
6. .catchError()
7. build()和initState()执行顺序

## 工程结构
1. models里面是数据结构
2. services里面是一个restful服务
3. views里面包含了所有的界面

## main.dart
### setupLoactor():
main()最开始先创建了一个setupLocator()函数,这个函数通过**GetIt**注册了一个服务:NotesService,这个服务是用来连接网络获取消息的

注册服务的时候选择了懒汉单例模式,其传入的参数为一个**工厂函数**,这个工厂返回一个NotesService类的构造函数

使用GetIt的原因是:他是一个全局可见的服务,这样就可以在任意一个组件中使用注册的服务了, 免去了要在每个组件中声明这个服务的麻烦.

### NoteList
App的主页是一个NoteList(), 这个类是在views.notelist.dart中定义的

## models

工程定义了4种数据结构,

### api_response.dart 获得http调用后的结果

```dart
class APIResponse<T>{
  T data;
  bool error;
  String errorMessage;
}
```

### note.dart 获得单个note的详细信息

```dart
class Note {
  String noteID;
  String noteTitle;
  String noteContent;
  DateTime createDateTime;
  DateTime lastEditedDateTime;
}
```

### note_for_listing.dart 获得单个list的简要信息,用在主页面显示

```dart
class NoteForListing {
  String noteID;
  String noteTitle;
  DateTime createDateTime;
  DateTime lastEditedDateTime;
}
```

### note_insert.dart 存放新建note的信息

```dart
class NoteInsert {
  String noteTitle;
  String noteContent;
}
```

## services

### note_services.dart

这个文件定义了如何获取restful数据

1. 首先定义header,注意里面的Content-Type,不知道在spring中表现如何
2. 使用http库传入网址和header后,使用then()方法对数据进行处理
3. then()方法传入一个匿名函数,该函数有一个参数, 这个参数是http返回的数据,这个数据的body字段是返回的具体内容, statusCode字段是返回的状态码
4. 如果请求成功,则返回仅包含了data字段的APIResponse,否则返回含error和errorMessage的APIresponse
5. 

## views

### note_list.dart

这个状态类是程序主页面的显示内容

1. 先定义一个get方法, 这个方法返回一个之前定义的noteServices服务

   ```dart
   NotesService get service => GetIt.I<NotesService>();
   ```

2. 定义一个状态指示变量_isLoading, 每次都使用setStatus来更新该变量,从而更新build

3. build方法中, 使用Builder组件,可以更方便的根据外部状态绘制不同类型的组件

4. 使用Dismissible可以创造出可以删除的列表


### note_delete.dart

这个文件显示一个提示窗,用来确认用户是否删除文件

1. 使用Navigator...pop(参数)的方法在页面间传递消息,这个参数可以是任意类型

### note_modify.dart

这个是修改note的界面

1. 使用TextEditingController来控制空间中的Text, 如果TextEditingController.text没有被设置,则显示hintText,否则显示text





