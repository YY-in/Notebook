[TOC]



# Java复习

## 第1章   Java的入门

### 1.5.2 编译

​	编译器j```javac.exe```

​	如果在保存Java源文件时选择的编码是ANSI，那么可以直接使用``` javac.exe```编译源文件

​	如果在保存Java源文件时选择的编码是UTF-8,那么在使用``` javac.exe```编译时必须显示定义-encoding参数.例如:

​								```javac -encoding utf-8 Hello.java```

### 1.5.3 运行

​	解释器```java.exe```

​	一个Java应用程序必须包含一个main函数,称这个类为主类

​	使用Java解释器(java.exe)来解释\执行字节码文件,例如:

​										```java Hello```

### 1.6 Java 反编译

​	反编译器(javap.exe),也有商业反编译软件如dj-gui

​	例如,想要反编译Hello.claas文件,则

​						``` javap Hello```

​			            ```  javap java.util.Date```

​	

## 第2章 基本数据类型与数组

### 2.1 标识符

一共有4条约束,其中标识符的第一个字符不能是数字

### 2.2 基本数据类型

| 整数类型 | 说明  |
| :------: | :---: |
|   int    | 4字节 |
|   byte   | 1字节 |
|  short   | 2字节 |
|   long   | 8字节 |

常量的声明:

123(十进制)

077(八进制,用数字0作为前缀)

03ABC(十六进制,用0x作为前缀)

0b11(二进制,用0b或者0B作为前缀)

123L(Long型常量用后缀L表示)

#### 2.2.3 字符类型

对于char型变量，分配两字节内存，占16位

```char x = 'a'```与```char x = 97``` 等价

在java中,可以用字符在Unicode表中排序的十六进制的转译(需要使用u作为前缀)

如A可以用```\u0041```表示,a可以用```\u0061```表示

#### 2.2.4 浮点类型

| float                  |           double           |
| ---------------------- | :------------------------: |
| 4字节                  |           8字节            |
| 作为常量必须有后缀F或f | 作为常量后缀为d或D，可省略 |
| 保留8位有效数字        |      保留16位有效数字      |

### 2.3 类型转换运算

类型按照精度排序

```byte short char int long float double```

低级别变量赋值给高级别变量,系统自动完成数据类型的转换

当高级变量赋值给低级别变量,必须强转型

### 2.4 输入与输出数据

#### 2.4.1 输入基本型数据

```java
Scanner scanner = new Scanner(System.in);
```

nextBoolen()	nextByte()	nextShort()	nextInt()	nextLong()	nextFloat()	nextDouble()

| 分隔标记 |             以空白作为分隔标记             |
| -------- | :----------------------------------------: |
| 堵塞状态 | 在输入结尾等待用户在命令行用空格并回车确认 |

#### 2.4.2 输出基本型数据

| 格式控制符 | 描述                                     |
| ---------- | ---------------------------------------- |
| %d         | 输出int型数据                            |
| %c         | 输出char型数据                           |
| %f         | 输出浮点型数据，小数点最多保留6位        |
| %s         | 输出字符串数据                           |
| %md        | 输出的int型数据占m行                     |
| %m.nf      | 输出的浮点型数据占m行，小数点部分保留n位 |

#### 2.5 数组

```java
int address=System.identityHashCode(a);
```

对于char型数组``` System.out.println(a)```不会输出数组的引用,而是输出数组的全部引用.



## 第3章 运算符、表达式、语句

### 3.1  运算符和表达式

#### 3.1.3 算术混合运算的精度

1. 如果表达式中有double>float>long,按照精度最大值进行运算
2. 如果表达式中的最高精度低于int型整数，则按照int精度进行运算

#### 3.1.4 关系运算符与关系表示式

![image-20211112162756855](D:\Docs\Java复习\image-20211112162756855.png)

### 3.4 switch 开关语句

```switch(表达式){ case 常量1: 若干语句 break;}```

表达式和常量可以```byte、short、int、char、String```类型

如果某个case中没有使用break语句,程序不仅执行该case中的若干语句,而且继续执行后面的case中若干语句,直到遇到一个含有break的case.

### 3.6 brak和contine语句

| 语句     | 说明                                     |
| -------- | ---------------------------------------- |
| break    | 在循环中执行,整个循环结束                |
| continue | 在循环中执行,本次循环结束,继续下一次循环 |

### 3.7 增强for循环

