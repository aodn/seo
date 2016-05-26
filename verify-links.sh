#!/bin/bash
#
# a little utility to verify generated SEO links
#
# in order to grab the broken links after execution, run:
# grep -v " 200$" output_file | cut -d' ' -f1
#

declare -r BASE_URL="https://portal.aodn.org.au"

# main
main() {
    tmp_links=`mktemp`
    curl -s "$base_url/data_collections.html" | grep "<h3><a href" | cut -d'"' -f2 > $tmp_links && \
    for link in `cat $tmp_links`; do
        echo -n "$link "
        curl -s -w "%{http_code}\n" -o /dev/null "$base_url/$link"
    done
    rm -f $tmp_links
}

main "$@"
