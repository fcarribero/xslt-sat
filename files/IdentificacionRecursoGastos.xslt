<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:IRMGCT="http://www.sat.gob.mx/IdeRecMinGast">

  <xsl:template match="IRMGCT:IdentificacionDeRecurso">
    <!--Manejador de Atributos IdentificacionDeRecurso-->
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version" />
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipoOperacion" />
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@MontoEntregado" />
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@FechaDep" />
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Remanente" />
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@ReintegroRemanente" />
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@ReintegroRemanFecha" />
    </xsl:call-template>

    <!--  Iniciamos el manejo de los elementos hijo en la secuencia -->
    <xsl:for-each select="./IRMGCT:DispersionDelRecurso">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
    <!--  Iniciamos el manejo de los elementos hijo en la secuencia -->
    <xsl:for-each select="./IRMGCT:IdentificacionDelGasto">
      <xsl:apply-templates select="."/>
    </xsl:for-each>

  </xsl:template>

  <xsl:template match="IRMGCT:DispersionDelRecurso">
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NumIdSolicitud" />
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@FechaDeIdent" />
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="IRMGCT:IdentificacionDelGasto">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@AcuerdoGasto" />
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@UUID" />
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NumFolioDoc" />
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@FechaDeGasto" />
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@DescripcionGasto" />
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@ImporteGasto" />
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>