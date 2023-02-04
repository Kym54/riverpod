import 'package:hooks_riverpod/hooks_riverpod.dart';

const names =[
  'Samuel',
  'Ian',
  'Joseph',
  'Alice',
  'Harriet',
  'Irene',
  'Larry',
  'Grace',
  'Kincaid',
  'Ginny',
];

// create a streamprovider

final tickerProvider = StreamProvider((ref) =>
Stream.periodic(const Duration(seconds: 1),
    (i)=>i+1
),
);


final namesProvider = StreamProvider((ref)=>
ref.watch(tickerProvider.stream).map((count) =>
names.getRange(
    0,
    count,
    ),
   ),
);

