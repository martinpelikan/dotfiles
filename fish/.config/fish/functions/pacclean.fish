function pacclean --description 'Remove orphaned pacman packages'
	pacaur -Rsn (pacman -Qdtq) $argv;
end
