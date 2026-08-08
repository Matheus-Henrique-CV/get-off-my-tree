//função de screenshake
function screenshake(_treme = 0)
{
        //checando se a instancia do objeto screenshake existe
    if instance_exists(obj_screenshake)
    {
        //passando para ele o valor de tremer
        obj_screenshake.shake = _treme
    }
}