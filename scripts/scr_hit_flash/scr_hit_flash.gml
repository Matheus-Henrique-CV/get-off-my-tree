//Inicia no evento CREATE 
function inicia_hit_flash()
{
	xscale = 1;
	yscale = 1;
	dir = 1;
	
	alpha_brilho = 0;
	cor_brilho = c_white;
}

//Aplica no momento em que o efeito HIT FLASH deve acontecer
//Pode escolher uma cor para o efeito como parâmetro
function aplica_hit_flash(_cor = c_white, _intensidade = 1)
{
	alpha_brilho = _intensidade;	
	cor_brilho = _cor;
}

//Coloque essa função no STEP para o brilho sair.
function finaliza_hit_flash(_intensidade = 0.5)
{
	alpha_brilho = lerp(alpha_brilho, 0, _intensidade);		
}

//Coloque essa função no DRAW
function desenha_hit_flash()
{
	//A sprite original é desenhada sempre
	draw_sprite_ext(sprite_index, image_index, x, y, xscale*dir, yscale, image_angle, image_blend, 1);
	
	//O efeito só é ativado quando o ALPHA for maior do que 0
	if(alpha_brilho <= 0.01) return;
	
	shader_set(sh_hit_flash);
	draw_sprite_ext(sprite_index, image_index, x, y, xscale*dir, yscale, image_angle, cor_brilho, alpha_brilho);
	shader_reset();
}