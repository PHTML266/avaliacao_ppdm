import 'package:flutter/material.dart';
import 'Menu.dart';
import 'Cadastro.dart';

void main() {
  runApp(LoginScreen());
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          titleTextStyle: TextStyle(color: Colors.white),
          backgroundColor: Color(0xff7d5611),
        ),
        body: LoginBody(),
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  TextEditingController _usernameController =
  TextEditingController(); //criando a variavel de acesso as TextField
  TextEditingController _passwordController =
  TextEditingController(); //criando a variavel de acesso as TextField
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      color: Color(0xffb48535), // Fundo azul
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Login',
              prefixIcon: Icon(Icons.person),
              filled: true,
              fillColor: Color(0xffa4ff98),
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Senha',
              prefixIcon: Icon(Icons.lock),
              filled: true,
              fillColor: Color(0xffa4ff98),
            ),
            obscureText: true,
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // inserir a codificação para Verificar credenciais
              // se eu precisar acessar o oconteudo de uma textfield _usernameController.text
              if (_usernameController.text == '12345' &&
                  _passwordController.text == '12345') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Seja Bem-vindo!')),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Menu()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Algo está errado, verifique o login e senha e tente novamente'),

                  ),
                );
              }
            },
            child: const Text('Entrar'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff218c16), // Cor de fundo do botão
              textStyle: TextStyle(fontSize: 18, color: Colors.white), // Estilo do texto
              padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20), // Espaçamento interno
              minimumSize: Size(100, 0), // Largura mínima do botão
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Borda arredondada
              ),
            ),
          ),
            SizedBox(height: 20.0),
            ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Cadastro()),
              );
            },
            child: const Text('Novo usuário'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff218c16),
              textStyle: TextStyle(fontSize: 18, color: Colors.white),
              padding: EdgeInsets.symmetric(
                horizontal: 20, vertical: 20),
              minimumSize: Size(100, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
            ),
           ),
          ),
        ],
      ),
    );
  }
}