```for(声明循环变量:循环对象){}```



## 第4章 类与对象

面向对象

类的五大成员：属性、构造器、方法、代码块、内部类

### 4.2 类

#### 4.2.6  类的UML图

Unifiled Modeling Language，统一建模语言

| 层数           | 名称                               |
| -------------- | ---------------------------------- |
| 名字层         | 常规字体（具体类）、斜体（抽象类） |
| 变量层、属性层 | 变量名称：类型                     |
| 方法层         | 方法名称（参数列表）：类型         |

### 4.3 构造方法与对象的创建

#### 4.3.1 构造方法

如果类中定义了一个或多个构造方法，那么Java不提供默认的构造方法

#### 4.3.2 创建对象

1. 给new 类的成员变量分配内存空间
2. 执行构造方法的语句
3. new 标识符计算出一个十六进制数，表示对象的引用。即，new ClassName()的值是一个引用
4. 赋值给一个对象变量

```vim
对象的引用都放在栈中。
1.栈的优势是存取速度比堆快;缺点是存放在栈中的数据大小与生命周期必须是确定的,缺少灵活性
2.堆的优势是可以动态的分配内存大小，生命周期也不必告诉编译器。缺点在于要动态分配内存，存取速度较慢。
```

#### 4.3.4 对象的引用和实体

###### 垃圾回收机制

一个类声明的两个对象如果具有相同的引用，而Java会周期地监测某个实体是否已不再被任何对象所拥有的（引用），如果发现这样的实体，就释放实体占用的内存。

```如果希望Java虚拟机立即进行“垃圾回收”，可以让System类调用gc()方法。```

### 4.5 参数的传值

#### 4.5.1 传值机制

方法中参数变量的值是调用者指定的值的副本。方法的参数又叫形参，称其传值的变量或常量叫做实参。

#### 4.5.2 基本数据类型的传值

对于基本数据类型的参数，向该参数传递的值的级别不可以高于参数的级别,如不可以向int传float,但可以向double传float

类型按照精度排序```byte short char int long float double```

#### 4.5.3 引用类型参数的传值

引用数据类型: 数组\对象\接口

''传值"传递的是变量的"引用",而不是变量的实体

#### **4.5.4 可变参数**

可变参数(Variable Argument)：指在声明方法的时候不给出形参列表中从某项开始直至最后一项参数的名字和个数，但这些参数类型必须相同，例如

```java
publifc void fun(int...x){}
```

称x是方法fun()的形参列表中的可变参数的“参数代表”，**参数代表必须是形参列表的最后一项**。

参数代表可以通过下标运算符来运算表示形参列表中的具体参数，即x[0],x[1]....x[m-1]

可以使用增强for循环，对参数代表进行遍历

### 4.6 对象的组合

#### 4.6.1 关联关系

A类的成员变量使用B类声明的对象，A-B的关系是关联关系，称A类的对象关联于B类的对象，或A类的对象组合了B类的对象。![image-20211116142253589](.\img\image-20211116142253589.png)

#### 4.6.2 依赖关系

如果A类中某个方法的参数是用B类声明的对象，或某个方法的返回的数据类型是B类对象，那么A和B的关系是依赖关系，称A依赖于B

![IMG_20211116_142756](.\img\IMG_20211116_142756.jpg)

### 4.7 实例成员与类成员

#### 4.7.1 实例变量和类变量的声明

使用static声明的是类变量、静态变量，否则就是实例变量![image-20211116144749158](C:\Users\13980\AppData\Roaming\Typora\typora-user-images\image-20211116144749158.png)

#### 4.7.2 实例变量和类变量的区别

1. 不同对象的实例变量互不相同
2. 所有对象共享静态变量（类变量）：静态变量使用同一块内存
3. 通过类名直接访问类变量：静态变量的在类加载到内存时就被分配了空间

#### 4.7.3 实例方法和类方法的定义

​	实例方法在构造方法之前执行

#### 4.7.4 实例方法和类方法的区别

 1. 对象调用实例方法：

    只有在类创建第一个对象后，类的实例方法才会被分配入口地址，且后面创建的对象共享该入口地址。只有当所有对象不存在的时候，实例方法的入口地址才会被取消。

    实例方法啥都可以调用（实例方法、静态方法（类方法）、实例变量、静态变量（类变量））

 2. 类名调用类方法：

    对于类中的类方法，在该类被加载到内存就分配了相应的入口地址，类方法的入口地址直到程序退出才取消。

    类方法只能调用类变量和类方法。

 3. 设计类方法的原则

    如果一个方法不需要操作类中的实例变量，或调用实例方法就可以满足程序的需要，则可以将这个方法设计为static方法，作为工具类使用。4.8 重载与重写

