import 'dart:io';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import '../../atom/atom.dart';

class ImageInput extends StatelessWidget {
  final String hintText;
  final String label;
  final bool isRequired;
  final ValueChanged<File> onChanged;
  final File image;

  const ImageInput({
    Key key,
    this.hintText,
    this.label,
    this.isRequired,
    this.onChanged,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(
          label: label,
          isRequired: isRequired,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(Dimens.dp8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.dp8),
            color: Theme.of(context).inputDecorationTheme.fillColor,
          ),
          child: InkWell(
            onTap: _onTap,
            borderRadius: BorderRadius.circular(Dimens.dp8),
            child: image != null ? _buildImage() : _buildEmptyImage(context),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyImage(BuildContext context) {
    return DashesBorder(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(Dimens.dp32),
        child: Column(
          children: [
            Icon(
              Icons.camera_enhance_outlined,
              color: Theme.of(context).primaryColor,
              size: Dimens.dp24,
            ),
            SizedBox(height: Dimens.dp4),
            Text(
              hintText ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: Dimens.dp14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.dp8),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 150,
        ),
        child: Image.file(
          image,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }

  void _onTap() async {
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null && onChanged != null) {
      onChanged(File(pickedFile.path));
    }
  }
}
