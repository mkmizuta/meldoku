(function(){
  document.addEventListener( "DOMContentLoaded", function( e ){   
    var canvas = document.querySelector( "#canvas1" ); 
    var context = canvas.getContext( "2d" ); 
    var radToCart = function( radiusLength, radians ){
      var coords = {
        x: radiusLength/2 * Math.cos( radians/2 ),
        y: radiusLength/2 * Math.sin( radians/2 )
      };
      return coords;
    };

    var x = canvas.width/2;
    var y = canvas.height/2;
    var getRadius = function( orgX, orgY ){
      if( orgX > orgY ){
        return orgY;
      }
      return orgX;
    };

    var radius = getRadius( x, y );
    var counterClockwise = false;   
    var fillcolor = "papayawhip";
    var newEl = document.querySelector( "#new" );  
    var returnEl = document.querySelector( "#return" );
    var newVis = parseInt( newEl.innerHTML, 10 );  
    var retVis = parseInt( returnEl.innerHTML, 10 );
    var totalVis = newVis + retVis;

    var newPerc = Math.round((newVis/totalVis) * 100);
    var retPerc = 100 - newPerc;

    var newInRad = (newVis/totalVis)* 2 * Math.PI;
    var retInRad = (retVis/totalVis)* 2 * Math.PI;

    var startDeg = 0;
    var endDeg = newInRad;

    context.beginPath();
    context.moveTo( x, y ); 

    context.arc( x, y, radius, startDeg, endDeg, counterClockwise );
    context.closePath();
    context.fillStyle = fillcolor;
    context.fill();

    fillcolor = "cornflowerblue";
    startDeg = endDeg;
    endDeg = 0;

    context.beginPath();
    context.moveTo( x, y ); 

    context.arc( x, y, radius, startDeg, endDeg, counterClockwise );
    context.closePath();
    context.fillStyle = fillcolor;
    context.fill();

    context.strokeStyle = "black";
    context.fillStyle = "black";
    context.font = "20pt Helvetica";

    var newPercCoords = radToCart( radius, newInRad );
    context.fillText( newPerc + "%", x+newPercCoords.x, y+newPercCoords.y );
    context.strokeText( newPerc + "%", x+newPercCoords.x, y+newPercCoords.y );

    var retPercCoords = radToCart( radius, retInRad );
    context.fillText( retPerc + "%", x+retPercCoords.x, y-retPercCoords.y );
    context.strokeText( retPerc + "%", x+retPercCoords.x, y-retPercCoords.y );  
  });
})();


(function(){
  document.addEventListener( "DOMContentLoaded", function( e ){  

  var canvas = document.querySelector( "#canvas2" );

  var context = canvas.getContext( '2d' );
  var drawBarRect = function( height, color, xCoord ){
    
    context.beginPath();

    var rectWidth = 50;
    var rectHeight = height;    
    var x = xCoord;  
    var y = canvas.height - rectHeight;

    context.rect( x, y, rectWidth, rectHeight );

    context.fillStyle = color;
    context.fill( );
  };

  var chrome = document.querySelector( "#chrome" );  
  var firefox = document.querySelector( "#firefox" );
  var safari = document.querySelector( "#safari" );
  
  var chrome = parseInt( chrome.innerHTML, 10 );  
  var firefox = parseInt( firefox.innerHTML, 10 );
  var safari = parseInt( safari.innerHTML, 10 );
  
  drawBarRect( chrome, "powderblue", 20 );
  drawBarRect( firefox, "mediumseagreen", 80 );
  drawBarRect( safari, "peru", 140 );
  
  context.fillStyle = "black";
  context.fillText("Chrome", 27, 190 );
  context.fillText("Firefox", 90, 190 );
  context.fillText("Safari", 150, 190 );
  });  
})();