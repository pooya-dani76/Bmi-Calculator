// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bmi.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonBmiAdapter extends TypeAdapter<PersonBmi> {
  @override
  final int typeId = 1;

  @override
  PersonBmi read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonBmi(
      bmi: fields[0] as double,
      idealWeight: fields[1] as int,
      gender: fields[2] as String,
      height: fields[3] as int,
      weight: fields[4] as int,
      age: fields[5] as int,
      time: fields[6] as DateTime,
      name: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PersonBmi obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.bmi)
      ..writeByte(1)
      ..write(obj.idealWeight)
      ..writeByte(2)
      ..write(obj.gender)
      ..writeByte(3)
      ..write(obj.height)
      ..writeByte(4)
      ..write(obj.weight)
      ..writeByte(5)
      ..write(obj.age)
      ..writeByte(6)
      ..write(obj.time)
      ..writeByte(7)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonBmiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
