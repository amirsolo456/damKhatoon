import 'package:equatable/equatable.dart';
import 'package:khatoon_container/features/animal/domain/entities/enums.dart';
import 'package:khatoon_container/features/animal/domain/entities/feed_record.dart';
import 'package:khatoon_container/features/animal/domain/entities/medical_record.dart';
import 'package:khatoon_container/features/animal/domain/entities/strips.dart';
import 'package:khatoon_container/features/animal/domain/entities/vaccination_record.dart';

class Animal extends Equatable {
  // شناسایی
  final String id;
  final String tagNumber;         // شماره گوشواره
  final String? name;
  final AnimalType type;
  final String? breed;            // نژاد
  final Gender gender;

  // اطلاعات اصلی
  final DateTime? birthDate;
  final DateTime? purchaseDate;   // تاریخ خرید
  final double? purchasePrice;    // قیمت خرید
  final String? purchaseSource;   // منبع خرید
  final double? currentWeight;    // وزن فعلی
  final String? color;            // رنگ


  // سلامت
  final HealthStatus healthStatus;
  final ReproductionStatus reproductionStatus;
  final DateTime? lastCheckupDate;
  final String? healthNotes;
  final List<VaccinationRecord> vaccinations;
  final List<MedicalRecord> medicalRecords;

  // تولید مثل
  final String? fatherId;         // ID پدر
  final String? motherId;         // ID مادر
  final List<String> offspringIds;// ID فرزندان
  final DateTime? lastMatingDate;
  final DateTime? expectedDeliveryDate;
  final int? pregnanciesCount;    // تعداد آبستنی
  final int? birthsCount;         // تعداد زایش

  // شیردهی (برای دام‌های شیری)
  final double? dailyMilkYield;   // تولید شیر روزانه
  final double? milkFatPercent;   // درصد چربی شیر
  final DateTime? lastMilkingDate;
  final int? lactationDays;       // روزهای شیردهی

  // تغذیه
  final String? dietType;         // نوع جیره
  final double? dailyFeedAmount;  // مقدار غذای روزانه
  final List<FeedRecord> feedRecords;

  // مکان
  final String? barnId;           // ID طویله
  final String? penId;            // ID آغل
  final String? location;         // موقعیت جغرافیایی

  // اقتصادی
  final double? estimatedValue;   // ارزش تخمینی
  final DateTime? insuranceExpiry;
  final double? insuranceAmount;

  // تصاویر و اسناد
  final List<String> imageUrls;
  final List<String> documentUrls;

  // متا اطلاعات
  final String? notes;
  final AnimalStrip? strip;            // رنگ
  final String? microchipNumber;  // شماره میکروچیپ
  final String? rfidTag;          // تگ RFID
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isActive;
  final String? createdBy;
  final String? lastModifiedBy;

  const Animal({
    required this.id,
    required this.tagNumber,
    this.name,
    required this.type,
    this.breed,
    required this.gender,
    this.birthDate,
    this.purchaseDate,
    this.purchasePrice,
    this.purchaseSource,
    this.currentWeight,
    this.color,
    required this.healthStatus,
    required this.reproductionStatus,
    this.lastCheckupDate,
    this.healthNotes,
    this.vaccinations = const [],
    this.medicalRecords = const [],
    this.fatherId,
    this.motherId,
    this.offspringIds = const [],
    this.lastMatingDate,
    this.expectedDeliveryDate,
    this.pregnanciesCount,
    this.birthsCount,
    this.dailyMilkYield,
    this.milkFatPercent,
    this.lastMilkingDate,
    this.lactationDays,
    this.dietType,
    this.dailyFeedAmount,
    this.feedRecords = const [],
    this.barnId,
    this.penId,
    this.location,
    this.estimatedValue,
    this.insuranceExpiry,
    this.insuranceAmount,
    this.imageUrls = const [],
    this.documentUrls = const [],
    this.notes,
    this.microchipNumber,
    this.rfidTag,
    required this.createdAt,
    this.updatedAt,
    required this.isActive,
    this.createdBy,
    this.lastModifiedBy, this.strip,
  });

  // محاسبات
  int? get ageInMonths {
    if (birthDate == null) return null;
    final now = DateTime.now();
    return ((now.difference(birthDate!).inDays) / 30).floor();
  }

  int? get ageInYears {
    if (birthDate == null) return null;
    return DateTime.now().year - birthDate!.year;
  }

  String? get ageDescription {
    final years = ageInYears;
    final months = ageInMonths;
    if (years == null || months == null) return null;

    if (years > 0) {
      final remainingMonths = months % 12;
      if (remainingMonths > 0) {
        return '$years سال و $remainingMonths ماه';
      }
      return '$years سال';
    }
    return '$months ماه';
  }

  bool get isPregnant => reproductionStatus == ReproductionStatus.pregnant;
  bool get isMilking => reproductionStatus == ReproductionStatus.nursing;
  bool get isFemale => gender == Gender.female;
  bool get isMale => gender == Gender.male;

  // آخرین واکسیناسیون
  VaccinationRecord? get lastVaccination {
    if (vaccinations.isEmpty) return null;
    vaccinations.sort((a, b) => b.date.compareTo(a.date));
    return vaccinations.first;
  }

