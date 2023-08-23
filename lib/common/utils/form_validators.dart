import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

typedef Validator = String? Function(dynamic param);

class FormValidators {
  static Validator required({String? fieldName}) => FormBuilderValidators.required(
        errorText:
            (fieldName != null && fieldName.isNotEmpty) ? '$fieldName ${'is_required'.tr()}' : 'required_field'.tr(),
      );

  static FormFieldValidator<T> compose<T>(List<FormFieldValidator<T>> validators) => (valueCandidate) {
        for (FormFieldValidator<T> validator in validators) {
          final String? validatorResult = validator.call(valueCandidate);
          if (validatorResult != null) {
            return validatorResult;
          }
        }
        return null;
      };
}
