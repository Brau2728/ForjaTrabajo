import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final double altura; // % de altura de pantalla (0.0 a 1.0)
  final double curvaIzquierda; // Factor de curva izquierda
  final double curvaDerecha; // Factor de curva derecha
  final bool modoOvalo; // true = óvalo | false = curvas independientes

  const HomeScreen({
    super.key,
    this.altura = 0.35,
    this.curvaIzquierda = 0.9,
    this.curvaDerecha = 1.7,
    this.modoOvalo = true,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Sección superior con curva y barra de búsqueda
          SizedBox(
            height: screenHeight * altura +
                24, // Espacio extra para la barra de búsqueda
            child: Stack(
              clipBehavior:
                  Clip.none, // Permite que los hijos se dibujen fuera del Stack
              children: [
                // Fondo curvo
                Container(
                  height: screenHeight * altura,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: modoOvalo
                        ? BorderRadius.vertical(
                            bottom: Radius.elliptical(
                              screenWidth * (curvaIzquierda + curvaDerecha) / 2,
                              screenWidth * 0.5,
                            ),
                          )
                        : BorderRadius.only(
                            bottomLeft: Radius.elliptical(
                              screenWidth * curvaIzquierda,
                              screenWidth * 0.5,
                            ),
                            bottomRight: Radius.elliptical(
                              screenWidth * curvaDerecha,
                              screenWidth * 0.5,
                            ),
                          ),
                  ),
                ),

                // Sección de ubicación
                Positioned(
                  top: 50,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: const Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Ciudad Hidalgo Mich.',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Barra de búsqueda
                Positioned(
                  bottom: 140,
                  left: 35,
                  right: 70,
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar oficio...',
                        border: InputBorder.none,
                        icon: Icon(Icons.search, color: Colors.blue),
                        suffixIcon: Icon(Icons.tune, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Contenido principal con padding izquierdo
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0), // Margen izquierdo uniforme
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Alineación izquierda
              children: [
                const Text(
                  'Lo más',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Destacado de',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Hoy',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Aquí puedes agregar más contenido debajo de los textos
                // Por ejemplo:
                const SizedBox(height: 50),
                // Widgets adicionales...
                // Carrusel de imágenes
                SizedBox(
                  height: 180, // Altura del carrusel
                  child: PageView(
                    controller: PageController(viewportFraction: 0.8),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            'https://picsum.photos/600/300?random=1',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            'https://picsum.photos/600/300?random=2',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            'https://picsum.photos/600/300?random=2',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            'https://picsum.photos/600/300?random=3',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}