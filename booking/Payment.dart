
class Payment{

  String _cardType, _cardNo ,_cardPass;

  Payment(this._cardType, this._cardNo, this._cardPass);

  get cardNo => _cardNo;

  String get cardType => _cardType;

  int cardValidation({String cpass, String cNo}) {
    if (cpass != _cardPass) {
      return 0;
    }
    else if
    (cNo != cardNo) {
      return 2;
    }
    return 1 ;
  }
}
