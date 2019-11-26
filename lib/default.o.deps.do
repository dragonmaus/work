redo-ifchange "$2.c"
sed -En 's;^[	 ]*#[	 ]*include[	 ]+"(.+)".*$;../inc/\1;p' < "$2.c" | sort -u > "$3"
