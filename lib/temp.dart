List<String>? checkSelectBodyPart(bool selectNeck, bool selectShoulder,
    bool selectHand, bool selectLeg, bool selectFoot) {
  List<String> returnList = [];
  if (selectNeck == true) returnList.add('Neck');
  if (selectShoulder == true) returnList.add('Shoulder');
  if (selectHand == true) returnList.add('Hand');
  if (selectLeg == true) returnList.add('Leg');
  if (selectFoot == true) returnList.add('Foot');
  return returnList;
}

void main(List<String> args) {
  print(checkSelectBodyPart(true, true, true, true, true));
}
