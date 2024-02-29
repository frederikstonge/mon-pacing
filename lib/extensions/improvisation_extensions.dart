import '../models/improvisation_model.dart';
import '../models/improvisation_type.dart';
import 'duration_extensions.dart';

extension ImproviationExtensions on ImprovisationModel {
  String getImprovisationString() {
    var returnValue = type == ImprovisationType.mixed ? 'M' : 'C';
    if (category.isNotEmpty) {
      returnValue += ' - $category';
    }

    if (performers != null) {
      returnValue += ' - $performers';
    }

    returnValue += ' - ${Duration(seconds: durationsInSeconds.reduce((value, element) => value + element)).toImprovDuration()}';

    return returnValue;
  }
}
