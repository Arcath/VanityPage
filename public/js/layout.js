$(function(){
	window_height = $(window).height();
	window_width = $(window).width();
	$('#background').attr("height", window_height);
	$('#background').attr("width", window_width);
	
	canvas = document.getElementById("background");
	context = canvas.getContext("2d");
	
	pixel_size = 25;
	pixel_gap = 5;
	
	clouds = [[50, 50, generate_cloud_map(10,10)],
	[200, 400, generate_cloud_map(5,6)],
	[1000, 400, generate_cloud_map(3,7)],
	[600, 500, generate_cloud_map(6,12)]];
	
	draw_clouds(canvas, context, clouds)
});

function generate_cloud_map(max_x, max_y){
	map = []
	for(var i = 0; i <= max_y; i++){
		map[i] = []
		for(var j= 0; j <= max_x; j++){
			number = (Math.floor(Math.random()*(max_x + max_y)));
			if(number >= ((max_x + max_y)/2)){
				map[i][j] = true;
			}else{
				map[i][j] = false;
			}
		}
	}
	return map
}

function draw_clouds(){
	canvas.width = canvas.width;
	widest = 0;
	for(var i = 0; i < clouds.length; i++){
		for(var j = 0; j < clouds[i][2].length; j++){
			for(var k = 0; k < clouds[i][2][j].length; k++){
				if(clouds[i][2][j][k] == true){
					context.fillStyle = "rgba(255, 255, 255, " + ((Math.floor(Math.random()*6)/10) + 0.5) + ")";
					context.fillRect((clouds[i][0] + (pixel_size * k) + (pixel_gap * k)), (clouds[i][1] + (pixel_size * j) + (pixel_gap * j)), pixel_size, pixel_size);
				}
			}
			if(clouds[i][2].length >= widest){
				widest = clouds[i][2].length;
			}
		}
		clouds[i][0] = clouds[i][0] + pixel_size + pixel_gap;
		
		if(clouds[i][0] >= window_width){
			clouds[i][0] = (0 - (pixel_size * widest) - (pixel_gap * widest));
		}
	}
	setTimeout("draw_clouds();", 1000);
}