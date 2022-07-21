void main (){
  boasvindas();
  double resSimulador = simulador(22.22, 22.22);
  print(resSimulador);

}

void boasvindas(){
  String nome = 'jr';
  print('bem vindo ' + nome);
}

double simulador (double valor1, double valor2){
  double res = valor1 + valor2;
  return res;
}