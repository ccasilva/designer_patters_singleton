import 'package:designer_patters_singleton/database/connection.dart';
import 'package:designer_patters_singleton/singleton/singleton_factory.dart';
import 'package:designer_patters_singleton/singleton/singleton_raiz.dart';
import 'package:flutter/material.dart';

class SingletonPattern extends StatefulWidget {
  @override
  _SingletonPatternState createState() => _SingletonPatternState();
}

class _SingletonPatternState extends State<SingletonPattern> {

  List<String> nomes = [];

  @override
  void dispose() {
    Connection.instace.closeConnection();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int i = 0;
    while(i < 10){
      //retorna a mesma instancia e a mesma posição de memoria
      //print('Instacia.${i} => ${SingletonRaiz.instance.id}');
      print('Instacia(Factory).${i} => ${SingletonFactory().id}');
      i++;
    }
    print('###########################################################');
    buscarNomes();
  }

  Future<void> buscarNomes() async{
    var db = await Connection.instace.db;
    var result = await db.rawQuery('select * from teste');
    setState(() {
      nomes = result.map<String>((e) => e['nome']).toList();
    });
    print(nomes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Singleton')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var db = await Connection.instace.db;
          await db.rawInsert('Insert into teste values("Adicionado pelo float")');
          buscarNomes();
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: nomes.length,
        itemBuilder: (_,index) => ListTile(title: Text(nomes[index])),
      ),
    );
  }
}
