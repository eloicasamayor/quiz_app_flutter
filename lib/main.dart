import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  //instanciamos un objeto basado en una clase añadiendo los paréntesis.
  //ejecutamos MyApp como una función añadiendo los paréntesis
  runApp(MyApp());
}

// también podemos expresarlo en una forma mas simple:
// void main() => runApp(MyApp());
// Solo se puede usar con funciones que solo tienen una expresión (1 línea de código)
// En este caso podemos omitir las llaves y poner una flecha con el "=>"

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answer': [
        {'text': 'black', 'score': 10},
        {'text': 'green', 'score': 5},
        {'text': 'blue', 'score': 6},
        {'text': 'yellow', 'score': 0},
      ]
    },
    {
      'questionText': 'What\'s your favorite aniaml?',
      'answer': [
        {'text': 'rabbit', 'score': 4},
        {'text': 'elefant', 'score': 7},
        {'text': 'lion', 'score': 8},
        {'text': 'dog', 'score': 0}
      ]
    },
    {
      'questionText': 'What\'s your favorite fruit?',
      'answer': [
        {'text': 'banana', 'score': 0},
        {'text': 'apple', 'score': 2},
        {'text': 'mango', 'score': 5},
        {'text': 'kiwi', 'score': 8},
      ]
    },
  ];
  var _questionIndex =
      0; //podríamos usar 'int' en vez de 'var', pero como la hemos inicializado en =0, flutter ya sabe que es un int, por lo cual se considera usar "var" una mejor práctica
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      //tenemos que resetear estas variables dentro del setState() para que flutter entienda que cambió el State, y él se encargará de re-renderizar la app.
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    //es lo mismo que poner _totalScore = _totalScore + score
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }

    print(_questionIndex);
  }

  //Las variable dentro de una clase se le llaman "property" (propiedad)
  //functions inside a class are called methods.
  @override //es un decorator, no es obligatorio usarlo. Sirve para indicar que deliberadamente estamos sobreescribiendo el método buid, que existe en la función StatelessWidget.
  //De hecho, no tenemos la opción de no sobreescribirlo, estamos obligados a crear llamar al método build, pero con el "@override" dejamos claro que no fue un error sobreescribir el método.
  Widget build(BuildContext context) {
    //creamos un 'map' -> una lista de pares de valores (key + value)

    // - positional arguments: each value passed ends up depending on the position
    // - named arguments: no data in order, target every argument by its name
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions)
              : Result(_totalScore, _resetQuiz)),
      //MaterialApp y Text no son funciones, sino clases. Y aún así, les pasamos información
      //el 'Constructor', es una función especial dentro de una clase (por lo tanto, un método) que se ejecuta solamente una vez cuando creamos un nuevo objeto basado en esa clase, o sea, cuando llamamos a una clase y le pasamos valores
      //se crea un constructor repitiendo el nombre de la clase, paréntesis y llaves
      //dentro del paréntesis se aceptan los argumentos. en este caso se pueden llamar igual que las variables de la clase, flutter los considerará diferentes variables aunque se llamen igual.
      //en caso que les llames igual, usando la palabra this.<nombreVariable>, flutter sabrá que nos referimos a la variable de la clase, y si la usamos sin el 'this.', nos referiremos a la variable de dentro del constructor.
      //si queremos usar parámetros nombrados, éstos estarán dentro del paréntesis y tambien de llaves. De este modo, los parámetros serán opcionales y a la hora de llamar al constructor, mandaremos los parámetros poniendo <nombreParámetro> + : + <valorParámetro>
      //esto es especialmente útil para los constructors que llevan bastates parámetros, para no tener que recordar el orden (se pueden llamar con diferente orden)
      //Como son opcionales, en el constructor podemos poner un valor por defecto (por ejemplo "int age = 30")
      //En caso de que queremos que sean parámetros obligatorios, debemos agregar "@required" antes del parámetro (por ejemplo "@required String inputName")
      //
      //hay una forma simplificada de tratar con parámetros de constructors y variables de la clase:
      //
      //class Person{
      //  String name;
      //  int age;
      //
      //  Person({this.name, this.age = 30})
      //}
      //cuando le damos el mismo nombre a los parámetros y a las variables de la clase, se puede usar esta estructura.
      //
      // - la funcion main se ejecuta automáticamente cuando se abre la aplicación
      // - en ella, llamamos a RunApp(), una función proveida por flutter en e material.dart package.
      // - podemos importar el material.dart package porque está agregado en el pubspec.yaml como dependencia.
      // - RunApp llama al método build de la clase MyApp
      // - Todos los widgets tienen que extender StatelessWidget o StetefullWidget y tener el método build.
      // - Nosotros no llamamos al método build, sino que es flutter es el que se encarga de llamar el método build cada vez que tiene que dibujar el widget en la pantala.
      // - El método build necesita el argumento context, que es un objeto de tipo BuildContext, pero como es flutter quien llama a este método, és el que provee el context, nosotros solo tenemos que aceptar el context que flutter proveerá.
      // - Todos los widgets son classes de dart, y cada uno tiene su método build.
      // - Poniendo paréntesis después del nombre de la clase, estamos instanciando un objeto de esa clase.
      //
      //SCAFFOLD: un widget de material.dart. Crea un diseño base de la app page.
      //
      //Ctrl + Espacio: para que Visual Code nos de tips de argumentos del widget.
      //
      //Diferentes tipos de widgets:
      //- Output & Input (VISIBLES): RaisedButton(), Text(), Card()...
      //- Layout & Control (INVISIBLES): Row(), Column(), ListView()...
      // Container: puede pertenecer a los dos grupos: por defecto es invisible pero puedes agregarle estilos y hacerlo visible.
      //
      //
      // ---> Column Widget: "Column(children: <Widget>[],),"
      // Los claudators indican que este widget espera una lista de widgets en el argumento "children"
      // La palabra <Widget> es para decirle a flutter de qué es la lista. En este caso, una lista de widgets. No hace falta ponerlo.
      //
      // los objetos, los widgets, o sea, las clases, deben poder trabajar 'standalone'. O sea, todo lo que pertenece a un widget debe estar dentro de la misma clase. Toda la información debe pertenecer a la misma clase.
      //
      //para la funcion esperada por el argumento 'onPressed':
      // si pusiéramos tal cual la llamada a la función answerQuestion(), le estaríamos pasando lo que devuelva la función (en este caso nada, porque es una función tipo void), no el pointer a esa función.
      // para ello, debemos pasarle el nombre de la función, sin los paréntesis. Para que flutter no ejecute la función mientras construye el widget (método build), y solo se quede el pointer a esa función, para que se ejecute solo cuando se presione el boton (onPressed: )
      //
      // otra opción es usar una función "anónima", en vez de una función "con nombre". Las funciones anónimas se usan cuando ese código solo lo tenemos que usar en este caso y no queremos llamar a esta función en ninguna otra parte.
      // - Cuando la función es de una sola línea, utilizamos los paréntesis, seguido de la flecha y seguida de la línea de código: () => print("hola");
      // - Cuando la función anónima ocupa mas de una línea de código, se usan las llaves en vez de la flecha:
      // () {
      //    ... algun codigo por aqui;
      //    print("hola");
      // }
      // Estas dos formas de función anónima no ejecutan la función cuando se llama el método build(), a menos que pongamos otros paréntesis () al final
      //
      // Qué es "STATE" ?
      //  -> En general, State es la infoamción usada por el widget o la aplicación
      //    - App State: usuario autenticado, tareas cargadas...
      //    - Widget State: current user Input, animación de "cargando" activo
      // -> 2 tipos de widgets según si tienen o no State:
      //   - StateLessWidget: puede recibir información como input externo, y flutter hará rebuild del widget cada vez que cambie esa información de input.
      //   - StatefulWidget: puede recibir infoamación como input externo, y también puede tener un State interno. Flutter hará rebuild cuando cambie ese State interno.
      //     Un widget de tipo StatefulWidget se compone de 2 clases:
      //        -- class MyApp extends StatefulWidget{} -> cuando la información externa cambia, ésta clase será recreada
      //        -- class MyAppState extends State {} -> el esto es persistente. Está asociado al widget, pero no se recrea. Y esto es importante a la hora de guardar la información del State. La clase State no se resetea con cada rebuild.
      //     Para relacionar la clase widget con la clase State, tenemos que hacer 2 cosas:
      //        -- La clase State extens State + <nombreDeLaClaseWidget>. Esto le dice a Flutter que este estado pertenece a la clase que hemos apuntado entre <>
      //        -- Dentro de la clase Widget tenemos que añadir un nuevo método "createState()" que no requiere ningún argumento y que devuelve un objeto State que está conectado a un StatefulWidget:
      //             State<StatefulWidget> createState() {
      //                return MyAppState();
      //             }
      //
      // (24)
      // Aún usando el StatefulWidget, tenemos que decirle a Flutter que vamos a cambiar el State, para que en cuanto cambie, flutter haga rebuild del widget
      //     Para hacer esto, usaremos la función "setState" y dentro de ella pondremos la lógica donde cambia la información que hará necesario el rebuild.
      //     La función setState requiere como argumento una función (típicamente, una función anónima)
      //     Dentro de esta función anónima, que es un argumento de la función setState, ubicamos la lógica en donde cambia la información del State.
      //
      // (25)
      // setState() es una función que fuerza Flutter a re-renderizar la UI. Pero no tada la UI de la app. De hecho, lo que hace es llamar al método build() del widget al cual pertenece
      // aun así, flutter ni siquiera re-renderiza todo el widget, sino que internamente tiene sus mecanismos para re-renderizar solamente lo que ha cambiado debido al cambio en State.
      //
      // ---
      // (26)
      // Por defecto, las clases en Dart son PÚBLICAS.
      // Para convertir una clase en *PRIVADA*, es decir, para informar Flutter que la clase MyAppState solo debe ser usada desde dentro de ese archivo, añadiremos una barra baja _ adelante del nombre: _MyAppState.
      // Esto no es una cosa cosmética, sino parte de la sintaxis de Dart.
      // Lo mismo aplica para las variables y los métodos: para convertirlas en privadas añadiremos la barra baja delante del nombre.
      //
      // (31)
      // "Lifting the State up" -> se maneja el State en el widget que hay en común, en este caso, se maneja en MyApp (en main.dart), que es el widget que tienen en común answer y question.
      // El State está en el común denominador, en el lugar compartido donde están los widgets que necesitan este State. En este caso, es el padre directo.
      //
      // (34) Tipos de variables constantes:
      // > FINAL: el valor no cambia desde que se inicializa. Se le puede asignar un valor al inicio del programa, pero después ya nunca cambia.
      //     en runtime el valor se bloquea, pero en el momento de escribir el código, y de compilar, el valor es incierto. "Runtime Constant Value"
      // > CONSTANTE: "Compile Time Constant", o sea el valor nunca cambia desde que se compila.
      //     no podemos asignar un nuevo valor a una constante.
      // (Técnicamente, cuando definimos una variable, Dart guarda la dirección de ese objeto en memoria, no el objeto en sí.)
      // Podemos hacer constante la variable, con lo cual no se podrá asignar un nuevo valor a esa variable.
      // O podemos hacer constante solamente el valor de la variable, con lo cual no se podrá alterar ese valor pero sí se podrá reescribir la variable. Por ejemplo, si se trata de una lista no podremos añadir un item con .add(), pero si podremos asignar una nueva lista.
      //
      // Para crear widgets dependientes de una condición:
      // Expresion condicional ? codigo que se executa if true : codigo que se ejecuta if false,
      //
      // Siempre es recomandado separar el código en diferentes widgets, en diferentes archivos.
    );
  }
}
