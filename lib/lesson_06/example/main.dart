import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage3(),
    );
  }
}

class MyHomePage3 extends StatefulWidget {
  const MyHomePage3({super.key});

  @override
  State<MyHomePage3> createState() => _MyHomePage3State();
}

class _MyHomePage3State extends State<MyHomePage3> {
  String boxInfoTitle = 'Greeng';

  final _phoneController = TextEditingController(text: 'thanhcong@gmail.com');
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('PARENT REBUILDDDD');
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 8,
              children: [
                //final _passwordController = TextEditingController();
                //final _formKey = GlobalKey<FormState>();
                //password chua:
                //Do dai toi thieu 8, toi da la 20
                //Chua it nhat 1 ki tu thuong
                //Chua it nhat 1 ki tu in hoa
                //Chua it nhat 1 ki tu so
                //Chua it nhat 1 ki tu dac biet
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) {
                    if(value == null || value.trim().isEmpty || value == ''){
                      return 'Vui Lòng không để trống';
                    }
                    if(value.length < 8){
                      return
                      '''Do dai toi thieu 8, toi da la 20
Chua it nhat 1 ki tu thuong
Chua it nhat 1 ki tu in hoa
Chua it nhat 1 ki tu so
Chua it nhat 1 ki tu dac biet''';
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        print('FORM is OK CAN LOGIN');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('FORM is OK CAN LOGIN'),
                          backgroundColor: Colors.green,
                        ));
                      }
                    },
                    child: Text('LOGIN')),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            boxInfoTitle = 'Yellow';
          });
        },
      ),
    );
  }
}

class BoxInfo extends StatefulWidget {
  const BoxInfo({super.key, required this.title});

  final String title;

  @override
  State<BoxInfo> createState() => _BoxInfoState();
}

class _BoxInfoState extends State<BoxInfo> {
  int _counter = 0;
  double size = 100;
  Color color = Colors.black;

  @override
  void initState() {
    color = widget.title.contains('g') ? Colors.green : Colors.yellow;
    print('initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant BoxInfo oldWidget) {
    color = widget.title.contains('g') ? Colors.green : Colors.yellow;
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  void deactivate() {
    print('deactivate');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    print('buildDDDDDDDDDDD - widgetTITLE: ${widget.title}');
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                // print('ajshgjasghk: ${_counter} - $size');
                _counter++;
                size = size + 100;

                setState(() {});
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            // HomePage2(),
            Container(
              height: size,
              width: size,
              color: color,
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _MyHomePageState2 extends State<BoxInfo> {
  int _counter = 0;
  double size = 100;

  @override
  Widget build(BuildContext context) {
    print('REBUILDDDDDD 1111');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HomePage2(),
              Container(
                height: size,
                width: size,
                color: Colors.red,
              ),
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // print('ajshgjasghk: ${_counter} - $size');
          _counter++;
          size = size + 100;

          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    // print('REBUILD 222222');
    return Container(
        height: 100,
        width: 100,
        color: Colors.green,
        child: Text(
          'BOx of HomePage2',
        ));
  }
}
