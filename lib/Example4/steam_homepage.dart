

import 'package:energy/Example4/stream_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StreamHomePage extends ConsumerWidget{
  const StreamHomePage({Key? key}): super (key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref){
    final names = ref.watch(namesProvider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
              'Stream Provider'
          ),
        ),
        body: names.when(data:(names){
          return ListView.builder(
          itemCount: names.length,
          itemBuilder:(context,index){
            return ListTile(
              title: Text(
                names.elementAt(index),
              ),
            );
          },
          );
        },
            error:(error, stackTrace)=>
            const Text('Reached the end of the list'),
            loading: () =>
        const Center(
          child: CircularProgressIndicator(),
        )),
      ),
    );
  }
}