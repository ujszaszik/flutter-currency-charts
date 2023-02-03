import 'package:currency_charts/model/currency/currency_item.dart';
import 'package:xml/xml.dart';

const String mainTag = 'arfolyamok';
const String itemTag = 'item';
const String currencyTag = 'valuta';
const String exchangeTag = 'deviza';
const String bankTag = 'bank';
const String dateTag = 'datum';
const String unitTag = 'penznem';
const String buyTag = 'vetel';
const String sellTag = 'eladas';

extension CurrencyElement on XmlDocument {
  Iterable<XmlElement> currencyElements() {
    return findElements(mainTag).first
        .findElements(currencyTag).first
        .findElements(itemTag);
  }
}

extension ExchangeElement on XmlDocument {
  Iterable<XmlElement> exchangeElements() {
    return findElements(mainTag).first
        .findElements(exchangeTag).first
        .findElements(itemTag);
  }
}

extension ElementInfo on XmlElement {
  CurrencyItem item() {
    return CurrencyItem(
        bank: bank(),
        date: date(),
        currency: unit(),
        sell: sell(),
        buy: buy()
    );
  }
}

extension BankText on XmlElement {
  String bank() {
    return findElements(bankTag).first.text;
  }
}

extension Date on XmlElement {
  String date() {
    return findElements(dateTag).first.text;
  }
}

extension UnitText on XmlElement {
  String unit() {
    return findElements(unitTag).first.text;
  }
}

extension BuyPrice on XmlElement {
  double buy() {
    return double.parse(findElements(buyTag).first.text);
  }
}

extension SellPrice on XmlElement {
  double sell() {
    return double.parse(findElements(sellTag).first.text);
  }
}