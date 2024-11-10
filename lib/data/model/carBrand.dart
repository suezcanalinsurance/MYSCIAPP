
class CarBrand {
  const CarBrand({
    required this.brandMain,
    required this.brandSub,
    required this.brandName,
    required this.brandSubName,
    required this.countryOfOrigin,
    required this.fullBrandName,
  });

  final int brandMain;
  final int brandSub;
  final String brandName;
  final String brandSubName;
  final String countryOfOrigin;
  final String fullBrandName;

  @override
  String toString() {
    return '$brandMain, $brandSub,$brandName, $brandSubName,$countryOfOrigin, $fullBrandName';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is CarBrand && other.brandMain == brandMain && other.brandSub == brandSub && other.brandName == brandName && other.brandSubName == brandSubName&& other.countryOfOrigin == countryOfOrigin && other.fullBrandName == fullBrandName;
  }

  @override
  int get hashCode => Object.hash(brandMain, brandSub,brandName,brandSubName,countryOfOrigin,fullBrandName);
}