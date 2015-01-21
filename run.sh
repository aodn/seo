set -x

rm output* -rf 2> /dev/null

java -jar lib/saxon9he.jar  src/dummy.xml src/records-process.xsl
cp src/imos.css output
tar czf output.tgz output/
