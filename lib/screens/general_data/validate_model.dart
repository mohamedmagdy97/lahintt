class ValidateIndividualSelectedModel {
  bool? isNationalitySelected;
  bool? isPayTypeSelected;
  bool? isContractDurationSelected;
  bool? isExperienceSelected;

  ValidateIndividualSelectedModel({
    this.isNationalitySelected = false,
    this.isPayTypeSelected = false,
    this.isContractDurationSelected = false,
    this.isExperienceSelected = false,
  });

  bool isValidatedAll() {
    if (isNationalitySelected! &&
        isPayTypeSelected! &&
        isExperienceSelected! &&
        isContractDurationSelected!) {
      print('trueeeeeeeeeee');

      return true;
    } else {
      print('falseeeeeeee');
      return false;
    }
  }
}
