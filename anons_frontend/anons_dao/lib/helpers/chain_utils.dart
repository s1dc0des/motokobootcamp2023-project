import 'package:intl/intl.dart';

class ChainUtils {
  static String formatPrincipal({required String principal}) {
    return '${principal.substring(0, 5)}...${principal.substring(principal.length - 3, principal.length)}';
  }

  static String formatAmount({required int amount}) {
    String dust = amount.toString();
    if (dust.length > 8) {
      String wholePart = dust.substring(0, dust.length - 8);
      String decimal = dust.substring(dust.length - 8, dust.length);
      String value = wholePart
          .split("")
          .reversed
          .join("")
          .replaceAllMapped(RegExp(r".{3}"), (match) => "${match.group(0)},")
          .split("")
          .reversed
          .join("");
      value.split("").first == "," ? value = value.replaceFirst(",", "") : value;
      return value + "." + decimal;
    } else {
      return "0." "${'0' * (8 - dust.length)}" + dust;
    }
  }

  static String formatWithComma({required int amount}) {
    var formatter = NumberFormat('###,###,000');
    return formatter.format(amount);
  }

  static String capitalizeAssetName(String assetName) {
    List<String> name = assetName.split(' ');
    if (name.length == 3) {
      name[2].toUpperCase();
      return name[0].toCapitalized() + ' ' + name[1] + ' ' + name[2];
    } else {
      return assetName.toCapitalized();
    }
  }

  //!!use Big Int

  static mltiplyByEight({required double amount}) {
    return amount * 100000000;
  }

  static divideByEight<double>({required int amount}) {
    return amount / 100000000;
  }

  static DateTime getDateFromNano(int nanosec) {
    return DateTime.fromMicrosecondsSinceEpoch((nanosec ~/ 1000));
  }
}

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}
