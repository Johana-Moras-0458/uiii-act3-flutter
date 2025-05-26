import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({
    Key? key,
    required this.idPeluche,
    required this.nombre,
    required this.color,
    required this.tamano,
    required this.precio,
    required this.tipoTela,
    required this.idProveedor,
    required this.idSucursal,
  }) : super(key: key);

  final String idPeluche;
  final String nombre;
  final String color;
  final String tamano;
  final String precio;
  final String tipoTela;
  final String idProveedor;
  final String idSucursal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Detalles del Peluche"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: const  Color.fromARGB(255, 206, 209, 176),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildPelucheCard(
              icon: Icons.toys,
              id: idPeluche,
              nombre: nombre,
              color: color,
              tamano: tamano,
              precio: precio,
              tipoTela: tipoTela,
              idProveedor: idProveedor,
              idSucursal: idSucursal,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPelucheCard({
    required IconData icon,
    required String id,
    required String nombre,
    required String color,
    required String tamano,
    required String precio,
    required String tipoTela,
    required String idProveedor,
    required String idSucursal,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Iconos superior izquierda y derecha
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Icon(Icons.bubble_chart, size: 28, color: Color.fromARGB(255, 7, 7, 7)),

                const Icon(Icons.delete, color: Color.fromARGB(255, 102, 77, 10)),  
              ],
            ),
            const SizedBox(height: 8),
            _buildDetailRow(Icons.numbers, "ID Peluche:", id),
            _buildDetailRow(Icons.title, "Nombre:", nombre),
            _buildDetailRow(Icons.color_lens, "Color:", color),
            _buildDetailRow(Icons.straighten, "Tamaño:", tamano),
            _buildDetailRow(Icons.attach_money, "Precio:", "\$$precio"),
            _buildDetailRow(Icons.texture, "Tipo de Tela:", tipoTela),
            _buildDetailRow(Icons.business, "ID Proveedor:", idProveedor),
            _buildDetailRow(Icons.store, "ID Sucursal:", idSucursal),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, color: const Color.fromARGB(255, 0, 0, 0), size: 20),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 173, 148, 79),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
