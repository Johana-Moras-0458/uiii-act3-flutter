import 'package:flutter/material.dart';
import 'details.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _idPelucheController = TextEditingController();
  final _nombreController = TextEditingController();
  final _colorController = TextEditingController();
  final _tamanoController = TextEditingController();
  final _precioController = TextEditingController();
  final _tipoTelaController = TextEditingController();
  final _idProveedorController = TextEditingController();
  final _idSucursalController = TextEditingController();

  @override
  void dispose() {
    _idPelucheController.dispose();
    _nombreController.dispose();
    _colorController.dispose();
    _tamanoController.dispose();
    _precioController.dispose();
    _tipoTelaController.dispose();
    _idProveedorController.dispose();
    _idSucursalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 206, 209, 176),
        title: const Text("TABLA PELUCHES"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            MyTextField(
              myController: _idPelucheController,
              fieldName: "ID Peluche",
              myIcon: Icons.numbers,
              prefixIconColor: const Color.fromARGB(255, 0, 0, 0),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _nombreController,
              fieldName: "Nombre",
              myIcon: Icons.title,
              prefixIconColor: const Color.fromARGB(255, 0, 0, 0),
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _colorController,
              fieldName: "Color",
              myIcon: Icons.color_lens,
              prefixIconColor: const Color.fromARGB(255, 0, 0, 0),
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _tamanoController,
              fieldName: "Tamaño",
              myIcon: Icons.straighten,
              prefixIconColor: const Color.fromARGB(255, 0, 0, 0),
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _precioController,
              fieldName: "Precio",
              myIcon: Icons.attach_money,
              prefixIconColor: const Color.fromARGB(255, 0, 0, 0),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _tipoTelaController,
              fieldName: "Tipo de Tela",
              myIcon: Icons.texture,
              prefixIconColor: const Color.fromARGB(255, 0, 0, 0),
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _idProveedorController,
              fieldName: "ID Proveedor",
              myIcon: Icons.business,
              prefixIconColor: const Color.fromARGB(255, 0, 0, 0),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _idSucursalController,
              fieldName: "ID Sucursal",
              myIcon: Icons.store,
              prefixIconColor: const Color.fromARGB(255, 0, 0, 0),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20.0),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(200, 50),
                side: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Details(
                      idPeluche: _idPelucheController.text,
                      nombre: _nombreController.text,
                      color: _colorController.text,
                      tamano: _tamanoController.text,
                      precio: _precioController.text,
                      tipoTela: _tipoTelaController.text,
                      idProveedor: _idProveedorController.text,
                      idSucursal: _idSucursalController.text,
                    );
                  }),
                );
              },
              child: Text(
                "Guardar Peluche".toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon;
  final Color prefixIconColor;
  final String? hintText;
  final TextInputType? keyboardType;
  final int? maxLines;

  const MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = const Color.fromARGB(255, 2, 2, 2),
    this.hintText,
    this.keyboardType,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: fieldName,
        hintText: hintText,
        prefixIcon: Icon(myIcon, color: prefixIconColor),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        labelStyle: const TextStyle(color: Color.fromARGB(255, 173, 148, 79)),
      ),
    );
  }
}
