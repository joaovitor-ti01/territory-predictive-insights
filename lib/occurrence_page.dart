
import 'dart:convert';
import 'occurrence_store.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OccurrencePage extends StatefulWidget {
  const OccurrencePage({super.key});

  @override
  State<OccurrencePage> createState() => _OccurrencePageState();
}

class _OccurrencePageState extends State<OccurrencePage> {
  final _formKey = GlobalKey<FormState>();
  final _regionController = TextEditingController();
  final _descriptionController = TextEditingController();

  final List<String> _types = [
    'Calçada danificada',
    'Falta de iluminação',
    'Alagamento',
    'Acúmulo de resíduos',
    'Outro problema',
  ];

  String? _selectedType;
  bool _saving = false;
  bool _consentAccepted = false;

  @override
  void dispose() {
    _regionController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

 
Future<void> _saveOccurrence() async {
  if (!_formKey.currentState!.validate()) return;

  if (!_consentAccepted) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Confirme o consentimento para registrar a ocorrência.',
        ),
      ),
    );
    return;
  }

  setState(() => _saving = true);

  try {
    final prefs = await SharedPreferences.getInstance();
    final occurrences =
        prefs.getStringList('territory_occurrences') ?? [];

    final occurrence = {
      'type': _selectedType,
      'region': _regionController.text.trim(),
      'description': _descriptionController.text.trim(),
      'date': DateTime.now().toIso8601String(),
    };

    occurrences.add(jsonEncode(occurrence));

    final saved = await prefs.setStringList(
      'territory_occurrences',
      occurrences,
    );

    if (saved) {
      await OccurrenceStore.refresh();
    }

    if (!mounted) return;

    if (saved) {
      _regionController.clear();
      _descriptionController.clear();

      setState(() => _selectedType = null);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ocorrência registrada com sucesso!'),
          backgroundColor: Color(0xFF16865F),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Não foi possível salvar a ocorrência.'),
        ),
      );
    }
  } catch (_) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Erro ao registrar. Tente novamente.'),
      ),
    );
  } finally {
    if (mounted) {
      setState(() => _saving = false);
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PARTICIPAÇÃO CIDADÃ',
              style: TextStyle(
                color: Color(0xFF94A3B8),
                fontSize: 11,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Registrar ocorrência',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Informe um problema identificado no território '
              'para apoiar o monitoramento urbano.',
              style: TextStyle(color: Color(0xFF94A3B8)),
            ),
            const SizedBox(height: 24),

            DropdownButtonFormField<String>(
             initialValue: _selectedType,
              decoration: const InputDecoration(
                labelText: 'Tipo de ocorrência',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.category_outlined),
              ),
              items: _types.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => _selectedType = value);
              },
              validator: (value) {
                if (value == null) {
                  return 'Selecione o tipo de ocorrência.';
                }
                return null;
              },
            ),

            const SizedBox(height: 18),

            TextFormField(
              controller: _regionController,
              decoration: const InputDecoration(
                labelText: 'Região ou bairro',
                hintText: 'Ex.: Paulista',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on_outlined),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Informe a região ou bairro.';
                }
                if (value.trim().length < 2) {
                  return 'Informe pelo menos 2 caracteres.';
                }
                return null;
              },
            ),

            const SizedBox(height: 18),

            TextFormField(
              controller: _descriptionController,
              maxLines: 4,
              maxLength: 300,
              decoration: const InputDecoration(
                labelText: 'Descrição do problema',
                hintText: 'Descreva o que foi identificado...',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              validator: (value) {
                if (value == null || value.trim().length < 10) {
                  return 'Descreva o problema com pelo menos 10 caracteres.';
                }
                return null;
              },
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF151F30),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.privacy_tip_outlined,
                    color: Color(0xFF36D399),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Não informe dados pessoais. O registro '
                      'armazena apenas o tipo, a região, a descrição '
                      'e a data da ocorrência neste dispositivo.',
                      style: TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 12,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),

      CheckboxListTile(
        value: _consentAccepted,
        onChanged: _saving
            ? null
            : (value) {
                setState(() {
                  _consentAccepted = value ?? false;
                });
              },
        activeColor: const Color(0xFF36D399),
        checkColor: const Color(0xFF0B1220),
        contentPadding: EdgeInsets.zero,
        controlAffinity: ListTileControlAffinity.leading,
        title: const Text(
          'Estou ciente e concordo com o registro dessas informações '
          'para fins de análise territorial.',
          style: TextStyle(
            color: Color(0xFFCBD5E1),
            fontSize: 12,
          ),
        ),
      ),

      const SizedBox(height: 22),

      SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
                onPressed: _saving ? null : _saveOccurrence,
                icon: _saving
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(Icons.send_outlined),
                label: Text(
                  _saving ? 'Salvando...' : 'Registrar ocorrência',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF36D399),
                  foregroundColor: const Color(0xFF0B1220),
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
