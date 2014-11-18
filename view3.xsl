<?xml version="1.0" encoding="UTF-8"?>

<!-- TODO shouldn't have all this in the output -->
<xsl:stylesheet version="2.0"
  xmlns:mcp="http://schemas.aodn.org.au/mcp-2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:gco="http://www.isotc211.org/2005/gco"
  xmlns:gmd="http://www.isotc211.org/2005/gmd"
  xmlns:gmx="http://www.isotc211.org/2005/gmx"
>


  <xsl:template match="mcp:MD_Metadata">

      <!-- Data identification is a common root and should be factored -->
      <xsl:variable name="waterBodies" select="gmd:identificationInfo/mcp:MD_DataIdentification/gmd:descriptiveKeywords/gmd:MD_Keywords/gmd:thesaurusName//gmx:Anchor[text() = 'geonetwork.thesaurus.local.theme.water_bodies' ]/ancestor::gmd:MD_Keywords/gmd:keyword/gco:CharacterString" />


      <xsl:variable name="parameters" select="gmd:identificationInfo/mcp:MD_DataIdentification/mcp:dataParameters/mcp:DP_DataParameters/mcp:dataParameter/mcp:DP_DataParameter" />

      <xsl:variable name="title" select="gmd:identificationInfo/mcp:MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:title/gco:CharacterString" />

      <xsl:variable name="organisation" select="gmd:contact/gmd:CI_ResponsibleParty/gmd:organisationName/gco:CharacterString" />

 
        organisation: '<xsl:value-of select="$organisation"/>'
        water bodies: '<xsl:value-of select="$waterBodies" separator="', '"/>'
        title:        '<xsl:value-of select="$title" />'


        <xsl:for-each select="$parameters" >

          <!-- TODO this should restrict code list as well as longName -->
          <xsl:variable name="parameter" select="mcp:parameterName/mcp:DP_Term/mcp:type/mcp:DP_TypeCode[text() = 'longName']/../../mcp:term/gco:CharacterString" />
          <xsl:variable name="platform" select="mcp:platform/mcp:DP_Term/mcp:term/gco:CharacterString" />
          <xsl:variable name="filename" select='encode-for-uri( replace($parameter, " ","-"))'/>



          parameter     '<xsl:value-of select="$parameter" />'
          platform      '<xsl:value-of select="$platform" />'
          filename      '<xsl:value-of select="$filename" />'


          <xsl:result-document method="xml" href="output/{$filename}.html">

            <xsl:text>&#xa;</xsl:text>
            <html>
            <head>
              <xsl:text>&#xa;</xsl:text>
              <!-- Page Meta Title -->
              <title>
                <xsl:value-of select="$parameter" />
                <xsl:text> </xsl:text>
                <xsl:value-of select="$waterBodies" separator=", "/>
                <xsl:text> </xsl:text>
                <!-- TODO land masses -->
                <xsl:text> </xsl:text>
                <xsl:value-of select="$platform" />
                <xsl:text> IMOS Scientific Research Data </xsl:text>
                <xsl:value-of select="$organisation" />
                <xsl:text> Integrated Marine Observing System</xsl:text>
              </title>
              <xsl:text>&#xa;</xsl:text>

              <!-- Page Meta Description -->
              <meta name="description">  
                <xsl:attribute name="content">
                  <xsl:value-of select="$parameter"/>
                  <xsl:text> in the </xsl:text>
                  <xsl:value-of select="$waterBodies" separator=", "/>
                  <xsl:text> near </xsl:text>
                  <!-- TODO land masses -->
                  <xsl:text> using </xsl:text>
                  <xsl:value-of select="$platform"/>
                  <xsl:text>. The </xsl:text>
                  <xsl:value-of select="$organisation"/>
                </xsl:attribute>
              </meta>  


              <xsl:text>&#xa;</xsl:text>
            </head>

            <body>
            <!-- Page Content -->
          <!-- 
              <h1><parameter> in the <water bodies></h1>
              <h2>Scientific Research Data obtained near <land masses>.</h2>
              <p>The <gmd:title> is collected by a combination of <platform> in the <water bodies> off the coastline(s) of <land masses> by <gmd:organisationName>.</p>
          --> 

              <xsl:text>&#xa;</xsl:text>
              <h1> 
                <xsl:value-of select="$parameter" />
                <xsl:text> in the </xsl:text>
                <xsl:value-of select="$waterBodies" separator=", "/>
                <xsl:text>.</xsl:text>
              </h1> 

              <xsl:text>&#xa;</xsl:text>
              <h2>
                <xsl:text>Scientific Research Data obtained near </xsl:text>
                <!-- TODO land masses -->
                <xsl:text>.</xsl:text>
              </h2>
              
              <xsl:text>&#xa;</xsl:text>
              <p>
                <xsl:text>The </xsl:text>
                <xsl:value-of select="$title" />
                <xsl:text> is collected by a combination of </xsl:text>
                <xsl:value-of select="$platform"/>
                <xsl:text> in the </xsl:text>
                <xsl:value-of select="$waterBodies" separator=", "/>
                <xsl:text> off the coastlines(s) of </xsl:text>
                <!-- TODO land masses -->
                <xsl:text> by </xsl:text>
                <xsl:value-of select="$organisation"/>
                <xsl:text>.</xsl:text>
              </p>

            </body>

            </html>
          </xsl:result-document>

        </xsl:for-each>


  </xsl:template>


</xsl:stylesheet>

