stage = {}
stage.map = {}

function stage.init()
		--load stage data
	
		stage.map[1] = {
						{1, 1, 1, 1, 1, 1, 1, 1, 1},
						{1, 1, 1, 1, 0, 1, 1, 1, 1}, 
						{1, 1, 1, 1, 0, 1, 1, 1, 1}, 
						{1, 1, 1, 1, 0, 1, 1, 1, 1}, 
						{1, 0, 0, 0, 0, 0, 0, 0, 1}, 
						{1, 1, 1, 0, 0, 0, 1, 1, 1}, 
						{1, 1, 1, 0, 0, 0, 1, 1, 1}, 
						{1, 1, 1, 0, 0, 0, 1, 1, 1}, 
						{1, 1, 1, 1, 1, 1, 1, 1, 1}
						}
					
	stage.map[2] = {
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 0, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 0, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 1, 1, 1, 0, 1, 1, 0, 1}, 
					{1, 0, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 0, 1, 1, 0, 1, 1, 1, 1}, 
					{1, 0, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 0, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}
					}
					
	stage.map[3] = {
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 1, 0, 0, 1, 1, 1, 1, 1}, 
					{1, 1, 0, 0, 1, 1, 1, 1, 1}, 
					{1, 1, 0, 0, 1, 1, 1, 1, 1}, 
					{1, 1, 1, 0, 0, 0, 1, 1, 1}, 
					{1, 1, 0, 0, 0, 0, 1, 1, 1}, 
					{1, 1, 0, 0, 0, 0, 1, 1, 1},
					{1, 1, 1, 1, 1, 1, 1, 1, 1}
					}
	stage.map[4] = {
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 1, 1, 1, 0, 0, 1, 1, 1}, 
					{1, 1, 1, 0, 0, 0, 1, 1, 1}, 
					{1, 1, 1, 0, 0, 0, 1, 1, 1}, 
					{1, 1, 1, 0, 0, 0, 1, 1, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}
					}
	stage.map[5] = {
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 1, 1, 1, 0, 0, 1, 1, 1}, 
					{1, 1, 1, 0, 0, 0, 1, 1, 1}, 
					{1, 1, 0, 0, 0, 0, 1, 1, 1}, 
					{1, 1, 0, 0, 0, 1, 1, 1, 1}, 
					{1, 1, 0, 0, 0, 0, 1, 1, 1}, 
					{1, 1, 0, 0, 0, 0, 1, 1, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}
					}
	stage.map[6] = {
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 0, 1, 0, 1, 0, 1, 0, 1}, 
					{1, 0, 1, 0, 1, 0, 1, 0, 1}, 
					{1, 0, 1, 0, 1, 0, 1, 0, 1}, 
					{1, 0, 1, 0, 0, 0, 1, 0, 1}, 
					{1, 0, 1, 0, 1, 0, 1, 0, 1}, 
					{1, 0, 1, 0, 1, 0, 1, 0, 1}, 
					{1, 0, 0, 0, 1, 0, 0, 0, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}
					}
	stage.map[7] = {
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 1, 1, 1, 0, 1, 1, 1, 1}, 
					{1, 1, 1, 1, 0, 1, 1, 1, 1}, 
					{1, 1, 1, 1, 0, 1, 1, 1, 1}, 
					{1, 0, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 1, 1, 1, 0, 1, 1, 1, 1}, 
					{1, 1, 1, 1, 0, 1, 1, 1, 1}, 
					{1, 1, 1, 1, 0, 1, 1, 1, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}
					}
	stage.map[8] = {
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 1, 0, 0, 0, 0, 0, 1, 1}, 
					{1, 1, 0, 0, 0, 0, 0, 1, 1}, 
					{1, 1, 0, 0, 0, 0, 0, 1, 1}, 
					{1, 1, 1, 1, 0, 1, 1, 1, 1}, 
					{1, 1, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 1, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}
					}
	stage.map[9] = {
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 0, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 0, 0, 1, 0, 1, 0, 0, 1}, 
					{1, 0, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 0, 0, 0, 1, 0, 0, 0, 1}, 
					{1, 0, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 0, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 0, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}
					}
	stage.map[10] = {
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 1, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 1, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 1, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 1, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 1, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 1, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 1, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}
					}
	stage.map[11] = {
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 1, 1, 1, 1, 0, 0, 0, 1}, 
					{1, 0, 0, 1, 1, 0, 0, 0, 1}, 
					{1, 0, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 0, 0, 0, 1, 1, 1, 1, 1}, 
					{1, 1, 1, 0, 1, 1, 1, 1, 1}, 
					{1, 0, 0, 0, 1, 1, 1, 1, 1}, 
					{1, 0, 0, 0, 0, 0, 1, 1, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}
					}
	stage.map[12] = {
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 1, 1, 1, 0, 0, 1, 1, 1}, 
					{1, 0, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 0, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 1, 1, 0, 0, 1, 1, 1, 1}, 
					{1, 0, 0, 0, 0, 0, 1, 1, 1}, 
					{1, 0, 0, 0, 0, 0, 1, 1, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}
					}
	stage.map[13] = {
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 1, 0, 0, 0, 0, 1, 1, 1}, 
					{1, 1, 0, 1, 1, 0, 0, 0, 1}, 
					{1, 1, 0, 1, 0, 0, 0, 0, 1}, 
					{1, 1, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 1, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 1, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}
					}
	stage.map[14] = {
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 1, 0, 0, 1, 0, 0, 1, 1}, 
					{1, 1, 0, 0, 1, 0, 0, 1, 1}, 
					{1, 1, 0, 0, 0, 0, 0, 1, 1}, 
					{1, 1, 0, 0, 0, 0, 0, 1, 1}, 
					{1, 1, 0, 0, 1, 0, 0, 1, 1}, 
					{1, 1, 0, 0, 1, 0, 0, 1, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}
					}
	stage.map[15] = {
					{1, 1, 1, 1, 1, 1, 1, 1, 1}, 
					{1, 0, 0, 0, 1, 0, 0, 0, 1}, 
					{1, 0, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 0, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 1, 0, 0, 0, 0, 0, 1, 1}, 
					{1, 0, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 0, 0, 0, 0, 0, 0, 0, 1}, 
					{1, 0, 0, 0, 1, 0, 0, 0, 1}, 
					{1, 1, 1, 1, 1, 1, 1, 1, 1}
					}
					
end