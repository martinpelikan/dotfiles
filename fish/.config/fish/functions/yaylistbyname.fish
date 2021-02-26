function yaylistbyname --description "list explicitly installed packages with descriptions and install sizes sorted by name"
  expac -H M "%-20n\t%011m\t%10d" (comm -23 (pacman -Qqen | sort | psub) (begin; pacman -Qqg base-devel; expac -l '\n' '%E' base; end | sort | uniq | psub)) | sort
end
