import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/sample_provider.dart';

class SamplePage extends StatelessWidget {
  SamplePage({super.key, required this.title});

  final String title;

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  final ValueNotifier<bool> _toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final counterProvider =
        Provider.of<SampleProvider>(context, listen: false);
    if (kDebugMode) {
      print('build');
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ValueListenableBuilder(valueListenable: _toggle, builder: (context, value, child){
              return Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    suffix: InkWell(
                      onTap: (){
                        _toggle.value = !_toggle.value;
                      },
                      child: Icon(_toggle.value ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                  obscureText: _toggle.value,
                ),
              );
            }),
            Consumer<SampleProvider>(builder: (context, value, child) {
              return Text(value.count.toString());
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterProvider.setValue();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
