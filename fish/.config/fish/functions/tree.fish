# Defined in - @ line 1
function tree --wraps='exa -T' --description 'alias tree=exa -T'
  exa -T $argv;
end
