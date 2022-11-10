

class RouteConstants {

  static const String homeRoute = '/';

  static const String forgotPasswordRoute = '/forgot';

  static const String userDetailsRoute = '/userDetails/';
  static const String userDetailsCreateSubRoute = 'create';
  static const String userDetailsUpdateSubRoute = 'update';
  static const String userDetailsViewSubRoute = 'view';
  static const String userDetailsCreateRoute = '/userDetails/$userDetailsCreateSubRoute';
  static const String userDetailsUpdateRoute = '/userDetails/$userDetailsUpdateSubRoute';
  static const String userDetailsViewRoute = '/userDetails/$userDetailsViewSubRoute';

  static const String planRoute = '/plan/';
  static const String planChangeSubRoute = 'change';
  static const String planSelectSubRoute = 'select';
  static const String planViewSubRoute = 'view';
  static const String planChangeRoute = '/plan/$planChangeSubRoute';
  static const String planSelectRoute = '/plan/$planSelectSubRoute';
  static const String planViewRoute = '/plan/$planViewSubRoute';

  static const String bioRoute = '/bio/';
  static const String bioUpdateSubRoute = 'update';
  static const String bioCreateSubRoute = 'create';
  static const String bioUpdateRoute = '/bio/update';
  static const String bioCreateRoute = '/bio/create';
  
  static const String bmiCheckRoute = '/bmi';
  
  static const String rateRoute = '/rate';

  static const String dietViewRoute = '/diet';
  
//  static const String homeRoute = '/';



}