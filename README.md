# Learning flutter: my first app

I am following this udemy course [Flutter & Dart - The Complete Guide [2021 Edition]](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/). This project has the only objective form me to code along the course and to learn. 

## Learning Notes
Here I've been taking the notes while following the course.
### Create flutter project
Command to create a flutter project from the terminal. The project name cannot contain spaces or dashes
```
flutter create name_of_the_project
```

### Material Design
It's a design system created and heavily used by Google. It's highly customizable and works on iOS too. Whils material design is built into Flutter, there are alsom Apple styled widgets in the Flutter framework (Cuppertino widgets).

### Flutter vs alternatives
#### Flutter 
- uses the Dart programming language and the Flutter framework
- You get compiled Native apps. Great performance.
- Does NOT compile to iOS / Android UI Component. Flutter controlls every pixel of the app, so there is a lot of flexibility on the customisation.
- You can build Cross-platform (mobile, web, desktop)
- Developed by Google
#### React Native
- uses JavaScript and the React.js library
- You get partialy compiled native apps. Some parts are not compiled but enclosed in the native app and runs as javascript in the native app.
- Does compile to iOS / Android UI Components. There is less customization options as there are UI components restrictions.
- You can build mostly mobile apps ( + React Native web)
- Developed by Facebook
#### Ionic
- uses only Javascript. No frameworks.
- You get webApp wrapped as a Native app. The advantage is that you can use normal web technologies. A dawnside could be performance.
- Does not compile to native UI Components. You can build it as in web.
- you can build Cross-platform (mobile, web, desktop)
- Developed by Ionic

