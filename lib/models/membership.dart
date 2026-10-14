class Membership {
  final String id;
  final String name;
  final double monthlyPrice;
  final double yearlyPrice;
  final List<String> benefits;
  final String highlightColor;
  final bool isPopular;
  final String icon;

  const Membership({
    required this.id,
    required this.name,
    required this.monthlyPrice,
    required this.yearlyPrice,
    required this.benefits,
    required this.highlightColor,
    required this.isPopular,
    required this.icon,
  });
}