  // آیا واکسیناسیون نیاز دارد؟
  bool get needsVaccination {
    final lastVaccination = this.lastVaccination;
    if (lastVaccination == null) return true;
    final nextDueDate = lastVaccination.date.add(
      Duration(days: lastVaccination.nextVaccinationDays),
    );
    return DateTime.now().isAfter(nextDueDate);
  }

  @override
  List<Object?> get props => [
    id,
    tagNumber,
    name,
    type,
    breed,
    gender,
    birthDate,
    healthStatus,
    reproductionStatus,
    isActive,
    createdAt,
    strip,

  ];

  Animal copyWith({
    String? id,
    String? tagNumber,
    String? name,
    AnimalType? type,
    String? breed,
    Gender? gender,
    DateTime? birthDate,
    DateTime? purchaseDate,
    double? purchasePrice,
    String? purchaseSource,
    double? currentWeight,
    String? color,
    HealthStatus? healthStatus,
    ReproductionStatus? reproductionStatus,
    DateTime? lastCheckupDate,
    String? healthNotes,
    List<VaccinationRecord>? vaccinations,
    List<MedicalRecord>? medicalRecords,
    String? fatherId,
    String? motherId,
    List<String>? offspringIds,
    DateTime? lastMatingDate,
    DateTime? expectedDeliveryDate,
    int? pregnanciesCount,
    int? birthsCount,
    double? dailyMilkYield,
    double? milkFatPercent,
    DateTime? lastMilkingDate,
    int? lactationDays,
    String? dietType,
    double? dailyFeedAmount,
    List<FeedRecord>? feedRecords,
    String? barnId,
    String? penId,
    String? location,
    double? estimatedValue,
    DateTime? insuranceExpiry,
    double? insuranceAmount,
    List<String>? imageUrls,
    List<String>? documentUrls,
    String? notes,
    String? microchipNumber,
    String? rfidTag,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isActive,
    String? createdBy,
    String? lastModifiedBy,
  }) {
    return Animal(
      id: id ?? this.id,
      tagNumber: tagNumber ?? this.tagNumber,
      name: name ?? this.name,
      type: type ?? this.type,
      breed: breed ?? this.breed,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      purchaseSource: purchaseSource ?? this.purchaseSource,
      currentWeight: currentWeight ?? this.currentWeight,
      color: color ?? this.color,
      healthStatus: healthStatus ?? this.healthStatus,
      reproductionStatus: reproductionStatus ?? this.reproductionStatus,
      lastCheckupDate: lastCheckupDate ?? this.lastCheckupDate,
      healthNotes: healthNotes ?? this.healthNotes,
      vaccinations: vaccinations ?? this.vaccinations,
      medicalRecords: medicalRecords ?? this.medicalRecords,
      fatherId: fatherId ?? this.fatherId,
      motherId: motherId ?? this.motherId,
      offspringIds: offspringIds ?? this.offspringIds,
      lastMatingDate: lastMatingDate ?? this.lastMatingDate,
      expectedDeliveryDate: expectedDeliveryDate ?? this.expectedDeliveryDate,
      pregnanciesCount: pregnanciesCount ?? this.pregnanciesCount,
      birthsCount: birthsCount ?? this.birthsCount,
      dailyMilkYield: dailyMilkYield ?? this.dailyMilkYield,
      milkFatPercent: milkFatPercent ?? this.milkFatPercent,
      lastMilkingDate: lastMilkingDate ?? this.lastMilkingDate,
      lactationDays: lactationDays ?? this.lactationDays,
      dietType: dietType ?? this.dietType,
      dailyFeedAmount: dailyFeedAmount ?? this.dailyFeedAmount,
      feedRecords: feedRecords ?? this.feedRecords,
      barnId: barnId ?? this.barnId,
      penId: penId ?? this.penId,
      location: location ?? this.location,
      estimatedValue: estimatedValue ?? this.estimatedValue,
      insuranceExpiry: insuranceExpiry ?? this.insuranceExpiry,
      insuranceAmount: insuranceAmount ?? this.insuranceAmount,
      imageUrls: imageUrls ?? this.imageUrls,
      documentUrls: documentUrls ?? this.documentUrls,
      notes: notes ?? this.notes,
      microchipNumber: microchipNumber ?? this.microchipNumber,
      rfidTag: rfidTag ?? this.rfidTag,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isActive: isActive ?? this.isActive,
      createdBy: createdBy ?? this.createdBy,
      lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
    );
  }
}

extension AnimalTypeX on AnimalType {
  String get persianName {
    switch (this) {
      case AnimalType.cow: return 'گاو';
      case AnimalType.sheep: return 'گوسفند';
      case AnimalType.goat: return 'بز';
      case AnimalType.buffalo: return 'گاومیش';
      case AnimalType.camel: return 'شتر';
      case AnimalType.horse: return 'اسب';
      case AnimalType.donkey: return 'الاغ';
      case AnimalType.poultry: return 'طیور';
      case AnimalType.fish: return 'ماهی';
      case AnimalType.other: return 'سایر';
    }
  }
}