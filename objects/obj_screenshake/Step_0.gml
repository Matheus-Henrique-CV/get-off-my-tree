//shakendo a tela
//alterando a posição x e y do viewport com base no valor do shake
if shake != 0.1
{
    var _x = random_range(-shake, shake)
    var _y = random_range(-shake, shake)
    //alterando a posição do x do viewport
    view_set_xport(view_current, _x);
    
    view_set_yport(view_current, _y)
}else{//cheguei perto de 0, eu zero o valor do shake
    shake = 0
    
    //garanto que a posição da minha view é zerada tbm
    view_set_xport(view_current, 0);
    view_set_yport(view_current, 0);
}
     


//parando de shaker de pouco em pouco
shake = lerp(shake, 0, 0.3);