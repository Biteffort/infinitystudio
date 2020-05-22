
// Get User selected 3D Model
function 3dmodel(url){
    console.log(url);
}

// Create Canvas
function alertMessage(width,height) {
    //alert(text)
console.log(width);

var canvas = document.createElement('canvas');

canvas.id = "CursorLayer";
canvas.width = width;
canvas.height = height;
canvas.style.zIndex = 8;
canvas.style.position = "absolute";
canvas.style.border = "0px solid";


var body = document.getElementsByTagName("body")[0];
body.appendChild(canvas);

cursorLayer = document.getElementById("CursorLayer");
console.log(cursorLayer);
// below is optional
var ctx = canvas.getContext("2d");
ctx.fillStyle = "rgba(237, 237, 237, 0.8)";
ctx.fillRect(430, 70, width/1.8, height);
ctx.setSize()

/* var x = document.createElement("CANVAS");
  var ctx = x.getContext("2d");
  ctx.fillStyle = "#000000";
  ctx.fillRect(20, 20, 150, 100);
  document.body.appendChild(x);*/
}

window.logger = (flutter_value) => {
   console.log({ js_context: this, flutter_value });
}

window.state = {
    hello: 'world'
}
/*

 // Create new scene
function load(){

//alert('Hello')

animate();
}


var scene = new THREE.Scene();
var camera = new THREE.PerspectiveCamera( 75, window.innerWidth/window.innerHeight, 0.1, 1000 );

var renderer = new THREE.WebGLRenderer();
renderer.setSize( window.innerWidth, window.innerHeight );
document.body.appendChild( renderer.domElement );

var geometry = new THREE.BoxGeometry( 1, 1, 1 );
var material = new THREE.MeshBasicMaterial( { color: 0x00ff00 } );
var cube = new THREE.Mesh( geometry, material );
scene.add( cube );

camera.position.z = 5;

var animate = function () {
	requestAnimationFrame( animate );

	cube.rotation.x += 0.01;
	cube.rotation.y += 0.01;

	renderer.render( scene, camera );
};*/
