import 'fundamentals_package.dart';

FundamentalsPackage getFundamentalsPackage() => FundamentalsMobilePackage();

class FundamentalsMobilePackage extends FundamentalsPackage {
  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FundamentalsMobilePackage && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}
