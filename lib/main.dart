import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/main_bloc/main_bloc.dart';
void main() {
  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => MainBloc())
          ],
          child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, mainState) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Demo'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                TextField(
                  controller: userController,
                  decoration: const InputDecoration(
                    label: Text('username')
                  )
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      label: Text('password')
                  )
                ),
                const SizedBox(height: 8.0),
                Text(
                  _getData(mainState)
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _incrementCounter(context);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  void _incrementCounter(BuildContext context) {
    BlocProvider.of<MainBloc>(context).add(
         MainEventLogin(
             password: passwordController.value.text,
             username: userController.value.text
        )
    );
  }

  String _getData(MainState mainState) {
    if(mainState is MainInitial) {
      return "Chờ người dùng đăng nhập";
    } else if (mainState is MainStateLoginSuccessful) {
      return mainState.message;
    } else if(mainState is MainStateLoginFail) {
      return mainState.error;
    }
    return "Lỗi";
  }
}

