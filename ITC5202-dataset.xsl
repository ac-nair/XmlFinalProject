<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>European Countries Economic Data</title>
        <link rel="stylesheet" type="text/css" href="style.css"/>
      </head>
      <body>
        <h2>Country, Capital, Unemployment and GDP</h2>
        <table>
          <tr>
            <th>Country Name</th>
            <th>Capital</th>
            <th>Unemployment %</th>
            <th>GDP Total</th>
          </tr>

          <xsl:for-each select="europeCountries/country">
            <tr>
              <!-- Country Name -->
              <td>
                <xsl:choose>
                  <xsl:when test="name">
                    <xsl:value-of select="name"/>
                  </xsl:when>
                  <xsl:otherwise>-</xsl:otherwise>
                </xsl:choose>
              </td>

              <!-- Capital Name -->
              <td>
                <xsl:choose>
                  <xsl:when test="city[@id=current()/@capital]/name">
                    <xsl:value-of select="city[@id=current()/@capital]/name[1]"/>
                  </xsl:when>
                  <xsl:otherwise>-</xsl:otherwise>
                </xsl:choose>
              </td>

              <!-- Unemployment -->
              <td>
                <xsl:choose>
                  <xsl:when test="unemployment">
                    <xsl:value-of select="unemployment"/>
                  </xsl:when>
                  <xsl:otherwise>-</xsl:otherwise>
                </xsl:choose>
              </td>

              <!-- GDP Total -->
              <td>
                <xsl:choose>
                  <xsl:when test="gdp_total">
                    <xsl:value-of select="gdp_total"/>
                  </xsl:when>
                  <xsl:otherwise>-</xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
