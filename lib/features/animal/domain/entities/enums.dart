enum AnimalType {
  cow,          // گاو
  sheep,        // گوسفند
  goat,         // بز
  buffalo,      // گاومیش
  camel,        // شتر
  horse,        // اسب
  donkey,       // الاغ
  poultry,      // طیور
  fish,         // ماهی
  other,        // سایر
}

// جنسیت
enum Gender {
  male,         // نر
  female,       // ماده
  neutered,     // اخته شده
}

// وضعیت سلامت
enum HealthStatus {
  healthy,      // سالم
  sick,         // بیمار
  injured,      // مجروح
  quarantined,  // قرنطینه
  dead,         // تلف شده
  sold,         // فروخته شده
}

// وضعیت تولید مثل
enum ReproductionStatus {
  notPregnant,  // غیر آبستن
  pregnant,     // آبستن
  inHeat,       // فحل
  nursing,      // شیرده
  dry,          // خشک
}

enum ReproductionType {
  artificialInsemination, // تلقیح مصنوعی
  naturalMating,         // جفت‌گیری طبیعی
  pregnancyCheck,        // بررسی آبستنی
  birth,                 // زایش
  abortion,              // سقط
}

enum TransactionType {
  purchase,     // خرید
  sale,         // فروش
  exchange,     // معاوضه
  gift,         // هدیه
  inheritance,  // ارث
}

enum EventType {
  vaccination,
  treatment,
  feeding,
  milking,
  weighing,
  mating,
  birth,
  move,
  checkup,
  other,
}
