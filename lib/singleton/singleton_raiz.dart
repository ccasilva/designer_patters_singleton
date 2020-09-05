import 'dart:math';

class SingletonRaiz{

  //Todo:(2) O desenvolvedor precisa da instacia dessa classe. devemos implementar o Singleton de verdade.
  //Todo:Ou seja um unica instancia para essa classe
  //Todo:

  static SingletonRaiz _instance; // Privado pq nao quero que ele tenha acesso de lugar nenhum
  int id = Random().nextInt(100);

  /*
    Todo: (1)Primeira coisa que devo bloquear para o desenvolvedor é a instancia do construtor
    Todo: Como deixar o construtor privado:
    Todo: Ex1: SingletonRaiz._()
    Todo: Ex2: SingletonRaiz._internal()
  */
  SingletonRaiz._();

  static get instance{
    // ??=  ===> Se ele for nulo, executa o SingletonRaiz._()
    _instance ??= SingletonRaiz._();
    return _instance;
  }

}