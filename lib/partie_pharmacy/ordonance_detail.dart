// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AgrandirImagePage extends StatefulWidget {
  final String imageUrl;

  const AgrandirImagePage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<AgrandirImagePage> createState() => _AgrandirImagePageState();
}

class _AgrandirImagePageState extends State<AgrandirImagePage> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agrandir Image'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            _buildImageWidget(),
            const SizedBox(height: 20),
            _buildButtonRow(),
            const SizedBox(height: 20),
            _buildTextField(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(20),
        minScale: 0.1,
        maxScale: 4,
        child: CachedNetworkImage(
          imageUrl: widget.imageUrl,
          placeholder: (context, url) => SpinKitFadingCircle(
            color: Colors.grey,
            size: 50.0,
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
          height: 400,
          width: 300,
        ),
      ),
    );
  }

  Widget _buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            // Action du bouton vert
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: const Text('Disponible'),
        ),
        const SizedBox(width: 20), // Espacement entre les boutons
        ElevatedButton(
          onPressed: () {
            // Action du bouton rouge
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: const Text('non Disponible'),
        ),
      ],
    );
  }

Widget _buildTextField() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(
              hintText: 'Entrez votre remarque ici...',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(width: 10), // Espacement entre le champ de texte et le bouton
        ElevatedButton(
          onPressed: () {
            // Action à exécuter lorsque le bouton est pressé
            // Ajoutez votre logique d'envoi ici
          },
          child: Text('Envoyer'),
        ),
      ],
    ),
  );
}


  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
