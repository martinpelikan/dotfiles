# Defined in - @ line 1
function yayclean --wraps='yay -Qtdq | yay -Rns -' --description 'alias yayclean=yay -Qtdq | yay -Rns -'
  yay -Qtdq | yay -Rns - $argv;
end