### 4.8 final关键字

![image-20211123133136718](C:\Users\13980\OneDrive - iweii\桌面\笔记\Java复习\img\image-20211123133136718.png)

### 4.9 this关键字

this表示某个对象，可以出现在实例方法、构造方法当中，不可以出现在类方法当中。

#### 4.9.1 在构造方法中的this

表示该构造方法创建的对象

#### 4.9.2 在实例方法中创建的对象

this表示正在调用该方法的当前对象

**this.变量 访问的是当前节点的成员变量**

**this() 访问本类构造器方法**

this.成员方法() 访问本类的成员方法

1.  对于变量的调用

   ​		```this.实例变量```      ```ClassName.静态变量```

2. 对于方法的调用

   ​        ```this.实例方法```      ```ClassName.静态方法```

### 4.10 super关键字

+ 在Java类中使用super来调用父类中的指定操作： 
  + super可用于访问父类中定义的属性 
  + super可用于调用父类中定义的成员方法 
  + super可用于在子类构造器中调用父类的构造器

+ 注意： 
  + 尤其当子父类出现同名成员时，可以用super表明调用的是父类中的成员 
  + super的追溯不仅限于直接父类 
  + super和this的用法相像，this代表本类对象的引用，super代表父类的内存 空间的标

4.11 super和this的区别

![image-20211123124330943](C:\Users\13980\OneDrive - iweii\桌面\笔记\Java复习\img\image-20211123124330943.png)

### 4.12 访问权限

| 访问权限  | 本类 | 本包类 | 子类 | 非子类的外包类 |
| --------- | ---- | ------ | ---- | -------------- |
| public    | 是   | 是     | 是   | 是             |
| protected | 是   | 是     | 是   | 否             |
| default   | 是   | 是     | 否   | 否             |
| private   | 是   | 否     | 否   | 否             |

不能用protected和private修饰类（可以修饰内部类）

### 4.13 基本类型的封装类

JDK 11之后直接将一个基本数据类型赋值给所创建的对象

```java
Integer num = 100;
```



### 4.14 var局部变量

Java SE 10 后增加“局部变量类型判断”的新特性

声明局部变量 在类的类休中,不可以用 var 声明成员变量(成员变量知识点见4.2.3节),即仅限于在方法体内使用 var 声明局部变量。在方法的方法体内使用 var 声明局部变量时,必须显式地指定初值(初值不可以是 null ),那么编译器就可以推断出 var 所声明的变量的类型,即确定该变量的类型。 var 不是真正意义上的动态变量(在运行时刻确定类型). var 声明的变量也是在编译阶段就确定了类型。需要注意的是,方法的参数和方法的返回类型不可以用 var 来声明。
 var 是保留类型名称,但不是 Java 的关键字。从 JDK 10开始, var 也可用作变量或方法的名字。但是, var 不能再用作类或接口的名称

```java
import java.util.Date ; 
class Tom {
 	void f ( double m ){
 	var width =108; I // var 声明变量 width 并推断出是 int 型
 	var height = m ; I // var 声明变量 height 并推断出是 double 型
 	var date = new Date (); // var 声明变量 date 并推断出是 Date 型
    // width =3.14;非法,因为 width 的类型已经确定为 int 型
	// var str ;非法,没有显式地指定初值,无法推断 str 的类型
	// var what = null ;非法,无法推断 what 的类型
 	System.out.printf (＂%d ,%f,%s\n ", width , height , date );
    }          
}
public class Example4_21{
 	public static void main ( String args []){ 
    // var 声明变量 tom 并推断出是 Tom 型
	 var tom = new Tom ();
 	 tom.f (6.18);
    }
}
```

### 4.16 jar文件

​	可以将有包名的类字节码文件压缩成一个jar文件，供其他源文件用import语句导入jar文件中的类。

1.  存放源文件到对应目录，编译Java源文件，生成字节码文件
2.  编写清单文件（Manifestfiles）.mf文件
3.  jar cfm [字节码文件目录] 命令
4.  使用jar文件中的类 

### 4.17 代码块

