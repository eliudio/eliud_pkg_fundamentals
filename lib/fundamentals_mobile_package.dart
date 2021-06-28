import 'fundamentals_package.dart';

class FundamentalsMobilePackage extends FundamentalsPackage {

  @override
  List<Object?> get props => [
  ];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is FundamentalsMobilePackage &&
              runtimeType == other.runtimeType;

}
