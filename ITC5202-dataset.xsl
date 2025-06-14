<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>European Countries Economic Data</title>
        <style>
          table { border-collapse: collapse; width: 80%; }
          th, td { border: 1px solid black; padding: 8px; text-align: left; }
          th { background-color: #f2f2f2; }
        </style>
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
              <td><xsl:value-of select="name"/></td>
              <td>
                <xsl:value-of select="city[@id=current()/@capital]/name[1]"/>
              </td>
              <td><xsl:value-of select="unemployment"/></td>
              <td><xsl:value-of select="gdp_total"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
