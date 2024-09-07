import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Your BMI'),
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
 

var wtController= TextEditingController();
var ftController=TextEditingController();
var inController= TextEditingController();

var result="";

var bgColor;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w600,
                ),),
                 SizedBox(height: 21),
            
              TextField(
                controller: wtController,
                decoration: InputDecoration(
                  label: Text("Enter Your Weight in KGS"),
                  prefixIcon: Icon(Icons.line_weight),
                ),
              keyboardType: TextInputType.number,
              ),
               SizedBox(height: 11),
            
              TextField(
                controller: ftController,
                decoration: InputDecoration(
                  label: Text("Enter Your Height in Ft"),
                  prefixIcon: Icon(Icons.height),
                ),
              keyboardType: TextInputType.number,
              ),
            
            SizedBox(height: 11),
            
              TextField(
                controller: inController,
                decoration: InputDecoration(
                  label: Text("Enter Your Height in INCH"),
                  prefixIcon: Icon(Icons.height),
                ),
              keyboardType: TextInputType.number,
              ),
            
              SizedBox(height: 21),
              ElevatedButton(onPressed: (){
        
                var wt=wtController.text.toString();
                var ft=ftController.text.toString();
                var inch=inController.text.toString();
        
                if(wt!="" && ft!="" && inch!=""){
        
                var iwt = int.parse(wt);
                var ift= int.parse(ft);
                var iinch= int.parse(inch);
        
                var tInch=(ift*12)+ iinch;
                var tCm=tInch*2.54;
        
                var tM= tCm/100;
        
                var bmi= iwt/(tM*tM);


                var msg="";
                if(bmi>40){
                  msg="You're at high risk.\nPlease go to a doctor";
                  bgColor=Colors.orange.shade800;}
                else if(bmi>35){
                  msg="Please Start a balance diet";
                  bgColor=Colors.orange.shade400;}

                  
                  else if(bmi>25){
                  msg="You're Overweight";
                  bgColor=Colors.orange.shade200;

                }else if(bmi<18){
                  msg= "you're Underweight";
                  bgColor=Colors.red.shade200;
                      

                } else{
                  msg="You're Healthy";
                  bgColor=Colors.green.shade200;
                }
        
                setState(() {
                  result= "$msg \n Your BMI is: ${bmi.toStringAsFixed(3)}";
                });
        
                }
        
            else {
              setState(() {
                result="Please fill all the required blanks";
              });
        
            }
        
        
              }, child: Text('Calculate')),
              
              SizedBox(height: 11),
              Text(result, style:TextStyle(fontSize: 19)),
        
              ],
            ),
          ),
        ),
      )
      );
  
  }
}
