import 'package:energy/Weather/Home.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


extension OptionalInflixAddition <T extends num> on T?{
  T? operator + ( T? other ){
    final shadow = this;
    if(shadow != null){
      return shadow + (other?? 0) as T;
    }
    else{
      return null;
    }
  }
}


class WeatherHomePage extends ConsumerWidget{
   const WeatherHomePage ({Key? key}): super(key: key);

   @override
  Widget build(BuildContext context, WidgetRef ref){

     final currentWeather = ref.watch(
       weatherProvider,
     );


     return MaterialApp(
       home: Scaffold(
         appBar: AppBar(
           title: const Text(
             'Weather'
           ),
         ),
         body: Column(
           children: [
             currentWeather.when(
                 data:(data) => Text(
                   data,
                   style: const TextStyle(
                     fontSize: 40,
                   ),
                 ),
                 error:(_, __) => const Text('Error'),
                 loading: () => const Padding(padding: EdgeInsets.all(8.0),
                   child: CircularProgressIndicator(),
                 )
             ),
             Expanded(
                 child: ListView.builder(
         itemCount:City.values.length,
         itemBuilder: (context,index){
           final city = City.values[index];
           final isSelected = city == ref.watch(currentCityProvider);
            return ListTile(
              title: Text(
                city.toString(),
              ),
              trailing: isSelected? const Icon(Icons.check): null,
              onTap: () => ref.read
                (currentCityProvider.notifier,).state = city as Null

            );
                     }
                     )
             )
           ],
         ),
       ),
     );
   }
}