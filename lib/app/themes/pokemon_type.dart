import 'package:flutter/material.dart';
import 'package:pokemon/app/core/models/pokemon_model.dart';
import 'package:pokemon/app/themes/string_theme.dart';

class PokemonType {
  PokemonType();

  BoxDecoration _colorOrGradient(
      Color backgroundColor, List<Color> gradientColors) {
    return (gradientColors.length != 0)
        ? BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                gradientColors[0],
                gradientColors[1],
              ],
            ),
            borderRadius: new BorderRadius.all(
              new Radius.circular(5.0),
            ),
          )
        : BoxDecoration(
            borderRadius: new BorderRadius.all(
              new Radius.circular(5.0),
            ),
            color: backgroundColor);
  }

  Widget _typeContainer({
    String type,
    double widthSize,
    Color fontColor,
    Color backgroundColor,
    List<Color> gradientColors,
  }) {
    return Container(
      width: widthSize * 0.35,
      height: 25,
      child: new Text(
        type.capitalize(),
        style: new TextStyle(
          color: fontColor,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
      decoration: _colorOrGradient(backgroundColor, gradientColors),
      padding: new EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
    );
  }

  Widget pokemonType(List<dynamic> types, double widthSize) {
    Color fontColor;
    Color backgroundColor;
    List<Color> gradientColor = new List<Color>();
    List<Widget> typesInContainer = new List<Widget>();
    for (int i = 0; i != types.length; i++) {
      String type = types[i]['type']['name'];
      switch (type) {
        case 'grass':
          fontColor = Color.fromRGBO(33, 33, 33, 1);
          backgroundColor = Color.fromRGBO(155, 204, 80, 1);
          break;
        case 'fire':
          fontColor = Color.fromRGBO(255, 255, 255, 1);
          backgroundColor = Color.fromRGBO(253, 125, 36, 1);
          break;
        case 'water':
          fontColor = Color.fromRGBO(255, 255, 255, 1);
          backgroundColor = Color.fromRGBO(69, 146, 196, 1);
          break;
        case 'bug':
          fontColor = Color.fromRGBO(255, 255, 255, 1);
          backgroundColor = Color.fromRGBO(114, 159, 63, 1);
          break;
        case 'normal':
          fontColor = Color.fromRGBO(33, 33, 33, 1);
          backgroundColor = Color.fromRGBO(164, 172, 175, 1);
          break;
        case 'poison':
          fontColor = Color.fromRGBO(255, 255, 255, 1);
          backgroundColor = Color.fromRGBO(185, 127, 201, 1);
          break;
        case 'electric':
          fontColor = Color.fromRGBO(33, 33, 33, 1);
          backgroundColor = Color.fromRGBO(238, 213, 53, 1);
          break;
        case 'fairy':
          fontColor = Color.fromRGBO(33, 33, 33, 1);
          backgroundColor = Color.fromRGBO(253, 185, 233, 1);
          break;
        case 'fighting':
          fontColor = Color.fromRGBO(255, 255, 255, 1);
          backgroundColor = Color.fromRGBO(213, 103, 35, 1);
          break;
        case 'psychic':
          fontColor = Color.fromRGBO(255, 255, 255, 1);
          backgroundColor = Color.fromRGBO(243, 102, 185, 1);
          break;
        case 'rock':
          fontColor = Color.fromRGBO(255, 255, 255, 1);
          backgroundColor = Color.fromRGBO(163, 140, 33, 1);
          break;
        case 'ghost':
          fontColor = Color.fromRGBO(255, 255, 255, 1);
          backgroundColor = Color.fromRGBO(123, 98, 163, 1);
          break;
        case 'ice':
          fontColor = Color.fromRGBO(33, 33, 33, 1);
          backgroundColor = Color.fromRGBO(81, 196, 231, 1);
          break;
        case 'ground':
          gradientColor.length = 0;
          gradientColor.add(Color.fromRGBO(247, 222, 63, 1));
          gradientColor.add(Color.fromRGBO(171, 152, 66, 1));
          break;
        case 'flying':
          gradientColor.length = 0;
          gradientColor.add(Color.fromRGBO(61, 199, 239, 1));
          gradientColor.add(Color.fromRGBO(189, 185, 184, 1));
          break;
        case 'dragon':
          gradientColor.length = 0;
          gradientColor.add(Color.fromRGBO(83, 164, 207, 1));
          gradientColor.add(Color.fromRGBO(241, 110, 87, 1));
          break;
      }
      Widget retorno = _typeContainer(
          type: type,
          backgroundColor: backgroundColor,
          fontColor: fontColor,
          widthSize: widthSize,
          gradientColors: gradientColor);
      typesInContainer.add(retorno);
      typesInContainer.add(SizedBox(width: 10));
    }
    return Row(
      children: typesInContainer,
    );
  }
}
