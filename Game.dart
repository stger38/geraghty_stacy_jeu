part of libcrac;

/*##############################################
 *  Variables pour la classe Game
 *##############################################*/
class Game {
  static const LEFT  = 37;
  static const RIGHT = 39;
  static const SPACE = 32;

  //Permet de définir l'avancement du lutin
  double _LUTINdirectionX = 0.0;
  double _LUTINavancementX = 40.0;

  //Permet de définir le score pour un grinch
  int _SCORE_KILL = 0;

  //Permet de régler la vitesse de la boule de neige
  bool _ProjectileDirectionX = false;

  double _x = 0.0;
  double _y = 0.0;
  double _width;
  double _height;

  var _Lgift = [];
  var _Lgrinch = [];
  var _Llutin = [];
  var _Lintroduction = [];
  var _Lprojectile = [];
  var _Lcollision = [];

  CanvasRenderingContext2D _win;

  /*##############################################
   *  Constructeur pour la classe Game
   *##############################################*/
  Game(CanvasElement canvas) {
    _win = canvas.getContext('2d');
    _width = canvas.width.toDouble();
    _height = canvas.height.toDouble();
    contourCanvas();
    init();
    window.setInterval(redraw, 4);
    }

  /*##############################################
   *  Fonction générique de la classe Game
   *##############################################*/
  // Permer de crée le tracé le contour du canvas
  void contourCanvas() {
    _win.beginPath();
    _win.closePath();
    _win.stroke();
  }

