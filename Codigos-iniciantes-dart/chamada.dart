import 'dart:io';
void main() {
   
   print ('Por favor, Digite seu nome');
   var nome = stdin.readLineSync(); //stdin.readLineSync é de uma bibilioteca chamada dart:io 
                                    //Ela faz com que o usuario consiga escrever algo, e deixar salvo, no console.
   int idade = 40;
  
  print ('tudo bem? $nome, aparentemente você tem $idade anos');
}