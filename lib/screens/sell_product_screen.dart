import 'package:flutter/material.dart';

class SellProductScreen extends StatefulWidget {
  const SellProductScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SellProductScreenState createState() => _SellProductScreenState();
}

class _SellProductScreenState extends State<SellProductScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  double _price = 0.0;
  String _description = '';

  void _submitProduct() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Aquí implementarás la lógica para guardar el producto
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Producto $_name con precio $_price y descripción $_description guardado')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vender Producto'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre del Producto'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un nombre';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Precio'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un precio';
                  }
                  return null;
                },
                onSaved: (value) => _price = double.parse(value!),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descripción'),
                maxLines: 3,
                onSaved: (value) => _description = value ?? '',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitProduct,
                child: Text('Guardar Producto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}