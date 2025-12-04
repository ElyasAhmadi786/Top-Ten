import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../app/language_provider.dart';
import '../app/data_provider.dart';
import '../models/scientist.dart';

class AddEditScientistScreen extends StatefulWidget {
  final Scientist? scientist;
  final int? index;

  const AddEditScientistScreen({
    super.key,
    this.scientist,
    this.index,
  });

  @override
  _AddEditScientistScreenState createState() => _AddEditScientistScreenState();
}

class _AddEditScientistScreenState extends State<AddEditScientistScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nameEnController = TextEditingController();
  final _birthController = TextEditingController();
  final _achievementsController = TextEditingController();
  final _deathController = TextEditingController();
  final _websiteController = TextEditingController();

  File? _selectedImage;
  String _imagePath = '';

  @override
  void initState() {
    super.initState();
    if (widget.scientist != null) {
      _nameController.text = widget.scientist!.name;
      _nameEnController.text = widget.scientist!.nameEn;
      _birthController.text = widget.scientist!.birthInfo;
      _achievementsController.text = widget.scientist!.achievements;
      _deathController.text = widget.scientist!.deathInfo;
      _websiteController.text = widget.scientist!.website;
      _imagePath = widget.scientist!.imageAsset!;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nameEnController.dispose();
    _birthController.dispose();
    _achievementsController.dispose();
    _deathController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
          _imagePath = pickedFile.path;
        });
      }
    } catch (e) {
      _showError('خطا در انتخاب عکس: $e');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _saveScientist(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (_imagePath.isEmpty && _selectedImage == null) {
        _showError('لطفا یک عکس انتخاب کنید');
        return;
      }

      final newScientist = Scientist(
        name: _nameController.text.trim(),
        nameEn: _nameEnController.text.trim(),
        birthInfo: _birthController.text.trim(),
        achievements: _achievementsController.text.trim(),
        deathInfo: _deathController.text.trim(),
        website: _websiteController.text.trim(),
        imageAsset: _selectedImage != null ? _imagePath : _imagePath,
      );

      final dataProvider = Provider.of<DataProvider>(context, listen: false);

      if (widget.index != null) {
        dataProvider.updateScientist(widget.index!, newScientist);
      } else {
        dataProvider.addScientist(newScientist);
      }

      Navigator.pop(context);
    }
  }

  void _showImagePickerDialog(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context, listen: false);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text(languageProvider.translate('takePhoto')),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text(languageProvider.translate('photoGallery')),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        final isEdit = widget.scientist != null;

        return Scaffold(
          appBar: AppBar(
            title: Text(isEdit
                ? languageProvider.translate('editScientist')
                : languageProvider.translate('addScientist')),
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Image Picker
                  GestureDetector(
                    onTap: () => _showImagePickerDialog(context),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardTheme.color,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: _selectedImage != null
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.file(
                          _selectedImage!,
                          fit: BoxFit.cover,
                        ),
                      )
                          : _imagePath.isNotEmpty && _selectedImage == null
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          _imagePath,
                          fit: BoxFit.cover,
                        ),
                      )
                          : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_a_photo,
                            size: 50,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            languageProvider.translate('selectPhoto'),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Name (Persian)
                  _buildTextField(
                    context: context,
                    label: '${languageProvider.translate('name')} (فارسی)',
                    controller: _nameController,
                    icon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفا نام فارسی را وارد کنید';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  // Name (English)
                  _buildTextField(
                    context: context,
                    label: '${languageProvider.translate('name')} (English)',
                    controller: _nameEnController,
                    icon: Icons.person_outline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter English name';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  // Birth Info
                  _buildTextField(
                    context: context,
                    label: languageProvider.translate('birthInfo'),
                    controller: _birthController,
                    icon: Icons.cake,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفا اطلاعات تولد را وارد کنید';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  // Achievements
                  _buildTextField(
                    context: context,
                    label: languageProvider.translate('achievements'),
                    controller: _achievementsController,
                    icon: Icons.emoji_events,
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفا دستاوردها را وارد کنید';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  // Death Info
                  _buildTextField(
                    context: context,
                    label: languageProvider.translate('deathInfo'),
                    controller: _deathController,
                    icon: Icons.restaurant_menu,
                  ),

                  const SizedBox(height: 16),

                  // Website
                  _buildTextField(
                    context: context,
                    label: languageProvider.translate('website'),
                    controller: _websiteController,
                    icon: Icons.language,
                  ),

                  const SizedBox(height: 32),

                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _saveScientist(context),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(languageProvider.translate('save')),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(languageProvider.translate('cancel')),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    required String label,
    required TextEditingController controller,
    required IconData icon,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
      ),
      maxLines: maxLines,
      validator: validator,
    );
  }
}