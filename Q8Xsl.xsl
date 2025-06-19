<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:param name="filter"/>
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>City Report</title>
      </head>
      <body>
        <xsl:for-each select="europeCountries/country[starts-with(translate(name, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), $filter)]">
          <h3><xsl:value-of select="name"/></h3>
          <table border="1">
            <tr>
              <th>City Name</th>
              <th>Province Name</th>
              <th>Local Name</th>
              <th>Population (2011)</th>
              <th>No of Cities in Province</th>
            </tr>

            <!-- If provinces exist -->
            <xsl:for-each select="province">
              <xsl:variable name="provName" select="name"/>
              <xsl:variable name="local" select="localname"/>
              <xsl:variable name="cityCount" select="count(city)"/>
              <xsl:for-each select="city">
                <tr>
                  <td><xsl:value-of select="name"/></td>
                  <td><xsl:value-of select="$provName"/></td>
                  <td><xsl:value-of select="$local"/></td>
                  <td>
                    <xsl:value-of select="population[@year='2011']"/>
                  </td>
                  <td><xsl:value-of select="$cityCount"/></td>
                </tr>
              </xsl:for-each>
            </xsl:for-each>

            <!-- If no province, show country-level cities -->
            <xsl:if test="not(province)">
              <xsl:for-each select="city">
                <tr>
                  <td><xsl:value-of select="name"/></td>
                  <td></td>
                  <td></td>
                  <td><xsl:value-of select="population[@year='2011']"/></td>
                  <td>0</td>
                </tr>
              </xsl:for-each>
            </xsl:if>
          </table>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
