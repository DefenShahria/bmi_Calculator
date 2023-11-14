import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primaryColor: Colors.pinkAccent.shade100,
        useMaterial3: true,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(borderSide: BorderSide(color:Colors.black,width: 4 ),borderRadius: BorderRadius.all(Radius.circular(25))),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12,width: 4),borderRadius: BorderRadius.all(Radius.circular(25))),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 4),borderRadius: BorderRadius.all(Radius.circular(25)))
        )
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var kiloTcController = TextEditingController();
  var inchesTcController = TextEditingController();
  var feetTcController = TextEditingController();
  String result = '';
  int _counter = 0;
  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title,style: GoogleFonts.abel(letterSpacing: .5,fontSize: 26,fontWeight: FontWeight.w500),),
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  color: Theme.of(context).colorScheme.inversePrimary
                ),
                child: Center(
                  child: Text(result,style: GoogleFonts.abel(letterSpacing: .5,fontSize: 26,fontWeight: FontWeight.w500,),
              ),
                ),
              ),
              const Text('Weight'),
              TextFormField(
                controller: kiloTcController,
                decoration: const InputDecoration(hintText:'Kilograms', ),
                keyboardType: TextInputType.number,
              ),
              const Text('Height'),
              TextFormField(
                controller: feetTcController,
                decoration: const InputDecoration(hintText: 'Feet'),
                keyboardType: TextInputType.number,
              ),

              const Text('Height'),
              TextFormField(
                controller: inchesTcController,
                decoration: const InputDecoration(hintText: 'Inches'),
                keyboardType: TextInputType.number,
              ),

              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  var wt = kiloTcController.text.toString();
                  var ht = inchesTcController.text.toString();
                  var ft = feetTcController.text.toString();
                  if(wt!= '' && ht!='' && ft !=''){
                    var iwt=int.parse(wt);
                    var inch=int.parse(ht);
                    var ift=int.parse(ft);

                    var tInch= (ift * 12) + inch;
                    var tcm = tInch * 2.54;
                    var tm = tcm/100;
                    var bmi = iwt / (tm *tm );

                    setState(() {
                      result = 'Your BMI : ${bmi.toStringAsFixed(3)}';
                    });
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Enter Value for calculate')));
                  }
                }, child: const Icon(Icons.ac_unit),
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),)
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
