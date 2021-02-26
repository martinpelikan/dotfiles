# Defined in - @ line 1
function l --wraps='exa -la' --description 'alias l=exa -la'
  exa -la $argv;
end