![image-20211123132833441](C:\Users\13980\OneDrive - iweii\桌面\笔记\Java复习\img\image-20211123132833441.png)

## 第5章 面向对象的性质

### 5.1 继承性

#### 5.1.1 继承简介
 继承是面向对象三大特征之一。可以使子类获得弗雷德方法和属性，还可以在子类当中重新定义，追加属性和方法。

继承的好处：

1. 提高代码的复用性
2. 提高代码的会户型

继承的缺点：

1. 增强了耦合性，削弱了子类的独立性

使用条件： is a

#### 5.1.2 继承中变量的访问
 + 子类局部范围
 + 子类成员范围
 + 父类成员范围
 + 报错

#### 5.1.3 继承中构造方法的访问特点

子类中所有构造方法默认都会访问父类中无参的构造方法

+ 因为子类会继承父类的数据，可能还会使用父类的数据。所以子类初始化之前，一定要完成父类初始化

+ 每一个子类构造方法的第一句都默认是super();

+ 如果父类中没有无参构造方法，只有带参构造方法，怎么办？

  - 通过使用super关键字去显示调用父类带参构造方法。

  - 在父类中自己提供一个无参构造方法

#### 5.1.4 继承中成员方法的访问特点

1. 子类成员范围
2. 父类成员范围
3. 报错

#### 5.1.5 super内存的调用

[视频]: C:\Users\13980\OneDrive-iweii\桌面\笔记\Java复习\video



#### 5.1.6 方法的重写（override\overwrite）

+ 定义：在子类中可以根据需要对从父类中继承来的方法进行改造，也称 为方法的重置、覆盖。在程序执行时，子类的方法将覆盖父类的方法。

+ 要求：

  1. 子类重写的方法必须和父类被重写的方法具有相同的方法名称、参数列表 

  2. 子类重写的方法的返回值类型不能大于父类被重写的方法的返回值类型 

  3.  子类重写的方法使用的访问权限不能小于父类被重写的方法的访问权限 

     ​		**子类不能重写父类中声明为private权限的方法** 

  4.  子类方法抛出的异常不能大于父类被重写方法的异常

     

### 5.2 多态性

#### 5.2.1 多态简述

+ 多态性，是面向对象中最重要的概念，在Java中的体现： 
  + 对象的多态性：父类的引用指向子类的对象 	
    + 可以直接应用在抽象类和接口上

+ Java引用变量有两个类型：编译时类型和运行时类型。编译时类型由声明 该变量时使用的类型决定，运行时类型由实际赋给该变量的对象决定。简 称：**编译时，看左边；运行时，看右边。** 
  + 若编译时类型和运行时类型不一致，就出现了对象的多态性(Polymorphism) 
  + 多态情况下，
    + “看左边” ：看的是**父类的引用**（父类中不具备子类特有的方法） 
    + “看右边” ：看的是**子类的对象**（实际运行的是子类重写父类的方法）

+ 对象的多态 —在Java中,子类的对象可以替代父类的对象使用 

  + 一个变量只能有一种确定的数据类型 

  + 一个引用类型变量可能指向(引用)多种不同类型的对象

    **子类可看做是特殊的父类，所以父类类型的引用可以指向子类的对象：向上转型(upcasting)。**

+ 一个引用类型变量如果声明为父类的类型，但实际引用的是子类 对象，那么该变量就不能再访问子类中添加的属性和方法

  ```java
  Student m = new Student();
  m.school = “pku”; //合法,Student类有school成员变量
  Person e = new Student(); 
  e.school = “pku”; //非法,Person类没有school成员变量
  ```

+  方法声明的形参类型为父类类型，可以使用子类的对象作为实参调用该方法

  ```java
  public class Test {
  	public void method(Person e) {
      	e.getInfo();
  	}
  	public static void main(Stirng args[]) {
  		Test t = new Test();
  		Student m = new Student();
  		t.method(m); // 子类的对象m传送给父类类型的参数e
  	}
  }
  
  ```

#### 5.2.2 虚拟方法调用

+ 正常的方法调用 

  ```	java
  Person e = new Person(); 
  e.getInfo();
  Student e = new Student(); e.getInfo(); 
  ```

