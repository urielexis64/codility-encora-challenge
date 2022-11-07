extension DateExtend on DateTime? {
  String get formattedDate => toString().split(' ')[0];
}
