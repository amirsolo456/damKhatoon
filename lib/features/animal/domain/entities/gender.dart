import 'package:equatable/equatable.dart';
import 'package:khatoon_container/features/animal/domain/entities/enums.dart';

class AnimalGender extends Equatable {
  final int id;
  final Gender gender;
  final String description;

  const AnimalGender({
    required this.id,
    required this.description,
    required this.gender,
  });

  String get persianName {
    switch (gender) {
      case Gender.male:
        return 'male';
      case Gender.female:
        return 'female';
      case Gender.neutered:
        return 'neutered';
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

extension AnimalGenderX on Gender {
  String get persianName {
    switch (this) {
      case Gender.male:
        return 'نر';
      case Gender.female:
        return 'ماده';
      case Gender.neutered:
        return 'اخته';
    }
  }
}
