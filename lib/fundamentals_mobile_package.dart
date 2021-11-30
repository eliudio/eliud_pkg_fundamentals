import 'package:eliud_core/core/blocs/access/access_bloc.dart';

import 'package:eliud_core/model/access_model.dart';

import 'package:eliud_core/model/app_model.dart';

import 'package:eliud_core/model/member_model.dart';

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
