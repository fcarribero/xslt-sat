<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:cfdi="http://www.sat.gob.mx/cfd/3" xmlns:ecc="http://www.sat.gob.mx/ecc" xmlns:psgecfd="http://www.sat.gob.mx/psgecfd" xmlns:donat="http://www.sat.gob.mx/donat" xmlns:divisas="http://www.sat.gob.mx/divisas" xmlns:detallista="http://www.sat.gob.mx/detallista" xmlns:ecb="http://www.sat.gob.mx/ecb" xmlns:implocal="http://www.sat.gob.mx/implocal" xmlns:terceros="http://www.sat.gob.mx/terceros" xmlns:iedu="http://www.sat.gob.mx/iedu" xmlns:ventavehiculos="http://www.sat.gob.mx/ventavehiculos" xmlns:pfic="http://www.sat.gob.mx/pfic" xmlns:tpe="http://www.sat.gob.mx/TuristaPasajeroExtranjero" xmlns:leyendasFisc="http://www.sat.gob.mx/leyendasFiscales" xmlns:spei="http://www.sat.gob.mx/spei" xmlns:nomina="http://www.sat.gob.mx/nomina" xmlns:registrofiscal="http://www.sat.gob.mx/registrofiscal" xmlns:pagoenespecie="http://www.sat.gob.mx/pagoenespecie" xmlns:consumodecombustibles="http://www.sat.gob.mx/consumodecombustibles" xmlns:valesdedespensa="http://www.sat.gob.mx/valesdedespensa" xmlns:aerolineas="http://www.sat.gob.mx/aerolineas" xmlns:notariospublicos="http://www.sat.gob.mx/notariospublicos" xmlns:vehiculousado="http://www.sat.gob.mx/vehiculousado" xmlns:servicioparcial="http://www.sat.gob.mx/servicioparcialconstruccion" version="2.0">
  <xsl:output method="text" version="1.0" encoding="UTF-8" indent="no"/>
  <xsl:template name="Requerido"><xsl:param name="valor"/>|<xsl:call-template name="ManejaEspacios"><xsl:with-param name="s" select="$valor"/></xsl:call-template></xsl:template>
  <xsl:template name="Opcional">
    <xsl:param name="valor"/>
    <xsl:if test="$valor">|<xsl:call-template name="ManejaEspacios"><xsl:with-param name="s" select="$valor"/></xsl:call-template></xsl:if>
  </xsl:template>
  <xsl:template name="ManejaEspacios">
    <xsl:param name="s"/>
    <xsl:value-of select="normalize-space(string($s))"/>
  </xsl:template>
  <xsl:template match="ecc:EstadoDeCuentaCombustible">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@tipoOperacion"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@numeroDeCuenta"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@subTotal"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@total"/>
    </xsl:call-template>
    <xsl:apply-templates select="./ecc:Conceptos"/>
  </xsl:template>
  <xsl:template match="ecc:Conceptos">
    <xsl:for-each select="./ecc:ConceptoEstadoDeCuentaCombustible">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="ecc:Traslados">
    <xsl:for-each select="./ecc:Traslado">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="ecc:ConceptoEstadoDeCuentaCombustible">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@identificador"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@fecha"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@rfc"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@claveEstacion"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@cantidad"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@nombreCombustible"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@folioOperacion"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@valorUnitario"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@importe"/>
    </xsl:call-template>
    <xsl:for-each select="./ecc:Traslados">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="ecc:Traslado">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@impuesto"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@tasa"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@importe"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="donat:Donatarias">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@noAutorizacion"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@fechaAutorizacion"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@leyenda"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="divisas:Divisas">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@tipoOperacion"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="detallista:detallista">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@documentStructureVersion"/>
    </xsl:call-template>
    <xsl:for-each select="detallista:orderIdentification/detallista:referenceIdentification">
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="."/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="detallista:orderIdentification/detallista:ReferenceDate"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="detallista:buyer/detallista:gln"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="detallista:seller/detallista:gln"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="detallista:seller/detallista:alternatePartyIdentification"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="detallista:totalAmount/detallista:Amount"/>
    </xsl:call-template>
    <xsl:for-each select="detallista:TotalAllowanceCharge/detallista:specialServicesType">
      <xsl:call-template name="Opcional">
        <xsl:with-param name="valor" select="."/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="detallista:TotalAllowanceCharge/detallista:Amount">
      <xsl:call-template name="Opcional">
        <xsl:with-param name="valor" select="."/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="implocal:ImpuestosLocales">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TotaldeRetenciones"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TotaldeTraslados"/>
    </xsl:call-template>
    <xsl:for-each select="implocal:RetencionesLocales">
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./@ImpLocRetenido"/>
      </xsl:call-template>
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./@TasadeRetencion"/>
      </xsl:call-template>
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./@Importe"/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="implocal:TrasladosLocales">
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./@ImpLocTrasladado"/>
      </xsl:call-template>
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./@TasadeTraslado"/>
      </xsl:call-template>
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./@Importe"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="terceros:PorCuentadeTerceros">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@rfc"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@nombre"/>
    </xsl:call-template>
    <xsl:apply-templates select=".//terceros:InformacionFiscalTercero"/>
    <xsl:for-each select=".//terceros:InformacionAduanera">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
    <xsl:if test="./terceros:CuentaPredial">
      <xsl:apply-templates select="./terceros:CuentaPredial"/>
    </xsl:if>
    <xsl:for-each select=".//terceros:Retenciones/terceros:Retencion">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
    <xsl:for-each select=".//terceros:Traslados/terceros:Traslado">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="terceros:Retencion">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@impuesto"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@importe"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="terceros:Traslado">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@impuesto"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@tasa"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@importe"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="terceros:InformacionAduanera">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@numero"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@fecha"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@aduana"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="terceros:CuentaPredial">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@numero"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="terceros:InformacionFiscalTercero">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@calle"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@noExterior"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@noInterior"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@colonia"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@localidad"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@referencia"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@municipio"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@estado"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@pais"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@codigoPostal"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="iedu:instEducativas">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@nombreAlumno"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@CURP"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@nivelEducativo"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@autRVOE"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@rfcPago"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="ventavehiculos:VentaVehiculos">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@ClaveVehicular"/>
    </xsl:call-template>
    <xsl:if test="./@version='1.1'">
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./@Niv"/>
      </xsl:call-template>
    </xsl:if>
    <xsl:for-each select=".//ventavehiculos:InformacionAduanera">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="ventavehiculos:InformacionAduanera">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@numero"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@fecha"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@aduana"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="pfic:PFintegranteCoordinado">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@ClaveVehicular"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Placa"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@RFCPF"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tpe:TuristaPasajeroExtranjero">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@fechadeTransito"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@tipoTransito"/>
    </xsl:call-template>
    <xsl:apply-templates select="./tpe:datosTransito"/>
  </xsl:template>
  <xsl:template match="tpe:datosTransito">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Via"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipoId"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NumeroId"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Nacionalidad"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@EmpresaTransporte"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@IdTransporte"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="leyendasFisc:LeyendasFiscales">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@version"/>
    </xsl:call-template>
    <xsl:for-each select="./leyendasFisc:Leyenda">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="leyendasFisc:Leyenda">
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@disposicionFiscal"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@norma"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@textoLeyenda"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="spei:Complemento_SPEI">
    <xsl:for-each select="./spei:SPEI_Tercero">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="spei:SPEI_Tercero">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@FechaOperacion"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Hora"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@ClaveSPEI"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@sello"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@numeroCertificado"/>
    </xsl:call-template>
    <xsl:apply-templates select="./spei:Ordenante"/>
    <xsl:apply-templates select="./spei:Beneficiario"/>
  </xsl:template>
  <xsl:template match="spei:Ordenante">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@BancoEmisor"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Nombre"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipoCuenta"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Cuenta"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@RFC"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="spei:Beneficiario">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@BancoReceptor"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Nombre"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipoCuenta"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Cuenta"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@RFC"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Concepto"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@IVA"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@MontoPago"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="nomina:Nomina">
    <xsl:choose>
      <xsl:when test="./@Version='1.0'">
        <xsl:call-template name="Requerido">
          <xsl:with-param name="valor" select="./@Version"/>
        </xsl:call-template>
        <xsl:call-template name="Requerido">
          <xsl:with-param name="valor" select="./@RegistroPatronal"/>
        </xsl:call-template>
        <xsl:call-template name="Requerido">
          <xsl:with-param name="valor" select="./@NumEmpleado"/>
        </xsl:call-template>
        <xsl:call-template name="Requerido">
          <xsl:with-param name="valor" select="./@CURP"/>
        </xsl:call-template>
        <xsl:call-template name="Requerido">
          <xsl:with-param name="valor" select="./@TipoRegimen"/>
        </xsl:call-template>
        <xsl:call-template name="Opcional">
          <xsl:with-param name="valor" select="./@NumSeguridadSocial"/>
        </xsl:call-template>
        <xsl:call-template name="Opcional">
          <xsl:with-param name="valor" select="./@CLABE"/>
        </xsl:call-template>
        <xsl:call-template name="Opcional">
          <xsl:with-param name="valor" select="./@Banco"/>
        </xsl:call-template>
        <xsl:call-template name="Requerido">
          <xsl:with-param name="valor" select="./nomina:Ingresos/@TotalGravado"/>
        </xsl:call-template>
        <xsl:call-template name="Requerido">
          <xsl:with-param name="valor" select="./nomina:Ingresos/@TotalExento"/>
        </xsl:call-template>
        <xsl:call-template name="Requerido">
          <xsl:with-param name="valor" select="./nomina:Descuentos/@Total"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="./@Version='1.1'">
        <xsl:call-template name="Requerido">
          <xsl:with-param name="valor" select="./@Version"/>
        </xsl:call-template>
        <xsl:call-template name="Opcional">
          <xsl:with-param name="valor" select="./@RegistroPatronal"/>
        </xsl:call-template>
        <xsl:call-template name="Requerido">
          <xsl:with-param name="valor" select="./@NumEmpleado"/>
        </xsl:call-template>
        <xsl:call-template name="Requerido">
          <xsl:with-param name="valor" select="./@CURP"/>
        </xsl:call-template>
        <xsl:call-template name="Requerido">
          <xsl:with-param name="valor" select="./@TipoRegimen"/>
        </xsl:call-template>
        <xsl:call-template name="Opcional">
          <xsl:with-param name="valor" select="./@NumSeguridadSocial"/>
        </xsl:call-template>
        <xsl:call-template name="Requerido">
          <xsl:with-param name="valor" select="./@FechaPago"/>
        </xsl:call-template>
        <xsl:call-template name="Requerido">
          <xsl:with-param name="valor" select="./@FechaInicialPago"/>
        </xsl:call-template>
        <xsl:call-template name="Requerido">
          <xsl:with-param name="valor" select="./@FechaFinalPago"/>
        </xsl:call-template>
        <xsl:call-template name="Requerido">
          <xsl:with-param name="valor" select="./@NumDiasPagados"/>
        </xsl:call-template>
        <xsl:call-template name="Opcional">
          <xsl:with-param name="valor" select="./@Departamento"/>
        </xsl:call-template>
        <xsl:call-template name="Opcional">
          <xsl:with-param name="valor" select="./@CLABE"/>
        </xsl:call-template>
        <xsl:call-template name="Opcional">
          <xsl:with-param name="valor" select="./@Banco"/>
        </xsl:call-template>
        <xsl:call-template name="Opcional">
          <xsl:with-param name="valor" select="./@FechaInicioRelLaboral"/>
        </xsl:call-template>
        <xsl:call-template name="Opcional">
          <xsl:with-param name="valor" select="./@Antiguedad"/>
        </xsl:call-template>
        <xsl:call-template name="Opcional">
          <xsl:with-param name="valor" select="./@Puesto"/>
        </xsl:call-template>
        <xsl:call-template name="Opcional">
          <xsl:with-param name="valor" select="./@TipoContrato"/>
        </xsl:call-template>
        <xsl:call-template name="Opcional">
          <xsl:with-param name="valor" select="./@TipoJornada"/>
        </xsl:call-template>
        <xsl:call-template name="Requerido">
          <xsl:with-param name="valor" select="./@PeriodicidadPago"/>
        </xsl:call-template>
        <xsl:call-template name="Opcional">
          <xsl:with-param name="valor" select="./@SalarioBaseCotApor"/>
        </xsl:call-template>
        <xsl:call-template name="Opcional">
          <xsl:with-param name="valor" select="./@RiesgoPuesto"/>
        </xsl:call-template>
        <xsl:call-template name="Opcional">
          <xsl:with-param name="valor" select="./@SalarioDiarioIntegrado"/>
        </xsl:call-template>
        <xsl:if test="./nomina:Percepciones">
          <xsl:apply-templates select="./nomina:Percepciones"/>
        </xsl:if>
        <xsl:if test="./nomina:Deducciones">
          <xsl:apply-templates select="./nomina:Deducciones"/>
        </xsl:if>
        <xsl:for-each select="./nomina:Incapacidades">
          <xsl:apply-templates select="."/>
        </xsl:for-each>
        <xsl:for-each select="./nomina:HorasExtras">
          <xsl:apply-templates select="."/>
        </xsl:for-each>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="nomina:Percepciones">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TotalGravado"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TotalExento"/>
    </xsl:call-template>
    <xsl:for-each select="./nomina:Percepcion">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="nomina:Percepcion">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipoPercepcion"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Clave"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Concepto"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@ImporteGravado"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@ImporteExento"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="nomina:Deducciones">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TotalGravado"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TotalExento"/>
    </xsl:call-template>
    <xsl:for-each select="./nomina:Deduccion">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="nomina:Deduccion">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipoDeduccion"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Clave"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Concepto"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@ImporteGravado"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@ImporteExento"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="nomina:Incapacidades">
    <xsl:for-each select="./nomina:Incapacidad">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="nomina:Incapacidad">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@DiasIncapacidad"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipoIncapacidad"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Descuento"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="nomina:HorasExtras">
    <xsl:for-each select="./nomina:HorasExtra">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="nomina:HorasExtra">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Dias"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipoHoras"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@HorasExtra"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@ImportePagado"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="pagoenespecie:PagoEnEspecie">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@CvePIC"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@FolioSolDon"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@PzaArtNombre"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@PzaArtTecn"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@PzaArtAProd"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@PzaArtDim"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="consumodecombustibles:ConsumoDeCombustibles">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@tipoOperacion"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@numeroDeCuenta"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@subTotal"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@total"/>
    </xsl:call-template>
    <xsl:apply-templates select="./consumodecombustibles:Conceptos"/>
  </xsl:template>
  <xsl:template match="consumodecombustibles:Conceptos">
    <xsl:for-each select="./consumodecombustibles:ConceptoConsumoDeCombustibles">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="consumodecombustibles:ConceptoConsumoDeCombustibles">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@identificador"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@fecha"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@rfc"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@claveEstacion"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@cantidad"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@nombreCombustible"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@folioOperacion"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@valorUnitario"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@importe"/>
    </xsl:call-template>
    <xsl:for-each select="./consumodecombustibles:Determinados">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="consumodecombustibles:Determinados">
    <xsl:for-each select="./consumodecombustibles:Determinado">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="consumodecombustibles:Determinado">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@impuesto"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@tasa"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@importe"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="valesdedespensa:ValesDeDespensa">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@tipoOperacion"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@registroPatronal"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@numeroDeCuenta"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@total"/>
    </xsl:call-template>
    <xsl:apply-templates select="./valesdedespensa:Conceptos"/>
  </xsl:template>
  <xsl:template match="valesdedespensa:Conceptos">
    <xsl:for-each select="./valesdedespensa:Concepto">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="valesdedespensa:Concepto">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@identificador"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@fecha"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@rfc"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@curp"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@nombre"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@numSeguridadSocial"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@importe"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="aerolineas:Aerolineas">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TUA"/>
    </xsl:call-template>
    <xsl:apply-templates select="./aerolineas:OtrosCargos"/>
  </xsl:template>
  <xsl:template match="aerolineas:OtrosCargos">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TotalCargos"/>
    </xsl:call-template>
    <xsl:for-each select="./aerolineas:Cargo">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="aerolineas:Cargo">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@CodigoCargo"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Importe"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="notariospublicos:NotariosPublicos">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:apply-templates select="./notariospublicos:DescInmuebles"/>
    <xsl:apply-templates select="./notariospublicos:DatosOperacion"/>
    <xsl:apply-templates select="./notariospublicos:DatosNotario"/>
    <xsl:apply-templates select="./notariospublicos:DatosEnajenante"/>
    <xsl:apply-templates select="./notariospublicos:DatosAdquiriente"/>
  </xsl:template>
  <xsl:template match="notariospublicos:DescInmuebles">
    <xsl:for-each select="./notariospublicos:DescInmueble">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="notariospublicos:DescInmueble">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipoInmueble"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Calle"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NoExterior"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NoInterior"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Colonia"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Localidad"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Referencia"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Municipio"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Estado"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Pais"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@CodigoPostal"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="notariospublicos:DatosOperacion">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NumInstrumentoNotarial"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@FechaInstNotarial"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@MontoOperacion"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Subtotal"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@IVA"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="notariospublicos:DatosNotario">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@CURP"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NumNotaria"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@EntidadFederativa"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Adscripcion"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="notariospublicos:DatosEnajenante">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@CoproSocConyugalE"/>
    </xsl:call-template>
    <xsl:if test="./notariospublicos:DatosUnEnajenante">
      <xsl:apply-templates select="./notariospublicos:DatosUnEnajenante"/>
    </xsl:if>
    <xsl:if test="./notariospublicos:DatosEnajenantesCopSC">
      <xsl:apply-templates select="./notariospublicos:DatosEnajenantesCopSC"/>
    </xsl:if>
  </xsl:template>
  <xsl:template match="notariospublicos:DatosUnEnajenante">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Nombre"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@ApellidoPaterno"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@ApellidoMaterno"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@RFC"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@CURP"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="notariospublicos:DatosEnajenantesCopSC">
    <xsl:for-each select="./notariospublicos:DatosEnajenanteCopSC">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="notariospublicos:DatosEnajenanteCopSC">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Nombre"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@ApellidoPaterno"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@ApellidoMaterno"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@RFC"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@CURP"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Porcentaje"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="notariospublicos:DatosAdquiriente">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@CoproSocConyugalE"/>
    </xsl:call-template>
    <xsl:if test="./notariospublicos:DatosUnAdquiriente">
      <xsl:apply-templates select="./notariospublicos:DatosUnAdquiriente"/>
    </xsl:if>
    <xsl:if test="./notariospublicos:DatosAdquirientesCopSC">
      <xsl:apply-templates select="./notariospublicos:DatosAdquirientesCopSC"/>
    </xsl:if>
  </xsl:template>
  <xsl:template match="notariospublicos:DatosUnAdquiriente">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Nombre"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@ApellidoPaterno"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@ApellidoMaterno"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@RFC"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@CURP"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="notariospublicos:DatosAdquirientesCopSC">
    <xsl:for-each select="./notariospublicos:DatosAdquirienteCopSC">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="notariospublicos:DatosAdquirienteCopSC">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Nombre"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@ApellidoPaterno"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@ApellidoMaterno"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@RFC"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@CURP"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Porcentaje"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="/">|<xsl:apply-templates select="/vehiculousado:VehiculoUsado"/>||</xsl:template>
  <xsl:template match="vehiculousado:VehiculoUsado">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@montoAdquisicion"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@montoEnajenacion"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@claveVehicular"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@marca"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@tipo"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@modelo"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@numeroMotor"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@numeroSerie"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NIV"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@valor"/>
    </xsl:call-template>
    <xsl:apply-templates select="./vehiculousado:InformacionAduanera"/>
  </xsl:template>
  <xsl:template match="vehiculousado:InformacionAduanera">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@numero"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@fecha"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@aduana"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="servicioparcial:parcialesconstruccion">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NumPerLicoAut"/>
    </xsl:call-template>
    <xsl:apply-templates select="./servicioparcial:Inmueble"/>
  </xsl:template>
  <xsl:template match="servicioparcial:Inmueble">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Calle"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NoExterior"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NoInterior"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Colonia"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Localidad"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Referencia"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Municipio"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Estado"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@CodigoPostal"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="destruccion:certificadodedestruccion">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Serie"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NumFolDesVeh"/>
    </xsl:call-template>
    <xsl:apply-templates select="./destruccion:VehiculoDestruido"/>
    <xsl:apply-templates select="./destruccion:InformacionAduanera"/>
  </xsl:template>
  <xsl:template match="destruccion:VehiculoDestruido">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Marca"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipooClase"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Año"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Modelo"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NIV"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NumSerie"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NumPlacas"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NumMotor"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NumFolTarjCir"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="destruccion:InformacionAduanera">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NumPedImp"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Fecha"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Aduana"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="decreto:renovacionysustitucionvehiculos">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipoDeDecreto"/>
    </xsl:call-template>
    <xsl:apply-templates select="./decreto:DecretoRenovVehicular"/>
    <xsl:apply-templates select="./decreto:DecretoSustitVehicular"/>
  </xsl:template>
  <xsl:template match="decreto:DecretoRenovVehicular">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@VehEnaj"/>
    </xsl:call-template>
    <xsl:for-each select="./decreto:VehiculosUsadosEnajenadoPermAlFab">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
    <xsl:apply-templates select="./decreto:VehiculoNuvoSemEnajenadoFabAlPerm"/>
  </xsl:template>
  <xsl:template match="decreto:DecretoSustitVehicular">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@VehEnaj"/>
    </xsl:call-template>
    <xsl:apply-templates select="./decreto:VehiculoUsadoEnajenadoPermAlFab"/>
    <xsl:apply-templates select="./decreto:VehiculoNuvoSemEnajenadoFabAlPerm"/>
  </xsl:template>
  <xsl:template match="decreto:VehiculosUsadosEnajenadoPermAlFab">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@PrecioVehUsado"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipoVeh"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Marca"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipooClase"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Año"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Modelo"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NIV"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NumSerie"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NumPlacas"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NumMotor"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NumFolTarjCir"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NumPedIm"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Aduana"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@FechaRegulVeh"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Foliofiscal"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="decreto:VehiculoNuvoSemEnajenadoFabAlPerm">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Año"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Modelo"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NumPlacas"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@RFC"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="decreto:VehiculoUsadoEnajenadoPermAlFab">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@PrecioVehUsado"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipoVeh"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Marca"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipooClase"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Año"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Modelo"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NIV"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NumSerie"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NumPlacas"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NumMotor"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NumFolTarjCir"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NumFolAvisoint"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NumPedIm"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Aduana"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@FechaRegulVeh"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Foliofiscal"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="obrasarte:obrasarteantiguedades">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipoBien"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@OtrosTipoBien"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TituloAdquirido"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@OtrosTituloAdquirido"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Subtotal"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@IVA"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@FechaAdquisicion"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@CaracterísticasDeObraoPieza"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="aieps:acreditamientoIEPS">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TAR"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="ecc11:EstadoDeCuentaCombustible">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipoOperacion"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NumeroDeCuenta"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@SubTotal"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Total"/>
    </xsl:call-template>
    <xsl:apply-templates select="./ecc11:Conceptos"/>
  </xsl:template>
  <xsl:template match="ecc11:Conceptos">
    <xsl:for-each select="./ecc11:ConceptoEstadoDeCuentaCombustible">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="ecc11:Traslados">
    <xsl:for-each select="./ecc11:Traslado">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="ecc11:ConceptoEstadoDeCuentaCombustible">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Identificador"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Fecha"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Rfc"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@ClaveEstacion"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@TAR"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Cantidad"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NoIdentificacion"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Unidad"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NombreCombustible"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@FolioOperacion"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@ValorUnitario"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Importe"/>
    </xsl:call-template>
    <xsl:apply-templates select="./ecc11:Traslados"/>
  </xsl:template>
  <xsl:template match="ecc11:Traslado">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Impuesto"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TasaoCuota"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Importe"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="cce:ComercioExterior">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipoOperacion"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@ClaveDePedimento"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@CertificadoOrigen"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NumCertificadoOrigen"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NumeroExportadorConfiable"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Incoterm"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Subdivision"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Observaciones"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@TipoCambioUSD"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@TotalUSD"/>
    </xsl:call-template>
    <xsl:apply-templates select="./cce:Emisor"/>
    <xsl:apply-templates select="./cce:Receptor"/>
    <xsl:apply-templates select="./cce:Destinatario"/>
    <xsl:apply-templates select="./cce:Mercancias"/>
  </xsl:template>
  <xsl:template match="cce:Emisor">
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Curp"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="cce:Receptor">
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Curp"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NumRegIdTrib"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="cce:Destinatario">
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NumRegIdTrib"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Rfc"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Curp"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Nombre"/>
    </xsl:call-template>
    <xsl:apply-templates select="./cce:Domicilio"/>
  </xsl:template>
  <xsl:template match="cce:Mercancias">
    <xsl:for-each select="./cce:Mercancia">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="cce:Domicilio">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Calle"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NumeroExterior"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NumeroInterior"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Colonia"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Localidad"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Referencia"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Municipio"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Estado"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Pais"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@CodigoPostal"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="cce:Mercancia">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NoIdentificacion"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@FraccionArancelaria"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@CantidadAduana"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@UnidadAduana"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@ValorUnitarioAduana"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@ValorDolares"/>
    </xsl:call-template>
    <xsl:for-each select="./cce:DescripcionesEspecificas">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="cce:DescripcionesEspecificas">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Marca"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Modelo"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@SubModelo"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NumeroSerie"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="ine:INE">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipoProceso"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@TipoComite"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@IdContabilidad"/>
    </xsl:call-template>
    <xsl:for-each select="./ine:Entidad">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="ine:Entidad">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@ClaveEntidad"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Ambito"/>
    </xsl:call-template>
    <xsl:for-each select="./ine:Contabilidad">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="ine:Contabilidad">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@IdContabilidad"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="/">|<xsl:apply-templates select="/cfdi:Comprobante"/>||</xsl:template>
  <xsl:template match="cfdi:Comprobante">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Fecha"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@MetodoPago"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NoCertificado"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@CondicionesDePago"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Subtotal"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Descuento"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Moneda"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@TipoCambio"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Total"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipoDeComprobante"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@FormaPago"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@LugarExpedicion"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@CfdiRelacionado"/>
    </xsl:call-template>
    <xsl:apply-templates select="./cfdi:Emisor"/>
    <xsl:apply-templates select="./cfdi:Receptor"/>
    <xsl:apply-templates select="./cfdi:Conceptos"/>
    <xsl:apply-templates select="./cfdi:Impuestos"/>
    <xsl:apply-templates select="./cfdi:Complemento"/>
  </xsl:template>
  <xsl:template match="cfdi:Emisor">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Rfc"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Nombre"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Curp"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@RegimenFiscal"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="cfdi:Receptor">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Rfc"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Curp"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Nombre"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@ResidenciaFiscal"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NumRegIdTrib"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="cfdi:Conceptos">
    <xsl:for-each select="./cfdi:Concepto">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="cfdi:Concepto">
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NoIdentificacion"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Cantidad"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Unidad"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Descripcion"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@ValorUnitario"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Importe"/>
    </xsl:call-template>
    <xsl:for-each select="./cfdi:Impuestos/cfdi:Traslados/cfdi:Traslado">
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./@Base"/>
      </xsl:call-template>
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./@Impuesto"/>
      </xsl:call-template>
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./@TipoFactor"/>
      </xsl:call-template>
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./@TasaOCuota"/>
      </xsl:call-template>
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./@Importe"/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="./cfdi:Impuestos/cfdi:Retenciones/cfdi:Retencion">
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./@Base"/>
      </xsl:call-template>
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./@Impuesto"/>
      </xsl:call-template>
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./@TipoFactor"/>
      </xsl:call-template>
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./@TasaOCuota"/>
      </xsl:call-template>
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./@Importe"/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="./cfdi:InformacionAduanera">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
    <xsl:if test="./cfdi:CuentaPredial">
      <xsl:apply-templates select="./cfdi:CuentaPredial"/>
    </xsl:if>
    <xsl:if test="./cfdi:ComplementoConcepto">
      <xsl:apply-templates select="./cfdi:ComplementoConcepto"/>
    </xsl:if>
    <xsl:for-each select="./cfdi:Parte">
      <xsl:call-template name="Opcional">
        <xsl:with-param name="valor" select="./@NoIdentificacion"/>
      </xsl:call-template>
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./@Cantidad"/>
      </xsl:call-template>
      <xsl:call-template name="Opcional">
        <xsl:with-param name="valor" select="./@Unidad"/>
      </xsl:call-template>
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./@Descripcion"/>
      </xsl:call-template>
      <xsl:call-template name="Opcional">
        <xsl:with-param name="valor" select="./@ValorUnitario"/>
      </xsl:call-template>
      <xsl:call-template name="Opcional">
        <xsl:with-param name="valor" select="./@Importe"/>
      </xsl:call-template>
      <xsl:for-each select="./cfdi:InformacionAduanera">
        <xsl:apply-templates select="."/>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="cfdi:Impuestos">
    <xsl:for-each select="./cfdi:Retenciones/cfdi:Retencion">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@TotalImpuestosRetenidos"/>
    </xsl:call-template>
    <xsl:for-each select="./cfdi:Traslados/cfdi:Traslado">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@TotalImpuestosTrasladados"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="cfdi:Retencion">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Impuesto"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Importe"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="cfdi:Traslado">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Impuesto"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipoFactor"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TasaOCuota"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Importe"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="cfdi:Complemento">
    <xsl:for-each select="./*">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="cfdi:InformacionAduanera">
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NumeroPedimento"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Fecha"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Aduana"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@FraccionArancelaria"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@PesoBruto"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@CantidadAduana"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@UnidadAduana"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@ValorUnitarioAduana"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@ValorDolares"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="cfdi:CuentaPredial">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Numero"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="cfdi:ComplementoConcepto">
    <xsl:for-each select="./*">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
