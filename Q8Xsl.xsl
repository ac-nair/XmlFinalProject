<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:param name="filter"/>

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Country Province/City Report</title>  
      </head>
      <body>
        <xsl:for-each select="europeCountries/country[starts-with(translate(name, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), $filter)]">
          <h2><xsl:value-of select="name"/></h2>

          <xsl:choose>
            <!-- If province exists -->
            <xsl:when test="province">
              <table>
                <tr>
                  <th>Province Name</th>
                  <th>Local Name</th>
                  <th>Population (2011)</th>
                  <th>No of Cities</th>
                </tr>
                <xsl:for-each select="province">
                  <tr>
                    <td><xsl:value-of select="name"/></td>
                    <td><xsl:value-of select="localname"/></td>
                    <td>
                      <xsl:choose>
                        <xsl:when test="population[@year='2011']">
                          <xsl:value-of select="population[@year='2011']"/>
                        </xsl:when>
                        <xsl:otherwise>-</xsl:otherwise>
                      </xsl:choose>
                    </td>
                    <td>
                      <xsl:value-of select="count(city)"/>
                    </td>
                  </tr>
                </xsl:for-each>
              </table>
            </xsl:when>

            <!-- If no provinces, show cities -->
            <xsl:otherwise>
              <table>
                <tr>
                  <th>City Name</th>
                  <th>Population (2011)</th>
                </tr>
                <xsl:for-each select="city">
                  <tr>
                    <td><xsl:value-of select="name"/></td>
                    <td>
                      <xsl:choose>
                        <xsl:when test="population[@year='2011']">
                          <xsl:value-of select="population[@year='2011']"/>
                        </xsl:when>
                        <xsl:otherwise>-</xsl:otherwise>
                      </xsl:choose>
                    </td>
                  </tr>
                </xsl:for-each>
              </table>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
