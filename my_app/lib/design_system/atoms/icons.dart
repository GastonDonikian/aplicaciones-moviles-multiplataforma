import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';

class SerManosIcons {
  SerManosIcons._();

  //Visibility Icon Filled

  static const Icon visibilityFilledEnabled = Icon(Icons.visibility,
      color: SerManosColorFoundations.buttonEnabledColor);

  static const Icon visibilityFilledDisabled = Icon(
    Icons.visibility,
    color: SerManosColorFoundations.buttonDisabledColor,
  );

  static const Icon visibilityFilledActive = Icon(
    Icons.visibility,
    color: SerManosColorFoundations.buttonActiveColor,
  );

  //Visibility Icon Outlined

  static const Icon visibilityOutlinedEnabled = Icon(Icons.visibility_outlined,
      color: SerManosColorFoundations.buttonEnabledColor);

  static const Icon visibilityOutlinedDisabled = Icon(
    Icons.visibility_outlined,
    color: SerManosColorFoundations.buttonDisabledColor,
  );

  static const Icon visibilityOutlinedActive = Icon(
    Icons.visibility_outlined,
    color: SerManosColorFoundations.buttonActiveColor,
  );

  //Visibility Icon Sharp

  static const Icon visibilitySharpEnabled = Icon(Icons.visibility_sharp,
      color: SerManosColorFoundations.buttonEnabledColor);

  static const Icon visibilitySharpDisabled = Icon(
    Icons.visibility_sharp,
    color: SerManosColorFoundations.buttonDisabledColor,
  );

  static const Icon visibilitySharpActive = Icon(
    Icons.visibility_sharp,
    color: SerManosColorFoundations.buttonActiveColor,
  );

  //Visibility Off Icon Filled

  static const Icon visibilityOffFilledEnabled = Icon(
    Icons.visibility_off,
    color: SerManosColorFoundations.buttonEnabledColor,
  );
  static const Icon visibilityOffFilledDisabled = Icon(
    Icons.visibility_off,
    color: SerManosColorFoundations.buttonDisabledColor,
  );
  static const Icon visibilityOffFilledActive = Icon(
    Icons.visibility_off,
    color: SerManosColorFoundations.buttonActiveColor,
  );

  //Visibility Off Icon Outlined

  static const Icon visibilityOffOutlinedEnabled = Icon(
    Icons.visibility_off_outlined,
    color: SerManosColorFoundations.buttonEnabledColor,
  );
  static const Icon visibilityOffOutlinedDisabled = Icon(
    Icons.visibility_off_outlined,
    color: SerManosColorFoundations.buttonDisabledColor,
  );
  static const Icon visibilityOffOutlinedActive = Icon(
    Icons.visibility_off_outlined,
    color: SerManosColorFoundations.buttonActiveColor,
  );

  //Visibility Off Icon Sharp

  static const Icon visibilityOffSharpEnabled = Icon(
    Icons.visibility_off_sharp,
    color: SerManosColorFoundations.buttonEnabledColor,
  );
  static const Icon visibilityOffSharpDisabled = Icon(
    Icons.visibility_off_sharp,
    color: SerManosColorFoundations.buttonDisabledColor,
  );
  static const Icon visibilityOffSharpActive = Icon(
    Icons.visibility_off_sharp,
    color: SerManosColorFoundations.buttonActiveColor,
  );

  //Favorite Icon Filled

  static const Icon favoriteFilledEnabled = Icon(
    Icons.favorite,
    color: SerManosColorFoundations.buttonEnabledColor,
  );
  static const Icon favoriteFilledDisabled = Icon(
    Icons.favorite,
    color: SerManosColorFoundations.buttonDisabledColor,
  );
  static const Icon favoriteFilledActive = Icon(
    Icons.favorite,
    color: SerManosColorFoundations.buttonActiveColor,
  );

  //Favorite Icon Outlined
  static const Icon favoriteOutlineEnabled = Icon(
    Icons.favorite_outline,
    color: SerManosColorFoundations.buttonEnabledColor,
  );
  static const Icon favoriteOutlineDisabled = Icon(
    Icons.favorite_outline,
    color: SerManosColorFoundations.buttonDisabledColor,
  );
  static const Icon favoriteOutlineActive = Icon(
    Icons.favorite_outline,
    color: SerManosColorFoundations.buttonActiveColor,
  );

  //Search Icon Filled

