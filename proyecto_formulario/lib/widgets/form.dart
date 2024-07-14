import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final GlobalKey<FormState> _formularioEstado = GlobalKey();
  String message = ''; // Almacena el mensaje para mostrar

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold para la estructura general de la aplicación
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
      body: Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formularioEstado,
        child: Column(
        children: [

          Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)
          ),
          child: TextFormField(
            validator: (value){
             if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa tu nombre';
                  }
                  return null;
                },
            decoration: InputDecoration(
              hintText: "Nombre",
              border: InputBorder.none),
          )),

          const SizedBox(height: 10.0),
          Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)
          ),
          child: TextFormField(
            validator: (value){
              if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa tu correo electrónico';
                  }
                  if (!RegExp(r"[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")
                      .hasMatch(value)) {
                    return 'Correo electrónico no válido';
                  }
                  return null;
                },
            decoration: InputDecoration(
              hintText: "Correo electronico",
              border: InputBorder.none),
          )),

          const SizedBox(height: 10.0),
          Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)
          ),
          child: TextFormField(
            obscureText: true,
            validator: (value){
              if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa tu contraseña';
                  }
                  if (value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },
            decoration: InputDecoration(
              hintText: "Contraseña",
              border: InputBorder.none),
          )),

          Expanded(child: Container()),
           // Gesture Detector para el boton y otro elementos de interaccion
              GestureDetector(
                onTap: () {
                  if (_formularioEstado.currentState!.validate()) {
                    setState(() {
                      message = '¡Formulario enviado con éxito!'; // Actualizacion del mensaje
                    });
                  } else {
                    setState(() {
                      message = 'Hay errores en el formulario.'; // Actualizacion del mensaje
                    });
                  }
                },
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: null, // Remueve onPressed del GestureDetector
                    child: const Text("Enviar"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.greenAccent), // Cambia el color
                    ),
                  ),
                ),
              ),

              // Muestra el mensaje
              Text(message, style: const TextStyle(fontSize: 16.0)),
            ],
          ),
        ),
      ),
    );
  }
}