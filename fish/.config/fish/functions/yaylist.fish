function yaylist --description "list explicitly installed packages not in base/base-devel"
    comm -23 (pacman -Qqen | sort | psub) (begin; pacman -Qqg base-devel; expac -l '\n' '%E' base; end | sort | uniq | psub)
end
