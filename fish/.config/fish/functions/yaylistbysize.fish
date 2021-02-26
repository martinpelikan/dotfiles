function yaylistbysize --description "list explicitly installed packages with descriptions and install sizes sorted by install size"
  expac -H M "%011m\t%-20n\t%10d" (comm -23 (pacman -Qqen | sort | psub) (begin; pacman -Qqg base-devel; expac -l '\n' '%E' base; end | sort | uniq | psub)) | sort -n
end
