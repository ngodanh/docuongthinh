<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Design online</title>
	<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" >
    <link href="${pageContext.request.contextPath}/resources/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/menu.css" rel="stylesheet" type="text/css" />
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/menuscript.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/three.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/ColladaLoader.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/Detector.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/stats.min.js"></script>
</head>
<body>
	<div class="header-container">
		<div class="row">
			<img src="/SpringMvcJdbcTemplate/resources/images/9874_logo_03.png" style="width: 200px; height: 100px">
			<ul id="nav" class="menuHeader">
		        <li><a href="${pageContext.request.contextPath}/">Trang chủ</a>
		        </li>
		        <li><a href="#">Giới thiệu</a>
		        </li>
		        <li><a href="#">Sản phẩm</a>
		            <ul>
		                <li><a href="#">Tủ</a></li>
		                <li><a href="#">Ghế</a></li>
		                <li><a href="#">Bàn ăn</a></li>
		            </ul>
		        </li>
		        <li><a href="${pageContext.request.contextPath}/design-online">Thiết kế online</a></li>
		        <li><a href="#">Tin tức</a></li>
		        <li><a href="#">Liên hệ</a></li>
		    </ul>
	    </div>
	</div>
	<div class="designOnline" id="bodyWrapper">
	    <script src="${pageContext.request.contextPath}/resources/js/OrbitControls.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/js/JDLoader.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/js/EventsControls.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/js/OBJLoader.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/js/MTLLoader.js"></script>
	    <div id="container"></div>	    
	    
	    <script>

		var camera, scene, renderer, controls; 
		var model;

		var particleCount = 100;
		var particleSystem;
		var isMoving = false;

		init();
		animate();

		function init() {
			var width = $("#bodyWrapper").width();
			var height = $("#bodyWrapper").height();
			container = document.getElementById( 'container' );

			renderer = new THREE.WebGLRenderer( { antialias: true } ); 
			renderer.setClearColor( 0x6495ED );
			// renderer.setSize( window.innerWidth, window.innerHeight );				
			// document.body.appendChild( renderer.domElement );
			renderer.setSize( width, height );
			container.appendChild( renderer.domElement );

			//

			camera = new THREE.PerspectiveCamera( 30, window.innerWidth / window.innerHeight, 1, 2000 );				
			camera.position.set( 100, 400, 600 );
			camera.lookAt( new THREE.Vector3( 0, 0, 0 ) );

			controls = new THREE.OrbitControls( camera, renderer.domElement );
			/* controls.rotateSpeed = 1;
			controls.noZoom = false;
			controls.zoomSpeed = 1.2;
			controls.staticMoving = true;
			controls.minPolarAngle = Math.PI / 3;
			controls.maxPolarAngle = Math.PI / 3; */

			scene = new THREE.Scene();

			var light = new THREE.DirectionalLight( 0xffffff, 1 );
			light.position.set( 0, 500, 1000 );
			scene.add( light );

			var light = new THREE.AmbientLight( 0x222222 );
			scene.add( light );


			// world
			var img = "./resources/images/checkerboard1.jpg";
			var Texture = new THREE.ImageUtils.loadTexture( img );
			Texture.wrapS = Texture.wrapT = THREE.RepeatWrapping;
			Texture.repeat.set( 4, 4 );
			Texture.offset.set( 0.5, 0 );

			var Material = new THREE.MeshBasicMaterial( { map: Texture, side: THREE.DoubleSide } );
			var Geometry = new THREE.PlaneBufferGeometry( 400, 400, 1, 1 );

			var checkerboard = new THREE.Mesh( Geometry, Material );
			checkerboard.position.y = - 1;
			checkerboard.rotation.x =  Math.PI / 2;
			scene.add( checkerboard );


			EventsControls1 = new EventsControls( camera, renderer.domElement );
			EventsControls1.map = checkerboard;
			EventsControls1.offsetUse = true;

			EventsControls1.attachEvent( 'onclick', function() {

				console.log( 'this.focused.name: ' + this.focused.name );

			});

			EventsControls1.attachEvent( 'mouseOver', function () {

				this.container.style.cursor = 'pointer';

			});

			EventsControls1.attachEvent( 'mouseOut', function () {

				this.container.style.cursor = 'auto';

			});

			EventsControls1.attachEvent( 'dragAndDrop', function () {
				this.container.style.cursor = 'move';
				this.focused.position.y = this.previous.y;

			});

			EventsControls1.attachEvent( 'mouseUp', function () {

				this.container.style.cursor = 'auto';

			});

			EventsControls2 = new EventsControls( camera, renderer.domElement );
			EventsControls2.map = checkerboard;	

			EventsControls2.attachEvent( 'mouseOver', function () {

				this.container.style.cursor = 'pointer';
			});

			EventsControls2.attachEvent( 'mouseOut', function () {

				this.container.style.cursor = 'auto';
				controls.enabled = true;
			});

			EventsControls2.attachEvent( 'dragAndDrop', function () {
				this.container.style.cursor = 'move';
				this.focused.position.y = this.previous.y;
				controls.enabled = false;
			});

			EventsControls2.attachEvent( 'mouseUp', function () {
				controls.enabled = true;
			});
			var Scale = new THREE.Vector3( 20, 20, 20 );
			// EventsControls2.scale.copy( Scale );
			EventsControls2.offsetUse = true;

			/* var loader = new THREE.ColladaLoader();	
			loader.options.convertUpAxis = true;
			var urlImg = "./resources/models/model.dae";
			loader.load( urlImg, function ( collada ) {
				var dae = collada.scene;
				dae.position.set(0,0,0);
				//dae.scale.set( 1/Scale.x, 1/Scale.y, 1/Scale.z );
				dae.scale.set( 1, 1, 1 );
				
				dae.updateMatrix();

				scene.add(dae); 
				EventsControls2.attach( dae );
			}); */
			
			var onProgress = function ( xhr ) {
				if ( xhr.lengthComputable ) {
					var percentComplete = xhr.loaded / xhr.total * 100;
					console.log( Math.round(percentComplete, 2) + '% downloaded' );
				}
			};
			var onError = function ( xhr ) { };
			
			var mtlLoader = new THREE.MTLLoader();
			mtlLoader.setPath( './resources/models/lightchair.obj/' );
			mtlLoader.load( '3d-model.mtl', function( materials ) {
				materials.preload();
				var objLoader = new THREE.OBJLoader();
				objLoader.setMaterials( materials );
				objLoader.setPath( './resources/models/lightchair.obj/' );
				objLoader.load( '3d-model.obj', function ( object ) {
					object.position.y = - 1;
					object.position.x = 50;
					scene.add( object );
					EventsControls2.attach( object );
				}, onProgress, onError );
			});

			EventsControls3 = new EventsControls( camera, renderer.domElement );
			EventsControls3.attach( checkerboard );

			EventsControls3.attachEvent( 'mouseOver', function () {
				controls.enabled = true;
			});
			/* EventsControls3.attachEvent( 'dragAndDrop', function () {
				controls.enabled = true;
			}); */

			EventsControls3.attachEvent( 'mouseOut', function () {
				controls.enabled = true;

			});

		}

		function addModelToScene( geometry, materials ) {

			var material = new THREE.MeshFaceMaterial( materials );
			model = new THREE.Mesh( geometry, material );
			model.scale.set( 10, 10, 10 ); model.name = 'Tux';
			model.rotation.x = -Math.PI/2; 
			model.position.set( -75, 45, 175  );
			scene.add( model ); EventsControls1.attach( model );

		}


		function animate() {

				requestAnimationFrame(animate);
				render();

		}


		function render() {

				EventsControls1.update();
				EventsControls3.update();

				controls.update();
				renderer.render(scene, camera);

		}

		</script>
	    
	    
	    
	    
	    
	</div>
</body>
</html>