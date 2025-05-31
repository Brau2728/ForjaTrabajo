import 'package:flutter/material.dart';

class LaborFormPage extends StatefulWidget {
  const LaborFormPage({super.key});

  @override
  State<LaborFormPage> createState() => _LaborFormPageState();
}

class _LaborFormPageState extends State<LaborFormPage> {
  String? selectedArea;
  String? selectedExperience;
  String? selectedWorkType;

  final List<String> areas = ['Albañilería', 'Electricista', 'Plomero', 'Mecánico'];
  final List<String> experiences = ['1 año', '3 años', '6 años'];
  final List<String> workTypes = ['Sí', 'No'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 140,
                color: Colors.blue,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 16,
                right: 16,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context); // Puedes cambiar esto si necesitas otro comportamiento
                      },
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Cuéntanos sobre ti',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 48), // Para equilibrar el espacio del botón de atrás
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('¿Cuál es tu área laboral?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  ...areas.map((area) => RadioListTile<String>(
                        title: Text(area),
                        value: area,
                        groupValue: selectedArea,
                        onChanged: (value) => setState(() => selectedArea = value),
                      )),
                  const SizedBox(height: 20),
                  const Text('¿Cuántos años de experiencia tienes en este oficio?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  ...experiences.map((exp) => RadioListTile<String>(
                        title: Text(exp),
                        value: exp,
                        groupValue: selectedExperience,
                        onChanged: (value) => setState(() => selectedExperience = value),
                      )),
                  const SizedBox(height: 20),
                  const Text('¿Trabajas por tu cuenta o en una empresa/grupo?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  ...workTypes.map((type) => RadioListTile<String>(
                        title: Text(type),
                        value: type,
                        groupValue: selectedWorkType,
                        onChanged: (value) => setState(() => selectedWorkType = value),
                      )),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        print("Área: $selectedArea");
                        print("Experiencia: $selectedExperience");
                        print("Trabajo: $selectedWorkType");
                      },
                      child: const Text('Siguiente'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
