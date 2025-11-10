import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sada_design_system/sada_design_system.dart';

import 'store/occurrence_store.dart';

class ResponsableScreen extends StatelessWidget {
  const ResponsableScreen({required this.store, super.key});

  final OccurrenceStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SadaAppBar(
        title: 'Assinatura',
        leading: SadaBackButton(onPressed: () => Modular.to.pop()),
      ),
      backgroundColor: const Color(0xFFF4F6F8),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Responsável',
              style: TextStyle(color: Color(0xFF6B6B6B)),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: store.responsavelNameController,
              decoration: InputDecoration(
                hintText: 'Responsável',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
              textCapitalization: TextCapitalization.words,
              autofocus: true,
            ),

            const SizedBox(height: 16),
            const Text(
              'Assinatura',
              style: TextStyle(color: Color(0xFF6B6B6B)),
            ),
            const SizedBox(height: 8),

            GestureDetector(
              onTap: () async {
                final signature = await Modular.to.pushNamed<ui.Image?>(
                  '/occurrence/responsable/signature',
                );
                if (signature != null) {
                  store.setSignatureImage(signature);
                }
              },
              child: Observer(
                builder: (_) {
                  if (store.signatureImage != null) {
                    return Container(
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFFE0E6EA)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: RawImage(
                          image: store.signatureImage,
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    );
                  }
                  return Container(
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFE0E6EA)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Toque para assinar',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const Spacer(),
            Observer(
              builder: (_) {
                return SadaButton(
                  label: 'Finalizar',
                  onPressed: store.isFormValid && !store.isSubmitting
                      ? store.submit
                      : null,
                  trailingIcon: const Icon(Icons.check_circle_outline),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
