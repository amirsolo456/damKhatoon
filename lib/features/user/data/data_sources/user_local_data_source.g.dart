// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_local_data_source.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserLocalDataSourceAdapter extends TypeAdapter<UserLocalDataSource> {
  @override
  final int typeId = 0;

  @override
  UserLocalDataSource read(BinaryReader reader) {
    return UserLocalDataSource();
  }

  @override
  void write(BinaryWriter writer, UserLocalDataSource obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLocalDataSourceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