  static const Icon searchEnabled = Icon(
    Icons.search,
    color: SerManosColorFoundations.buttonEnabledColor,
  );
  static const Icon searchDisabled = Icon(
    Icons.search,
    color: SerManosColorFoundations.buttonDisabledColor,
  );
  static const Icon searchActive = Icon(
    Icons.search,
    color: SerManosColorFoundations.buttonActiveColor,
  );

  //Add Icon Filled

  static const Icon addEnabled = Icon(
    Icons.add,
    color: SerManosColorFoundations.buttonEnabledColor,
  );
  static const Icon addDisabled = Icon(
    Icons.add,
    color: SerManosColorFoundations.buttonDisabledColor,
  );
  static const Icon addActive = Icon(
    Icons.add,
    color: SerManosColorFoundations.buttonActiveColor,
  );

  static const Map<String, Icon> addIcons = {
    'enabled': addEnabled,
    'disabled': addDisabled,
    'active': addActive
  };

  //Backwards Icon Filled

  static const Icon backEnabled = Icon(
    Icons.arrow_back,
    color: SerManosColorFoundations.buttonEnabledColor,
  );
  static const Icon backDisabled = Icon(
    Icons.arrow_back,
    color: SerManosColorFoundations.buttonDisabledColor,
  );
  static const Icon backActive = Icon(
    Icons.arrow_back,
    color: SerManosColorFoundations.buttonActiveColor,
  );

  //Location Icon Filled

  static const Icon locationEnabled = Icon(
    Icons.location_on,
    color: SerManosColorFoundations.buttonEnabledColor,
  );
  static const Icon locationDisabled = Icon(
    Icons.location_on,
    color: SerManosColorFoundations.buttonDisabledColor,
  );
  static const Icon locationActive = Icon(
    Icons.location_on,
    color: SerManosColorFoundations.buttonActiveColor,
  );

  //Location Icon Outlined

  static const Icon locationOutlinedEnabled = Icon(
    Icons.location_on_outlined,
    color: SerManosColorFoundations.buttonEnabledColor,
  );
  static const Icon locationOutlinedDisabled = Icon(
    Icons.location_on_outlined,
    color: SerManosColorFoundations.buttonDisabledColor,
  );
  static const Icon locationOutlinedActive = Icon(
    Icons.location_on_outlined,
    color: SerManosColorFoundations.buttonActiveColor,
  );

  //Location Icon Sharp

  static const Icon locationSharpEnabled = Icon(
    Icons.location_on_sharp,
    color: SerManosColorFoundations.buttonEnabledColor,
  );
  static const Icon locationSharpDisabled = Icon(
    Icons.location_on_sharp,
    color: SerManosColorFoundations.buttonDisabledColor,
  );
  static const Icon locationSharpActive = Icon(
    Icons.location_on_sharp,
    color: SerManosColorFoundations.buttonActiveColor,
  );

  //Error Icon Filled

  static const Icon errorEnabled =
      Icon(Icons.error, color: SerManosColorFoundations.buttonEnabledColor);
  static const Icon errorDisabled =
      Icon(Icons.error, color: SerManosColorFoundations.buttonDisabledColor);
  static const Icon errorActive =
      Icon(Icons.error, color: SerManosColorFoundations.buttonErrorColor);

  //Error Icon Outlined

  static const Icon errorOutlinedEnabled = Icon(Icons.error_outline,
      color: SerManosColorFoundations.buttonEnabledColor);
  static const Icon errorOutlinedDisabled = Icon(Icons.error_outline,
      color: SerManosColorFoundations.buttonDisabledColor);
  static const Icon errorOutlinedActive = Icon(Icons.error_outline,
      color: SerManosColorFoundations.buttonErrorColor);

  //Error Icon Sharp

  static const Icon errorSharpEnabled = Icon(Icons.error_sharp,
      color: SerManosColorFoundations.buttonEnabledColor);
  static const Icon errorSharpDisabled = Icon(Icons.error_sharp,
      color: SerManosColorFoundations.buttonDisabledColor);
  static const Icon errorSharpActive =
      Icon(Icons.error_sharp, color: SerManosColorFoundations.buttonErrorColor);

  //Close Icon Filled

  static const Icon closeEnabled =
      Icon(Icons.close, color: SerManosColorFoundations.buttonEnabledColor);
  static const Icon closeDisabled = Icon(
    Icons.close,
  );
  static const Icon closeActive = Icon(
    Icons.close,
  );
}
