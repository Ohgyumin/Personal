<html>
  <head>
    <title>Chobo painter</title>
    <style>
      canvas {
        border: 1px solid blue;
      }

      .jb_table {
        display: table;
      }

      .row {
        border-radius: 10px;
        display: table-row;
      }

      .cell {
        display: table-cell;
        vertical-align: top;
      }

      textarea {
        background-color: #fcf3cf;
      }
    </style>
  </head>

  <body>
    <div class="jb_table">
      <div class="row">
        <span class="cell" width="82">
          <div>
            <div class="jb_table">
              <div class="row">
                <span class="cell">
                  <img src="img/red.png" onclick="selectColor('red')" />
                  <img src="img/orange.png" onclick="selectColor('orange')"/>
                </span>
              </div>
              <div class="row">
                <span class="cell">
                  <img src="img/yellow.png" onclick="selectColor('yellow')" />
                  <img src="img/green.png" onclick="selectColor('green')"/>
                </span>
              </div>
              <div class="row">
                <span class="cell">
                  <img src="img/blue.png" onclick="selectColor('blue')" />
                  <img src="img/lightblue.png" onclick="selectColor('lightblue')" />
                </span>
              </div>
              <div class="row">
                <span class="cell">
                  <img src="img/lightgreen.png" onclick="selectColor('lightgreen')"/>
                  <img src="img/brown.png" onclick="selectColor('brown')"/>
                </span>
              </div>
              <div class="row">
                <span class="cell">
                  <img src="img/purple.png" onclick="selectColor('purple')" />
                  <img src="img/pink.png" onclick="selectColor('pink')"/>
                </span>
              </div>
              <div class="row">
                <span class="cell">
                  <img src="img/gray.png" onclick="selectColor('gray')" />
                  <img src="img/lightgray.png" onclick="selectColor('lightgray')"/>
                </span>
              </div>
              <div class="row">
                <span class="cell">
                  <img src="img/black.png" onclick="selectColor('black')"/>
                  <img src="img/white.png" onclick="selectColor('white')"/>
                </span>
              </div>
              <div class="row">
                <span class="cell">
                  <img src="img/pencil.png" />
                  <img src="img/line.png" />
                </span>
              </div>
              <div class="row">
                <span class="cell">
                  <img src="img/circle.png" />
                  <img src="img/filledcircle.png" />
                </span>
              </div>
              <div class="row">
                <span class="cell">
                  <img src="img/square.png" />
                  <img src="img/filledsquare.png" />
                </span>
              </div>
              <div class="row">
                <span class="cell">
                  <img src="img/rect.png" />
                  <img src="img/filledrect.png" />
                </span>
              </div>
              <div class="row">
                <span class="cell">
                  <img src="img/triangle.png" />
                  <img src="img/filledtriangle.png" />
                </span>
              </div>
              <div class="row">
                  <span class="cell">
                    <img src="img/undo.png" />
                    <img src="img/redo.png" />
                  </span>
                </div>
            </div>
          </div>
        </span>
        <span class="cell">
          <div>
            <canvas id="canvas" width="720" height="720"></canvas>
          </div>
        </span>
        <span class="cell">
          <INPUT type="file" id="load_filename" value="Load" />
          <div>Title <input id="title" size="15" /></div>
        </span>
      </div>
    </div>
    <script src="painter.js"></script>
  </body>
</html>