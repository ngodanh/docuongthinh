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
	    <div id="container"></div>	    
	    
	    <script>

			if ( ! Detector.webgl ) Detector.addGetWebGLMessage();

			var container, stats;
			var camera, scene, renderer, controls;

			init();
			animate();

			function init() {
				var width = $("#bodyWrapper").width();
				var height = $("#bodyWrapper").height();

				container = document.getElementById( 'container' );

				camera = new THREE.PerspectiveCamera( 45, window.innerWidth / window.innerHeight, 1, 2000 );
				camera.position.set( 7, 5, 7 );

				scene = new THREE.Scene();

				// collada

				var loader = new THREE.ColladaLoader();
				loader.options.convertUpAxis = true;
				var urlImg = "./resources/models/model.dae";
				loader.load( urlImg, function ( collada ) {
				// loader.load( './models/collada/monster/monster.dae', function ( collada ) {

					var object = collada.scene;

					/* object.scale.set( 0.0025, 0.0025, 0.0025 ); */
					object.scale.set( 0.05, 0.05, 0.05 );
					object.position.set( - 2, 0.2, 0 );

					scene.add( object );

				} );

				// Background 3D

				var gridHelper = new THREE.GridHelper( 10, 10 );
				scene.add( gridHelper );
				
				/* var light = new THREE.RectAreaLight( 0xffffbb, 1.0, 5, 5 );
				var helper = new THREE.RectAreaLightHelper( light );
				scene.add( helper ); */

				//

				var ambientLight = new THREE.AmbientLight( 0xcccccc );
				scene.add( ambientLight );

				var directionalLight = new THREE.DirectionalLight( 0xffffff );
				directionalLight.position.set( 0, 1, -1 ).normalize();
				scene.add( directionalLight );

				//

				renderer = new THREE.WebGLRenderer();
				renderer.setPixelRatio( window.devicePixelRatio );
				// Set size for DOM
				renderer.setSize( width, height );
				container.appendChild( renderer.domElement );

				//

				controls = new THREE.OrbitControls( camera, renderer.domElement );

				//

				// stats = new Stats();
				// container.appendChild( stats.dom );

				//

				window.addEventListener( 'resize', onWindowResize, false );

			}

			function onWindowResize() {

				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();

				renderer.setSize( window.innerWidth, window.innerHeight );

			}

			function animate() {

				requestAnimationFrame( animate );

				render();
				// stats.update();

			}

			function render() {

				renderer.render( scene, camera );

			}

		</script>
	    
	    
	    
	    
	    
	</div>
</body>
</html>