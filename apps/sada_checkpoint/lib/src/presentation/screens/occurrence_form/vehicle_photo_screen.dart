import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sada_design_system/sada_design_system.dart';

import '../../widgets/photos_widget.dart';
import 'store/occurrence_store.dart';

class VehiclePhotoScreen extends StatelessWidget {
  const VehiclePhotoScreen({required this.store, super.key});

  final OccurrenceStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SadaAppBar(
        title: 'Ocorrência',
        leading: SadaBackButton(onPressed: () => Modular.to.pop()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Placa Veículo',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Observer(
              builder: (_) {
                return TextField(
                  controller: store.licensePlateController,
                  textCapitalization: TextCapitalization.characters,
                  onChanged: (value) {
                    final upper = value.toUpperCase();
                    if (value != upper) {
                      store.licensePlateController.value = store
                          .licensePlateController
                          .value
                          .copyWith(
                            text: upper,
                            selection: TextSelection.collapsed(
                              offset: upper.length,
                            ),
                          );
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Placa',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  autofocus: true,
                  inputFormatters: [
                    MaskTextInputFormatter(
                      mask: 'AAA-9#99',
                      filter: {
                        'A': RegExp(r'[A-Z]'),
                        '9': RegExp(r'[0-9]'),
                        '#': RegExp(r'[A-Z0-9]'),
                      },
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
            Observer(
              builder: (_) {
                return PhotosWidget(
                  photos: store.photos.toList(),
                  onAddPhoto: (photo) {
                    if (photo != null) {
                      store.addPhoto(photo);
                    }
                  },
                );
              },
            ),
            const Spacer(),
            Observer(
              builder: (context) {
                return SadaButton(
                  label: 'Avançar',
                  onPressed: store.isValid
                      ? () => Modular.to.pushNamed('/occurrence/responsable')
                      : null,
                  trailingIcon: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF00796B),
                        size: 12,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