+ 虚拟方法调用(多态情况下) 

  子类中定义了与父类同名同参数的方法，在多态情况下，将此时父类的方法称为虚拟方法，父类根据赋给它的不同子类对象，动态调用属于子类的该方法。这样的方法调用在编译期是无法确定的。 

  ```java
  Person e = new Student(); 
  e.getInfo(); //调用Student类的getInfo()方法
  ```

  编译时类型和运行时类型 编译时e为Person类型，而方法的调用是在运行时确定的，所以调用的是Student类 的getInfo()方法。**——动态绑定**

![image-20211123130540188](C:\Users\13980\OneDrive - iweii\桌面\笔记\Java复习\img\image-20211123130540188.png)

#### 5.2.3 多态小结

+ 多态作用： 
  +  提高了代码的通用性，常称作接口重用 

+ 前提： 
  + 需要存在继承或者实现关系 
  + 有方法的重写 

+ 成员方法： 
  + 编译时：要查看引用变量所声明的类中是否有所调用的方法。 
  + 运行时：调用实际new的对象所属的类中的重写方法。

+ 成员变量： 
  +  不具备多态性，只看引用变量所声明的类

#### 5.2.4 instanceof 操作符

**x instanceof A：检验x是否为类A的对象，返回值为boolean型。** 

要求x所属的类与类A必须是子类和父类的关系，否则编译错误。 

如果x属于类A的子类B，x instanceof A值也为true。

```java
public class Person extends Object {…}
public class Student extends Person {…}
public class Graduate extends Person {…}
-------------------------------------------------------------------
public void method1(Person e) {
if (e instanceof Person) 
// 处理Person类及其子类对象
if (e instanceof Student) 
//处理Student类及其子类对象
if (e instanceof Graduate)
//处理Graduate类及其子类对象
}
```

#### 5.2.5 对象类型转换（向下转型）

+ 基本数据类型的Casting： 

  + 自动类型转换：小的数据类型可以自动转换成大的数据类型 如long g=20; double d=12.0f 

  + 强制类型转换：可以把大的数据类型强制转换(casting)成小的数据类型 如

     float f=(float)12.0; int a=(int)1200L

+ 对Java对象的强制类型转换称为造型 
  + 从子类到父类的类型转换可以自动进行 
  + 从父类到子类的类型转换必须通过造型(强制类型转换)实现 
  + 无继承关系的引用类型间的转换是非法的 
  + 在造型前可以使用instanceof操作符测试一个对象的类型

```java
public class ConversionTest {
	public static void main(String[] args) {
		double d = 13.4;
		long l = (long) d;
		System.out.println(l);
		int in = 5;
		// boolean b = (boolean)in;
		Object obj = "Hello";
		String objStr = (String) obj;
		System.out.println(objStr);
		Object objPri = new Integer(5);
		// 所以下面代码运行时引发ClassCastException异常
		String str = (String) objPri;
	}
}
```

![image-20211123131957294](C:\Users\13980\OneDrive - iweii\桌面\笔记\Java复习\img\image-20211123131957294.png)

## 第6章 接口与实现

### 6.1 接口

#### 6.1.1 接口概述

+ 一方面，有时必须从几个类中派生出一个子类，继承它们所有的属性和方 法。但是，Java不支持多重继承。有了接口，就可以得到多重继承的效果。 
+ 另一方面，有时必须从几个类中抽取出一些共同的行为特征，而它们之间又 没有is-a的关系，仅仅是具有相同的行为特征而已。例如：鼠标、键盘、打 印机、扫描仪、摄像头、充电器、MP3机、手机、数码相机、移动硬盘等都 支持USB连接。 
+ 接口就是规范，定义的是一组规则，体现了现实世界中“如果你是/要...则 必须能...”的思想。继承是一个"是不是"的关系，而接口实现则是 "能不能" 的关系。 
+ 接口的本质是契约，标准，规范，就像我们的法律一样。制定好后大家都 要遵守。

#### 6.1.2 接口定义

+ 接口(interface)是抽象方法和常量值定义的集合。
+ **接口的特点：** 
  + 用interface来定义。 
  + 接口中的所有成员变量都默认是由public static final修饰的。 
  + 接口中的所有抽象方法都默认是由public abstract修饰的。 
  + 接口中没有构造器。 
  + 接口采用多继承机制。

#### 6.1.3 接口规范

