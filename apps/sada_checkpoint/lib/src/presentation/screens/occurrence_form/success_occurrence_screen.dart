import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:sada_checkpoint/src/presentation/screens/occurrence_form/store/occurrence_store.dart';
import 'package:sada_design_system/sada_design_system.dart';

/// Screen shown after successfully registering an occurrence.
/// Displays a success message with the occurrence details.
class SuccessOccurrenceScreen extends StatelessWidget {
  const SuccessOccurrenceScreen({super.key, required this.store});

  final OccurrenceStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SadaAppBar(title: 'Concluído'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 32),

                    SvgPicture.asset(
                      'assets/illustrations/success_icon.svg',
                      package: 'sada_design_system',
                    ),
                    const SizedBox(height: 16),

                    const Text(
                      'Registrado',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0E7A70),
                      ),
                    ),
                    const SizedBox(height: 8),

                    const Text(
                      'Ocorrência registrada com sucesso.',
                      style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Os seguintes dados foram gravados:',
                      style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
                    ),
                    const SizedBox(height: 24),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          _buildDetailRow('Serviços:', 'Ocorrência'),
                          const SizedBox(height: 8),
                          _buildDetailRow(
                            'Responsável:',
                            store.responsavelNameController.text,
                          ),
                          if (store.createdAt != null) ...[
                            const SizedBox(height: 8),
                            _buildDetailRow(
                              'Data e hora:',
                              '${DateFormat('dd/MM/yyyy').format(store.createdAt!)} as ${DateFormat('HH:mm').format(store.createdAt!)}',
                            ),
                          ],
                          const SizedBox(height: 8),
                          _buildDetailRow(
                            'Veículo:',
                            store.licensePlateController.text,
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SadaButton(label: 'Ok', onPressed: store.close),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(fontSize: 16, color: Color(0xFF666666)),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF333333),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
