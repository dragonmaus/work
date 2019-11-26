ls "$2"* | sed -En 's/\.c(\.do)?$/.o/p' > "$3"
