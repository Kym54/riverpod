

import 'package:hooks_riverpod/hooks_riverpod.dart';



enum City{
  nairobi,
  kampala,
  arusha,
  addisababa,
  johannesburg,
  stockholm,
  berlin,
}

typedef WeatherEmoji = String;

Future<WeatherEmoji> getWeather(City city){
  return Future.delayed(
    const Duration(seconds: 1),() =>{
      City.nairobi:'rainy',
    City.kampala:'sunny',
    City.arusha:'cool',
    City.addisababa:'humid',
    City.johannesburg:'snow',
    City.stockholm:'cold',
    City.berlin:'snow',
  }[city]!,
  );
}
// instead of using the above tiresome process it is preferably to use a state provider function
// state provider keeps hold of state meaning it can't be changed from outside

// the below provider listens to changes to the UI
final currentCityProvider = StateProvider(
      (ref) => null,
);
//will listen to change that happens to the sky and provides value that is listened by the currentCityProvider

const unknownWeatherEmoji = 'Not Known';

// UI reads this
final weatherProvider = FutureProvider<WeatherEmoji>((ref){
  final city = ref.watch(currentCityProvider);
  if(city !=null){
    return getWeather(city);
  }else{
    return unknownWeatherEmoji;
  }
},
);

