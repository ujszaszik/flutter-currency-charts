import 'package:currency_charts/extension/enum_extensions.dart';
import 'package:currency_charts/features/home/model/selector_item_model.dart';

enum CurrencyType {
  EUR('Euró'),
  USD('USA dollár'),
  CHF('Svájci frank'),
  GBP('Angol font');

  const CurrencyType(this.name);

  final String name;
}

extension UnitToMenuitem on CurrencyType {
  SelectorItemModel toMenuItem() {
    return SelectorItemModel(index: index, name: name, imageName: imageName());
  }
}