### IDE: Visual Studio Code
In order to work with Visual Studio and Flutter really well we should install some **extensions**:
- Flutter
- Dart (it's installed automatically when installing the Flutter extension)

#### Folder structure 
- **/.idea**: holds some configuration for Android Studio
- **/.vscode**: holds configurations for the IDE. It's created only when you do changes of the vs code config
- **android**: it holds a complete android project. This is the project which the Flutter SDK will use to merge the flutter code into it. Normally, this is a passive folder, it will be used by flutter but we don't need to work on it.
- **/build**: it is generated and managed by the flutter SDK. We shouldn't change anythng in here. It holds the output of the flutter aplication.
- **/ios**: is the same as android, but for ios projects. It only exists in when you work in mac, because only there you can build ios app.
- **/lib**: here we will add **all the dart files**. Here we will work 99% of the time and here is located all our dart code.
- **/test**: this folder is where we can put the automated tests. Code that runs our code and tests it for bugs or errors.
- **.gitignore**: the file to configure the list of files we want to ignore in the git commits. It's optional, only important when using GIT.
- **.metadata**: it's not a file we will work on. it's automatically generated by flutter.
- **.packages**: generated automatically by the flutter sdk.
- **name_of_project.iml**: we will not work on it. Automatically made by flutter and includes some dependencies.
- **pubspeck.lock**: is a file generated automatically based on the pubspec.yaml file. It holds more details about all the dependencies of the project. It's required by flutter but we won't work on it.
- **pubspeck.yaml**: we will work in this file. Here we **configure the dependencies** of the project, the third party packages we may be using. We will also configure other things like fonts, images. It's written in yaml, a text format where indentation is very important.
- **readme.md**: is the text file where we can include some information of the project. Is the file you are reading right now.

### Emulator
Start Android Studio > Configure > AVD Manager
Create Virtual Device > Phone > Pick one phone > pick last Android stable version image > finish

Run the app:
- From terminal: "flutter run" command
- From the visual studio menú: "debug" > "start Debugging" or "start without debugging"

## widgets basics
- In a flutter project, the depeloper build an UI by adding **widgets**, the building blocks of the user interface. 
    - There are a lot of **built in widgets**, shipped with the flutter framework. There are widgets for everything: for text, for buttons, for images... You can configure all the widgets to change their appereance.
    - We can also make our own **custom widgets**, grouping some others putting them somewhere in the screen.

## Some Dart basics
### Comments
In dart we comment any line by adding two slices (//) before the line of code.

### Functions
Functions are code snippets that you can execute multiple times and any time you want. It is defined by:
#### function name
It has to follow a naming convention which is called camelcase. It should not have spaces between words. The first word whould start with a lowercase character and the other words will start with uppercase letters. **"main"** is a special function name. The main function is the entry point of a dart application, it is the first function to be called automatically by dart when the app starts. 
#### Arguments
The inputs for the function, they are inside de parentesis. The arguments are separed by commas and they can have any name we want. There can be 0 arguments.
- **Positional arguments**: when we call the function, we provide the values of the arguments separated by commas. In the function, they will be asigned to every argument based on the position. The first value to the first argument, the second with the second... and so on.
- **Named arguments**: when we call the function, we write the name of the argument followed by a colon and the value for it. 
####  body
The code executed when the function gets called is limitated between curly braces. For every expression in dart we have to add a semicolon (;) at the end, except for the definition of a function, there we don't use the semicolon.
#### type
Before the function name there is the **type** of the function. Dart is a typed language, which means that everything has a type. So the type indicates what type of data the function returns. When it returns nothing, the return type is void. As dart is a strictly typed programming language, we need to indicate the type of data a function returns and the type of every argument. If we don't indicate the type of data, dart asumes the data is a dynamic type, and the compiler cannot help us to avoid mismatch data type errors. If posible, we should avoid dinamic type, and asign explicit types.
#### call a function 
To call a function we write the function name followed by the parentesis. If the function take arguments, we put them inside the parentesis. If it doesn't, we write the parentesis with nothing inside.
- print() is a predefined dart function that prints somethng on the console.
#### return
Inside the function we can use the special keyword "return" to express what will be the result of that function. The type of the object returning must be the same as the function itself. If it's a void function, it wouldn't return anything.


### Objects
Everything in dart is an object, which is a data structure that has some conflicts logic inside.
There are some special types of predefined objects in dart. Some of them are:
- **String**: a text. It's defined between cuotes ('simple' or "double")
- **Integer**: numbers without decimal places
- **double**: numbers with decimal places.
- **num**: any number: can be double or int

### Variables
We can store data in memory with the help of variables so we can use that data some lines later in the same code. We don't want to store it in a file or in a database, but in the memory of the device.
- before the name of the variable we use the keyword "var", so dart understand we are creating a variable. Or we can insted tell dart the type of data will be stored. If we asign a value when initializing the variable it's considered a better practice to use the "var" kayword.
- We create a variable by giving it any name we want. We follow the same naming convention as for naming functions.
- We asign a value to that with a equal sign. We also can reuse a variable by reasigning another value to the same variable, so it will be overwritten.

### Classes
We write classes to define objects in dart. Structure of a class:
- keyword "class"
- class name: should start with UpperCase character
- class body: inside curly braces
    - a variable inside a class are called **property**
    - a function inside a class are called **methods**
Then, we instantiate the class to create an object based on that class. We can access the data inside an object (for example, the instance of a class), by using a dot (.) followed by a property name.

```dart
// a class
class Person {
    String name = 'Max';
    int age = 30;
}
//a function that returns a double
double addNumbers(double num1, double, num2) {
    return num1 + num2;
}
// the main function
void main() {
    //p1 is an instance of the Person class
    var p1 = Person();
    var p2 = Person();
    p2.name = 'Eloi';
    double firstResult;
    firstResult = addNumbers(1,1);
    print(firstResult + 1); //it prints "3"
    print(p1.name); //it prints "Max"
    print(p2.name); //it prints "Eloi"
}
```
#### Short functions =>
In functions with only one expression in the body, we can get rid of the curly fraces and instead use the "=>". The return of this expression will automatically be returned (if it returns something)
```dart
void main(){
    print(hello);
}
// is the same as:
void main() => print(hello);
```
#### Passing a pointer to a function
When we use a widget that takes a function as a parameter, we should provide a pointer to that function, not the function itself. So we should provide the name of the function without parentesis. Becouse if we provide the parentesis, we'll be telling flutter that the value of the parameter will be the result of the function, not the function itself.
```dart
onPressed: answerQuestion(), // WRONG! in the build method flutter will execute the function, it won't wait for the user to press the button.
onPressed: answerQuestion, // CORRECT. The function will be executed with the onPressed event.
```
#### Anonymous functions
When we have a function that you only need in one place and we are **not calling it from anywhere else**, we can use an anonymous function. It's like a normal (named) function but without the name. 
We can use the curly braces or the arrow:
```dart
onPressed: () => print('hola')) // short form, for only one expression function
onPressed: () {
    // long form, for more than one expressions.
    print('hola');
}), 
```
For both examples, it's only the definition of a function, so it's not executed in the build method but it's executed in the onPressed event, so it's great for having it inside the widget arguments.

### The widget class
A widget is a special type of object in flutter. To create a widget, we need to create a class based on special flutter class: StatelessWidget().
To do so, we need to import a file from the flutter package called 'material.dart' and then we define the widget using the keywork "extends" + "StatelessWidget" or "StatefulWidget". We also have to implement a special method (function) inside the class: the **build()** method. This method is called by flutter and takes an argument called "context" of type BuildContext, and it is provided by flutter. build() returns a Widget (which is also a class provided by the material.dart)
Everything that belongs to a widget should go into the same class, so that the widget is a standalone unit. We can add functions to a widget class, we call it methods, but it's still a function.

```dart
import 'package:flutter/material.dart';
void main() {
    //runApp is a special function provided by material.dart. It construct the widget and calls the build() method.
    runApp(MyApp());
}
class MyApp extends StatelessWidget {
    Widget build(BuildContext context) {
        return MaterialApp(home: Text('hello world'),);//a named argument called 'home'
    }
}
```

### The Constructors
A constructor is a function inside a class, so, a method that is different of other methods because it is executed once when we instantiate an object based on that class. 
We add a constructor by **repeating the name of the class**, the parentesis for arguments and body between curly braces. When inside the constructor, we can use the keyword "this" to reffer to the class level
```dart
class Person {
    String name;
    int age;
    // the constructor
    Person(String inputName, int age){
        name = inputName; // we can use a different name for the attribute name
        this.age = age; // or we can use (this. + the property name) to refer to the class property
    }
}
void main(){
    //when creating the object based on the Person class, we pass the arguments to the constructor.
    p1 = Person('Eloi', 29);
}
```
We could also use **named arguments**. To do so, we wrap all the arguments in the constructor with curly braces. Then, all theese **arguments will be optional**.
Now, to call the constructor we'll write the argument name followed by a colon and the value. This concept of named arguments is also available for normal functions, not only constructors.
We can use the @required annotation to ensure an argument is always required. If we don't provide it, the compiler will yield us.
```dart
class Person {
    String name;
    int age;
    // with named arguments we can provide default values with the = sign. In case this is not provided, the default value will be used.
    Person({@required String inputName, int age = 29 }){
        name = inputName; 
        this.age = age;
    }
}
void main(){
    //when using named arguments, we can change the order.
    p1 = Person(age: 29, inputName: 'Eloi');
}
```
There is a **shortcut** for getting the data as arguments and assigning it to variables in the class that allow us to get rid of the constructor body. To use it, we have to use the same name to arguments and class variables and target "this.+argumentName".
```dart
class Person {
    String name;
    int age;
    // In this short constructor we are asigning the given values recived as arguments to the class variables. The names have to match
    Person({this.name, this.age});
}
void main(){
    p1 = Person(age: 29, name: 'Eloi');
}
```

### Scaffold
Is a widget available thanks to having imported material.dart. It has the job of creating a base page designing, coloring and structure for the app.
It takes some named arguments
- appBar: an AppBar() widget
- body: here we will all the widget tree of the page. It accepts only one widget, so we need to pass a widget with a children parameter (not child but children), for example the Column() widget, that takes a list of widgets in the children parameter.

> Tip: the *flutter extension* will autoformat our code in a very readable way if we add a comma after closing parentesis.

### Different types of widgets
- There are **Visible** widgets, for Output & Input. For example the button, text, card... that are drown onto the screen and the user can see them.
- There are **Invisible** widgets that help us with Layout & Control for the structure of our app. For example Row, Column, ListView... 
There is the Contaner() widget, that by default is invisible but you can give some style and it could become visible.

### Lists
Lists is a type of data that consists on a group of items. In other languages are called **arrays**. It is defined in squared brackets and it's normally used to group related data. 
```dart
// This is a list of Strings. We use the "\" character to scape the next character.
var names = ['Eloi', 'Marti', 'Gemma'];
```
To access an element in the list, we can use the builtin .elementAt(index) method or just indicate the index between []. IMPORTANT: The lists **start at index 0**.
```dart
    questions.elementAt(0); // using the List.elementAt() method
    questions[0]; // using the short form
```
To find how many items are in a list we use .lenght
```dart
    print(questions.lenght); //prints 2
```
Dart also offers **many methods** (functions that belong to an object) on the List object (like every other value in Dart, lists are an object).
```dart
questions.add('Celeste'); // this adds 'Celeste' as a new element to the end of the list 
questions.remove('Marti'); // this removes 'Marti' from the list, all other items would move and fill the gap
```
[More info about Lists](https://dart.dev/guides/language/language-tour#lists)
### The Null value
"null" is a value that means **nothing**