+ 定义Java类的语法格式：先写extends，后写implements 
+  class SubClass extends SuperClass implements InterfaceA{ } 
+  一个类可以实现多个接口，接口也可以继承其它接口。 
+  实现接口的类中必须提供接口中所有方法的具体实现内容，方可实 例化。否则，仍为抽象类。 
+  接口的主要用途就是被实现类实现。（面向接口编）
+  与继承关系类似，接口与实现类之间存在多态性  接口和类是并列关系，或者可以理解为一种特殊的类。从本质上讲， 接口是一种特殊的抽象类，这种抽象类中只包含常量和方法的定义 (JDK7.0及之前)，而没有变量和方法的实现。

#### 6.2 接口和抽象类之间的对比

![image-20211123134349356](C:\Users\13980\OneDrive - iweii\桌面\笔记\Java复习\img\image-20211123134349356.png)

![image-20211123134441136](C:\Users\13980\OneDrive - iweii\桌面\笔记\Java复习\img\image-20211123134441136.png)

![image-20211123134522958](C:\Users\13980\OneDrive - iweii\桌面\笔记\Java复习\img\image-20211123134522958.png)

#### 6.3 Lambda 表达式（jdk1.8以上）

#### 6.3.1 概述

Lambda 表达式：在Java 8 语言中引入的一种新的语法元素和操 作符。这个操作符为 “->” ， 该操作符被称为 Lambda 操作符 或箭头操作符。它将 Lambda 分为两个部分： 

左侧：指定了 Lambda 表达式需要的参数列表 

右侧：指定了 Lambda 体，是抽象方法的实现逻辑，也即 Lambda 表达式要执行的功能。

#### 6.3.2 语法

![image-20211123140122357](C:\Users\13980\OneDrive - iweii\桌面\笔记\Java复习\img\image-20211123140122357.png)

![image-20211123140138564](C:\Users\13980\OneDrive - iweii\桌面\笔记\Java复习\img\image-20211123140138564.png)

#### 6.3.3 用途

1. 实现接口的匿名函数

2. 替代匿名内部类

3. 使用lambda表达式对集合进行迭代

   ```java
    @Test
       public void iterTest() {
           List<String> languages = Arrays.asList("java","scala","python");
           //before java8
           for(String each:languages) {
               System.out.println(each);
           }
           //after java8
           languages.forEach(x -> System.out.println(x));
           languages.forEach(System.out::println);
       }
   ```

4. Stream操作

#### 6.3.4 函数式接口

+ 只包含一个抽象方法的接口，称为函数式接口。 
+ 你可以通过 Lambda 表达式来创建该接口的对象。（若 Lambda 表达式 抛出一个受检异常(即：非运行时异常)，那么该异常需要在目标接口的抽 象方法上进行声明）。 
+ 我们可以在一个接口上使用 @FunctionalInterface 注解，这样做可以检 查它是否是一个函数式接口。同时 javadoc 也会包含一条声明，说明这个 接口是一个函数式接口。 
+  在java.util.function包下定义了Java 8 的丰富的函数式接口

## 第7章 内部类与异常类

### 7.1 内部类

#### 7.1.1 内部类简述

+ 当一个事物的内部，还有一个部分需要一个完整的结构进行描述，而这个内 部的完整的结构又只为外部事物提供服务，那么整个内部的完整结构最好使 用内部类。 

+ 在Java中，允许一个类的定义位于另一个类的内部，前者称为内部类，后者 称为外部类。 

+  Inner class一般用在定义它的类或语句块之内，在外部引用它时必须给出完 整的名称。 

  ​	**内部类的名字不能与包含它的外部类类名相同；** 

+ 分类： 

  * **成员内部类**（static成员内部类和非static成员内部类）
  *  **局部内部类**（不谈修饰符）、匿名内部类

#### 7.1.2 成员变量

**作为类的成员角色**

+  和外部类不同，Inner class还可以声明为private或protected； 
+  可以调用外部类的结构 
+  Inner class 可以声明为static的，但此时就不能再使用外层类的非static的成员变量；

**作为类的角色**

+ 可以在内部定义属性、方法、构造器等结构 
+  可以声明为abstract类 ，因此可以被其它的内部类继承 
+  可以声明为final的 
+  编译以后生成OuterClass$InnerClass.class字节码文件（也适用于局部内部类）

**注意事项**

1. 非static的成员内部类中的成员不能声明为static的，只有在外部类或static的成员 内部类中才可声明static成员。 
2.  外部类访问成员内部类的成员，需要“内部类.成员”或“内部类对象.成员”的方式 
3.  成员内部类可以直接使用外部类的所有成员，包括私有的数据 
4.  当想要在外部类的静态成员部分使用内部类时，可以考虑内部类声明为静态的

