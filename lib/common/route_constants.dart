

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

  static const String planRoute = 'plan';
  static const String planSelectSubRoute = 'select';
  static const String planViewSubRoute = 'view';
  static const String planViewSelectSubRoute = 'viewSelect';
  static const String planViewAllUpdateSubRoute = 'viewUpdateAll';
  static const String planAddSubRoute = 'add';
  static const String planUpdateSubRoute = 'update';
  static const String planDeleteSubRoute = 'delete';
  static const String planSelectRoute = '/$planRoute/$planSelectSubRoute';
  static const String planViewRoute = '/$planRoute/$planViewSubRoute';
  static const String planUpdateRoute = '/$planRoute/$planUpdateSubRoute';
  static const String planAddRoute = '/$planRoute/$planAddSubRoute';
  static const String planDeleteRoute = '/$planRoute/$planDeleteSubRoute';
  static const String planViewSelectRoute = '/$planRoute/$planViewSelectSubRoute';
  static const String planViewAllUpdateRoute = '/$planRoute/$planViewAllUpdateSubRoute';

  static const String bioRoute = '/bio/';
  static const String bioUpdateSubRoute = 'update';
  static const String bioCreateSubRoute = 'create';
  static const String bioUpdateRoute = '/bio/update';
  static const String bioCreateRoute = '/bio/create';
  
  static const String bmiCheckRoute = '/bmi';
  
  static const String rateRoute = '/rate';

  static const String dietRoute = 'diet';
  static const String dietViewSubRoute = 'view';
  static const String dietAddSubRoute = 'add';
  static const String dietViewSelectSubRoute = 'viewSelect';
  static const String dietViewRoute = '/$dietRoute/$dietViewSubRoute';
  static const String dietAddRoute = '/$dietRoute/$dietAddSubRoute';
  static const String dietViewSelectRoute = '/$dietRoute/$dietViewSelectSubRoute';

  static const String calendarRoute = '/calendar';

  static const String dishRoute = '/dish';

  
//  static const String homeRoute = '/';



}