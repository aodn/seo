<?xml version="1.0" encoding="UTF-8"?>

<!-- java -jar ../saxon9he.jar  ../records/argo_with_wb_and_lm.xml view.xsl -->

<!-- 
	Note that Saxon - doesn't like the SSL self-signed certificate when running in vagrant instance

-->
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:mcp="http://schemas.aodn.org.au/mcp-2.0"
  xmlns:gco="http://www.isotc211.org/2005/gco"
  xmlns:gmd="http://www.isotc211.org/2005/gmd"
  xmlns:gmx="http://www.isotc211.org/2005/gmx"

  exclude-result-prefixes="xsl mcp gco gmd gmx"
>


    <!-- xsl:variable name="href" select="http://10.11.12.13"/ -->

  <xsl:output method="html" indent="yes" omit-xml-declaration="yes" encoding="UTF-8" />

  <xsl:template match="mcp:MD_Metadata">

	 <!-- xsl:variable name="test" select="document('http://10.11.12.13/geonetwork/srv/en/xml.thesaurus.getList')"/ -->
	 
    <xsl:variable name="test" select="document('http://10.11.12.13/geonetwork/srv/en/xml.search.keywordlink?request=broader&amp;thesaurus=external.theme.parameterClassificationScheme&amp;id=http://vocab.nerc.ac.uk/collection/P01/current/PSLTZZ01')/response/narrower/descKeys/keyword/values/value[@language='eng']"  />

    <xsl:value-of select="$test" />
  </xsl:template>
</xsl:stylesheet>