```java
内部类举例(1)
class Outer {
	private int s;
	
    public class Inner {
		public void mb() {
			s = 100;
			System.out.println("在内部类Inner中s=" + s);
		}
	}
    
	public void ma() {
		Inner i = new Inner();
		i.mb();
	}
    
}

public class InnerTest {
	public static void main(String args[]) {
		Outer o = new Outer();
		o.ma();
	}
}

```

```java
内部类举例 (2)
public class Outer {
	private int s = 111;
    
	public class Inner {
		private int s = 222;
        
		public void mb(int s) {
			System.out.println(s); // 局部变量s
			System.out.println(this.s); // 内部类对象的属性s
			System.out.println(Outer.this.s); // 外部类对象属性s
		}
        
	}
    
public static void main(String args[]) {
	Outer a = new Outer();
	Outer.Inner b = a.new Inner();
	b.mb(333);
	}
}
```

#### 7.1.3 局部内部类

+  只能在声明它的**方法**或**代码块**中使用，而且是先声明后使用。除此之外的任何地方 都不能使用该类
+  但是它的对象可以通过外部方法的返回值返回使用，返回值类型只能是局部  内部类 的父类或父接口类型

**局部内类的特点**

+ 内部类仍然是一个独立的类，在编译之后内部类会被编译成独立的.class文件，但 是前面冠以外部类的类名和$符号，以及数字编号。 
+ 只能在声明它的方法或代码块中使用，而且是**先声明后使用**。除此之外的**任何地方都不能使用该类**。 
+ 局部内部类可以使用外部类的成员，包括私有的。 
+ 局部内部类**可以使用外部方法的局部变量**，但是必须是**final**的。由局部内部类和局 部变量的声明周期不同所致。 
+ 局部内部类和局部变量地位类似，**不能使用public,protected,缺省,private** 
+ 局部内部类**不能使用static修饰**，因此也不能包含静态成员

### 7.2 匿名类

+ 匿名内部类不能定义任何静态成员、方法和类，只能创建匿名内部类的一 个实例。一个匿名内部类一定是在new的后面，用其隐含实现一个接口或 实现一个类。 

+ 格式： 

  ```java
  new 父类构造器（实参列表）|实现接口(){ 
      //匿名内部类的类体部分
  } 
  ```

+ 匿名内部类的特点 

  + 匿名内部类必须继承父类或实现接口 
  +  匿名内部类只能有一个对象 
  + 匿名内部类对象只能使用多态形式引用

## 第8章 常用实用类

### 8.1 String类

#### 8.1.1 String类的概述

+ String类：代表字符串。Java 程序中的所有字符串字面值（如 "abc" ）都作 为此类的实例实现。 
+ String是一个final类，代表不可变的字符序列。 
+ 字符串是常量，用双引号引起来表示。它们的值在创建之后不能更改。 
+ String对象的字符内容是存储在一个字符数组value[]中的。

![image-20211123142256942](C:\Users\13980\OneDrive - iweii\桌面\笔记\Java复习\img\image-20211123142256942.png)

#### 8.1.2 String的陷阱

![image-20211123142647172](C:\Users\13980\OneDrive - iweii\桌面\笔记\Java复习\img\image-20211123142647172.png)

#### 8.1.3 String类的常用方法

![image-20211123142749068](C:\Users\13980\OneDrive - iweii\桌面\笔记\Java复习\img\image-20211123142749068.png)

![image-20211123142803578](C:\Users\13980\OneDrive - iweii\桌面\笔记\Java复习\img\image-20211123142803578.png)

![image-20211123142819797](C:\Users\13980\OneDrive - iweii\桌面\笔记\Java复习\img\image-20211123142819797.png)

#### 8.1.4 StringBuffer类和StringBuilder类

![image-20211123143156057](C:\Users\13980\OneDrive - iweii\桌面\笔记\Java复习\img\image-20211123143156057.png)

##### 8.1.4.1 StringBuffer类

+ java.lang.StringBuffer代表可变的字符序列，JDK1.0中声明，可以对字符 串内容进行增删，此时不会产生新的对象。 
+ 很多方法与String相同。 
+  作为参数传递时，方法内部可以改变值。

![image-20211123143358288](.\img\image-20211123143358288.png)



