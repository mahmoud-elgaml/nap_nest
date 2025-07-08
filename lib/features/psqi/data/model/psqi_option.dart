class PsqiOption {
  final String value;
  final String label;

  PsqiOption({required this.value, required this.label});

  factory PsqiOption.fromJson(Map<String, dynamic> json) {
    return PsqiOption(value: json['value'], label: json['label']);
  }
}
