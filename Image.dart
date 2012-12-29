part of libcrac;

class Image {
  /*##############################################
   *  Variables pour la classe Image
   *##############################################*/
  Game _Game;
  double _x ,_y;
  double _width, _height;
  double _RandX;
  double _VitesseY;
  double _rand, _rand2;
  Random _generateRand;
  String _jsName, _nameImg;
  bool _activate, _statutIntro = false;
  ImageElement _img;
  
  /*##############################################
   *  Constructeur de la classe IMAGE 
   *##############################################*/
  Image(this._Game, this._x, this._y, this._width, this._height, this._jsName, this._RandX, this._VitesseY, this._nameImg, this._activate) {  
    _img = document.query(_jsName); 
    _generateRand = new Random(_Game._height.toInt());
    if (_activate == true)
      select_move_image(_nameImg);
  }
  
  /*##############################################
   *  Ceci est une fonction de switcht en fonction
   *  du nom des images. 
   *##############################################*/
   void select_move_image(String nameImg) {

     switch(nameImg) {
       case "gift":
         window.setInterval(moveGift, 4);
         break;
       case "grinch":
         window.setInterval(moveGrinch, 4);
         break;
       case "lutin":
         window.setInterval(moveLutin, 4);
         break;
       case "introduction":
         window.setInterval(drawNeigeIntroduction, 4);
         break;
       case "proj":
         window.setInterval(drawProjectile, 4);
         break;
       default:
         break;
                
     }
   }
  
  /*##############################################
   *  Toutes les fonctionnalités pour les gifts 
   *##############################################*/
  //Fonction de mouvement des Gifts
   void moveGift() {
    _y = _y + _VitesseY;
    _rand = _generateRand.nextInt(_RandX.toInt()).toDouble();
    if (_y >= _Game._height) {
      _y = -_height;
      _x = _rand;  
    }
    drawGift();
  }
  
  //Affiche les images Gifts
  void drawGift() {
    _Game._win.drawImage(_img, _x, _y, _width, _height);
    _Game._win.closePath();
    _Game._win.stroke();
  }
  
  /*##############################################
   *  Toutes les fonctionnalités pour les GRINCH 
   *##############################################*/
  //Fonction de mouvement des GRINCH
  void moveGrinch() {
    _y = _y + _VitesseY;
    _x = _x + _VitesseY;
    _rand = _generateRand.nextInt(_RandX.toInt()).toDouble();
    _rand2 = _generateRand.nextInt(_RandX.toInt()).toDouble();
    if (_y >= _Game._height) {
      _y = -_rand;
      _x = _rand2;
      _img = document.query(_jsName);
      
    }
  }
  
  //Affiche les images Grinch
  void drawGrinch() {
    _Game._win.drawImage(_img, _x, _y, _width, _height);
    _Game._win.closePath();
    _Game._win.stroke();
  }
  
  /*##############################################
   *  Toutes les fonctionnalités pour les LUTIND 
   *##############################################*/
  //Fonction de mouvement du lutin
  void moveLutin() {  
    if (_x > (_Game._width - 100))
      _Game._LUTINdirectionX = _Game._width - 100;
    else if (_x < 0.0)
      _Game._LUTINdirectionX = 0.0;
     _x = _Game._LUTINdirectionX;
     if (_Game._ProjectileDirectionX != true) 
       updatePositionProjectile();
    drawLutin();
  }
  
  //Affiche les images lutin
  void drawLutin() {
    _Game._win.drawImage(_img, _x, _y, _width, _height);
    _Game._win.closePath();
    _Game._win.stroke();
  }
  
  /*##############################################
   *  Toutes les fonctionnalités pour l'indroduction
   *##############################################*/
   
  //Affiche le nuage pour l introduction
  void drawNeigeIntroduction() {
    _Game._win.drawImage(_img, _x, _y, _width, _height);
    _Game._win.closePath();
    _Game._win.stroke();
    if (_Game._LUTINdirectionX > 0.0 || _statutIntro == true) {
     _statutIntro = true;
      _y--;
    }
  }
  
  /*##############################################
   *  Toutes les fonctionnalités pour le projectile
   *##############################################*/
  //Permet de mettre a jour la position du projectile
  void updatePositionProjectile() {
    _Game._Lprojectile[0]._x = _Game._Llutin[0]._x;
    _Game._Lprojectile[0]._y = _Game._Llutin[0]._y;
   }
  
 //Affiche le projectile
  void drawProjectile() {
    _Game._win.drawImage(_img, _Game._Llutin[0]._x, _Game._Llutin[0]._y, _width, _height);
    _Game._win.closePath();
    _Game._win.stroke();
    if (_Game._ProjectileDirectionX == true) 
      _y = _y - 3;
    if (_y <= 0.0)
      _Game._ProjectileDirectionX = false;
    CollisionGrinch(_Game._Lprojectile[0]._x,_Game._Lprojectile[0]._y,_Game._Lgrinch);
     
  }
 
 //Permet de tester si le projectile touche un grinch
  void CollisionGrinch(double Px, double Py, var list) {    
    for(int i=0;i<list.length;i++) {
      if (Px > list[i]._x && Px < list[i]._x + list[i]._width  && Py > list[i]._y && Py < list[i]._y + list[i]._height) {
        list[i]._img = document.query("#collision");
        document.query("#score").text = (_Game._SCORE_KILL += 10).toString();
       }
    }     
  }
  
   /*##############################################
   *  Fonctions générique pour les images 
   *##############################################*/
  void Stop_Animation() {
     window.closed;
  }
}
