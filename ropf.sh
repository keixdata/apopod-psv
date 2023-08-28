# $1 = name of the ROPF file (without the extension)
# $2 = parties lower range
# $3 = parties upper range

wget "https://raw.githubusercontent.com/filipvanlaenen/apopod/main/$1.ropf"

UP=$(echo $1 | tr '[:lower:]' '[:upper:]')

PARTIES=$(seq $2 $3 | awk -v up="$UP" '{ if ($1 < 10) printf "%s00%s ", up, $1; else printf "%s0%s ", up, $1 }' | sed 's/,$//')
echo $PARTIES

java -jar target/asapop-1.0-SNAPSHOT-jar-with-dependencies.jar convert "$1.ropf" "$1.psv" $PARTIES