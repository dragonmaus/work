home="$( cd "$( dirname "$0" )" && env - "PATH=$PATH" pwd )"

redo-ifchange "$2.c"
sed -En "s;^#[	 ]*include[	 ]+\"(.+)\".*$;$home/inc/\\1;p" < "$2.c" | sort -u > "$3"
