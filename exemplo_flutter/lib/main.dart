import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // EN: This widget is the root of your application.
  // PT: Este widget é a raiz do seu aplicativo.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // PT: Este é o tema da sua aplicação.
        // EN: This is the theme of your application.
        //
        // PT: Tente rodar sua aplicação com "flutter run". Você verá o
        // o aplicativo tem uma barra de ferramentas azul. Então, sem sair do aplicativo, tente
        // alterando o primarySwatch abaixo para Colors.green e invocando
        // "hot reload" (pressione "r" no console onde você executou "flutter run",
        // ou simplesmente salve suas alterações em "hot reload" em um Flutter IDE).
        // Observe que o contador não voltou a zero; a aplicação
        // não é reiniciado.
        // EN: Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green
      ),
      home: const MyHomePage(title: 'Aplicação de exemplo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // EN: This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  // PT: Este widget é a página inicial do seu aplicativo. É stateful, ou seja,
  // que possui um objeto State (definido abaixo) que contém campos que afetam
  // como fica.

  // Esta classe é a configuração para o estado. Ele mantém os valores (neste
  // case o título) fornecido pelo pai (neste caso o widget App) e
  // usado pelo método build do State. Os campos em uma subclasse Widget são
  // sempre marcado como "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // EN: This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

      // PT: Esta chamada para setState diz ao framework Flutter que algo tem
      // alterado neste estado, o que faz com que ele execute novamente o método de compilação abaixo
      // para que a exibição possa refletir os valores atualizados. se nós mudássemos
      // _counter sem chamar setState(), então o método build não seria
      // chamado novamente, e então nada parece acontecer.

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // EN: This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    // PT: Este método é executado novamente toda vez que setState é chamado, por exemplo, como feito
    // pelo método _incrementCounter acima.
    //
    // O framework Flutter foi otimizado para fazer reexecutar métodos de compilação
    // rápido, para que você possa reconstruir qualquer coisa que precise de atualização em vez de
    // do que ter que alterar individualmente as instâncias de widgets.
    return Scaffold(
      appBar: AppBar(
        // EN:Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.

        // PT:Aqui pegamos o valor do objeto MyHomePage que foi criado por
        // o método App.build e use-o para definir o título da nossa barra de aplicativos.
        title: Text(widget.title),
      ),
      body: Center(
        // EN: Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        
        // PT: Center é um widget de layout. Ele pega uma única criança e a posiciona
        // no meio do pai.
        child: Column(
          // EN: Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          // PT:Column também é um widget de layout. É preciso uma lista de crianças e
          // organiza-os verticalmente. Por padrão, ele se dimensiona para caber em seu
          // filhos horizontalmente e tenta ser tão alto quanto seu pai.
          //
          // Invoca "debug painting" (pressione "p" no console, escolha o
          // Ação "Toggle Debug Paint" do Flutter Inspector no Android
          // Studio ou o comando "Toggle Debug Paint" no Visual Studio Code)
          // para ver o wireframe de cada widget.
          //
          // A coluna tem várias propriedades para controlar como ela se dimensiona e
          // como ele posiciona seus filhos. Aqui usamos mainAxisAlignment para
          // centraliza os filhos verticalmente; o eixo principal aqui é a vertical
          // eixo porque as colunas são verticais (o eixo cruzado seria
          //horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Começo do Flutter:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // EN: This trailing comma makes auto-formatting nicer for build methods.
        // Esta vírgula à direita torna a formatação automática mais agradável para métodos de construção. // FloatingActionButton
    );
  }
}
