import 'fundamentals_package.dart';

FundamentalsPackage getFundamentalsPackage() => FundamentalsWebPackage();

class FundamentalsWebPackage extends FundamentalsPackage {
  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FundamentalsWebPackage && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}
