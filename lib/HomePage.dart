

import 'package:energy/counter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

 class HomePage extends ConsumerWidget{
   const HomePage({Key? key}): super (key: key);

   @override
   Widget build(BuildContext context, WidgetRef ref){
     /*if you include ref.watch here before creating the
      scaffold anytime you press on the counter it invokes
       a rebuild of the scaffold instead wrap your title with a 
       consumer widget
      */
     return Scaffold(
       appBar: AppBar(
         title: Consumer(
           builder: (context, ref,child){
             final count = ref.watch(counterProvider);
             final text = count == null?  'Press the button': count.toString();
             return Text(text);
           },
           ),
         ),
       body: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch ,
         children: [
           TextButton(onPressed: (){
             // call the increment function
             ref.read(counterProvider.notifier).increment();
             // the above function can also be written as
             // onPressed: ref.read(counterProvider.notifier).increment,
           },
               child: const Text(
                 'Increment counter',
                 style: TextStyle(
                   fontSize: 30,
                   fontStyle: FontStyle.normal
                 ),
               ))
         ],
       ),
     );
   }
 }

