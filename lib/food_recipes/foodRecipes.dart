import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../home/BottomNavBar.dart';
import 'api_model.dart';



class food extends StatefulWidget {
  @override
  _foodState createState() => _foodState();
}

class _foodState extends State<food> {
  _foodState();
  List<Model> list = [];

  @override
  void initState() {
    super.initState();
    print("Iam in init");
    getApiData();
  }


   getApiData() async {
    final url = 'https://api.edamam.com/search?q=chicken&app_id=a49f0c78&app_key=05eaa965fec47bb03412c36d06e3f8e7&from=0&to=100&calories=591-722&health=alcohol-free';
    var response = await http.get(Uri.parse(url));
    Map json = jsonDecode(response.body);
    json['hits'].forEach((e) {
      Model model = Model(
          url: e['recipe']['uri'],
          image: e['recipe']['image'],
          source: e['recipe']['source'],
          label: e['recipe']['label']);
      setState(() {
        print("model ${model.label}");
        list.add(model);
      });
    });
  }

  void openLink(String theLink) async {
    await launchUrl(Uri.parse(theLink));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Food Recipe"),
        flexibleSpace:Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient (
              begin: Alignment(1, 1),
              end: Alignment(-1.479, -1.615),
              colors: <Color>[Color(0xff92a3fd), Color(0xff9dceff)],
              stops: <double>[0, 1],
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28)),
                  fillColor: Colors.green.withOpacity(0.04),
                  filled: true),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              // color: Colors.blueAccent,
              width: MediaQuery.of(context).size.width/3,
              height: MediaQuery.of(context).size.height/1.5,
              child: GridView.builder(
                  shrinkWrap: true,
                  primary: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    var x = list[i];
                    return GestureDetector(
                      onTap: (){
                        openLink("https://www.delish.com/cooking/recipe-ideas/a39800628/air-fryer-butternut-squash-recipe/")  ;                    },
                      child: Container(
                        // color:Colors.red ,
                        width: MediaQuery.of(context).size.width/4,
                        height: MediaQuery.of(context).size.height/4,
                        child: Column(
                          children: [
                            Card(
                             color:Colors.purple,
                              child: Image.network(x.image.toString()),
                            )
                          ],
                        ),
                      ),
                    );

                  }),
            )
          ],
        ),
      ),
    );
  }
}
