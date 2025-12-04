class Scientist {
  final String name;
  final String nameEn;
  final String birthInfo;
  final String achievements;
  final String deathInfo;
  final String website;
  final String? imageAsset;  // For asset images
  final String? imageFile;   // For gallery/camera images (file path)

  Scientist({
    required this.name,
    required this.nameEn,
    required this.birthInfo,
    required this.achievements,
    required this.deathInfo,
    required this.website,
    this.imageAsset,
    this.imageFile,
  });

  Scientist copyWith({
    String? name,
    String? nameEn,
    String? birthInfo,
    String? achievements,
    String? deathInfo,
    String? website,
    String? imageAsset,
    String? imageFile,
  }) {
    return Scientist(
      name: name ?? this.name,
      nameEn: nameEn ?? this.nameEn,
      birthInfo: birthInfo ?? this.birthInfo,
      achievements: achievements ?? this.achievements,
      deathInfo: deathInfo ?? this.deathInfo,
      website: website ?? this.website,
      imageAsset: imageAsset ?? this.imageAsset,
      imageFile: imageFile ?? this.imageFile,
    );
  }
}