  // Création des images du jeux à diffrente positions
  void init() {
    _Lgrinch.add(new Image(this, 100.0, 100.0, 20.0, 10.0,'#grinch',600.0, 0.5, 'grinch', true));
    _Lgrinch.add(new Image(this, 500.0, -240.0, 20.0, 20.0,'#grinch',600.0, 0.5, 'grinch', true));
    _Lgrinch.add(new Image(this, 300.0, -70.0, 30.0, 30.0,'#grinch',600.0, 0.5, 'grinch', true));
    _Lgrinch.add(new Image(this, 200.0, 10.0, 50.0, 50.0,'#grinch',600.0, 0.5, 'grinch', true));
    _Lgrinch.add(new Image(this, 130.0, -200.0, 50.0, 50.0,'#grinch',600.0, 0.5, 'grinch', true));
    _Lgrinch.add(new Image(this, 550.0, -120.0, 30.0, 30.0,'#grinch',600.0, 0.5, 'grinch', true));
    _Lgrinch.add(new Image(this, 100.0, 100.0, 20.0, 20.0,'#grinch',600.0, 0.5, 'grinch', true));
    _Lgrinch.add(new Image(this, 500.0, -240.0, 20.0, 10.0,'#grinch',600.0, 0.5, 'grinch', true));
    _Lgrinch.add(new Image(this, 300.0, -70.0, 50.0, 50.0,'#grinch',600.0, 0.5, 'grinch', true));
    _Lgrinch.add(new Image(this, 200.0, 10.0, 40.0, 40.0,'#grinch',600.0, 0.5, 'grinch', true));
    _Lgrinch.add(new Image(this, 130.0, -200.0, 60.0, 60.0,'#grinch',600.0, 0.5, 'grinch', true));
    _Lgrinch.add(new Image(this, 550.0, -120.0, 40.0, 40.0,'#grinch',600.0, 0.5, 'grinch', true));
    _Lgrinch.add(new Image(this, 100.0, 100.0, 20.0, 20.0,'#grinch',600.0, 0.5, 'grinch', true));
    _Lgrinch.add(new Image(this, 500.0, -240.0, 30.0, 30.0,'#grinch',600.0, 0.5, 'grinch', true));
    _Lgrinch.add(new Image(this, 300.0, -70.0, 80.0, 80.0,'#grinch',600.0, 0.5, 'grinch', true));

    _Lgift.add(new Image(this, 100.0, -30.0, 5.0, 5.0,'#gift',900.0, 0.3, 'gift', true));
    _Lgift.add(new Image(this, 600.0, -490.0, 0.0, 10.0,'#gift',900.0, 0.3, 'gift', true));
    _Lgift.add(new Image(this, 800.0, -90.0, 20.0, 20.0,'#gift',900.0, 0.3, 'gift', true));
    _Lgift.add(new Image(this, 200.0, -120.0, 30.0, 30.0,'#gift',900.0, 0.3, 'gift', true));
    _Lgift.add(new Image(this, 700.0, -240.0, 40.0, 40.0,'#gift',900.0, 0.3, 'gift', true));
    _Lgift.add(new Image(this, 300.0, -350.0, 70.0, 70.0,'#gift',900.0, 0.3, 'gift', true));
    _Lgift.add(new Image(this, 100.0, -30.0, 60.0, 60.0,'#gift',900.0, 0.3, 'gift', true));
    _Lgift.add(new Image(this, 600.0, -490.0, 40.0, 50.0,'#gift',900.0, 0.3, 'gift', true));
    _Lgift.add(new Image(this, 800.0, -90.0, 30.0, 30.0,'#gift',900.0, 0.3, 'gift', true));
    _Lgift.add(new Image(this, 200.0, -120.0, 20.0, 20.0,'#gift',900.0, 0.3, 'gift', true));
    _Lgift.add(new Image(this, 700.0, -240.0, 10.0, 10.0,'#gift',900.0, 0.3, 'gift', true));
    _Lgift.add(new Image(this, 300.0, -350.0, 20.0, 20.0,'#gift',900.0, 0.3, 'gift', true));
    _Lgift.add(new Image(this, 100.0, -30.0, 30.0, 30.0,'#gift',900.0, 0.3, 'gift', true));
    _Lgift.add(new Image(this, 600.0, -490.0, 40.0, 40.0,'#gift',900.0, 0.3, 'gift', true));
    _Lgift.add(new Image(this, 800.0, -90.0, 50.0, 50.0,'#gift',900.0, 0.3, 'gift', true));
    _Lgift.add(new Image(this, 200.0, -120.0, 60.0, 60.0,'#gift',900.0, 0.3, 'gift', true));
    _Lgift.add(new Image(this, 700.0, -240.0, 70.0, 70.0,'#gift',900.0, 0.3, 'gift', true));

    _Llutin.add(new Image(this, 0.0, 520.0, 70.0, 70.0,'#lutin',900.0, 0.0, 'lutin', true));
    _Lintroduction.add(new Image(this, 0.0, 520.0, 70.0, 70.0,'#neige',900.0, 0.0, 'introduction', true));
    _Lprojectile.add(new Image(this, 0.0, 520.0, 10.0, 10.0,'#neige',900.0, 0.0, 'proj', true));

    //_Lcollision.add(new Image(this, 0.0, 520.0, 50.0, 50.0,'#collision',900.0, 0.0, 'collision', true));

    window.on.keyDown.add(printCodePressKey, false);
    }


  //Fonction de controle du clavier
  void printCodePressKey(KeyboardEvent e) {
    if (e.keyCode == LEFT) {
      _LUTINdirectionX = _LUTINdirectionX - _LUTINavancementX;
    }
    else if (e.keyCode == RIGHT) {
      _LUTINdirectionX = _LUTINdirectionX + _LUTINavancementX;
    }
    else if (e.keyCode == SPACE) {
        _ProjectileDirectionX = true;
        _Lprojectile[0].updatePositionProjectile();
        _Lprojectile[0]._y = 520.0;
    }
    //print('DEBUG => Le code de la touche clavier pressé est ${e.keyCode}');
  }

  //Fonction qui dessine/affiche les images sur le canvas
  void drawList(var List) {
    for(int i=0;i<List.length;i++) {
      List[i].drawGift();
     }
  }

  //Fonction qui permet de redessiner les imagess
  void redraw() {
    wash();
    drawList(_Lgift);
    drawList(_Lgrinch);
    drawList(_Lintroduction);
    drawList(_Llutin);
    drawList(_Lprojectile);
   // drawList(_Lcollision);
  }

  //Permet de nettoyer le canvas
  void wash() {
    _win.clearRect(_x, _y, _width, _height);
    contourCanvas();
  }
}
