<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:retenciones="http://www.sat.gob.mx/esquemas/retencionpago/1" xmlns:arrendamientoenfideicomiso="http://www.sat.gob.mx/esquemas/retencionpago/1/arrendamientoenfideicomiso" xmlns:dividendos="http://www.sat.gob.mx/esquemas/retencionpago/1/dividendos" xmlns:enajenaciondeacciones="http://www.sat.gob.mx/esquemas/retencionpago/1/enajenaciondeacciones" xmlns:fideicomisonoempresarial="http://www.sat.gob.mx/esquemas/retencionpago/1/fideicomisonoempresarial" xmlns:intereses="http://www.sat.gob.mx/esquemas/retencionpago/1/intereses" xmlns:intereseshipotecarios="http://www.sat.gob.mx/esquemas/retencionpago/1/intereseshipotecarios" xmlns:operacionesconderivados="http://www.sat.gob.mx/esquemas/retencionpago/1/operacionesconderivados" xmlns:pagosaextranjeros="http://www.sat.gob.mx/esquemas/retencionpago/1/pagosaextranjeros" xmlns:planesderetiro="http://www.sat.gob.mx/esquemas/retencionpago/1/planesderetiro" xmlns:premios="http://www.sat.gob.mx/esquemas/retencionpago/1/premios" xmlns:sectorfinanciero="http://www.sat.gob.mx/esquemas/retencionpago/1/sectorfinanciero" xmlns:plataformasTecnologicas="http://www.sat.gob.mx/esquemas/retencionpago/1/PlataformasTecnologicas10" version="2.0">
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
  <xsl:template match="arrendamientoenfideicomiso:Arrendamientoenfideicomiso">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@PagProvEfecPorFiduc"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@RendimFideicom"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@DeduccCorresp"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@MontTotRet"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@MontResFiscDistFibras"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@MontOtrosConceptDistr"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@DescrMontOtrosConceptDistr"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="dividendos:Dividendos">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:apply-templates select="./dividendos:DividOUtil"/>
    <xsl:apply-templates select="./dividendos:Remanente"/>
  </xsl:template>
  <xsl:template match="dividendos:DividOUtil">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@CveTipDivOUtil"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@MontISRAcredRetMexico"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@MontISRAcredRetExtranjero"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@MontRetExtDivExt"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipoSocDistrDiv"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@MontISRAcredNal"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@MontDivAcumNal"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@MontDivAcumExt"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="dividendos:Remanente">
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@ProporcionRem"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="enajenaciondeacciones:EnajenaciondeAcciones">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@ContratoIntermediacion"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Ganancia"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Perdida"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="fideicomisonoempresarial:Fideicomisonoempresarial">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:apply-templates select="./fideicomisonoempresarial:IngresosOEntradas"/>
    <xsl:apply-templates select="./fideicomisonoempresarial:DeduccOSalidas"/>
    <xsl:apply-templates select="./fideicomisonoempresarial:RetEfectFideicomiso"/>
  </xsl:template>
  <xsl:template match="fideicomisonoempresarial:IngresosOEntradas">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@MontTotEntradasPeriodo"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@PartPropAcumDelFideicom"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@PropDelMontTot"/>
    </xsl:call-template>
    <xsl:if test="./fideicomisonoempresarial:IntegracIngresos">
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./fideicomisonoempresarial:IntegracIngresos/@Concepto"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template match="fideicomisonoempresarial:DeduccOSalidas">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@MontTotEgresPeriodo"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@PartPropDelFideicom"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@PropDelMontTot"/>
    </xsl:call-template>
    <xsl:if test="./fideicomisonoempresarial:IntegracEgresos">
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./fideicomisonoempresarial:IntegracEgresos/@ConceptoS"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template match="fideicomisonoempresarial:RetEfectFideicomiso">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@MontRetRelPagFideic"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@DescRetRelPagFideic"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="intereses:Intereses">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@SistFinanciero"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@RetiroAORESRetInt"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@OperFinancDerivad"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@MontIntNominal"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@MontIntReal"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Perdida"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="intereseshipotecarios:Intereseshipotecarios">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@CreditoDeInstFinanc"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@SaldoInsoluto"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@PropDeducDelCredit"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@MontTotIntNominalesDev"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@MontTotIntNominalesDevYPag"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@MontTotIntRealPagDeduc"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NumContrato"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="pagosaextranjeros:Pagosaextranjeros">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@EsBenefEfectDelCobro"/>
    </xsl:call-template>
    <xsl:apply-templates select="./pagosaextranjeros:NoBeneficiario"/>
    <xsl:apply-templates select="./pagosaextranjeros:Beneficiario"/>
  </xsl:template>
  <xsl:template match="pagosaextranjeros:NoBeneficiario">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@PaisDeResidParaEfecFisc"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@ConceptoPago"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@DescripcionConcepto"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="pagosaextranjeros:Beneficiario">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@RFC"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@CURP"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NomDenRazSocB"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@ConceptoPago"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@DescripcionConcepto"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="planesderetiro:Planesderetiro">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@SistemaFinanc"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@MontTotAportAnioInmAnterior"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@MontIntRealesDevengAniooInmAnt"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@HuboRetirosAnioInmAntPer"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@MontTotRetiradoAnioInmAntPer"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@MontTotExentRetiradoAnioInmAnt"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@MontTotExedenteAnioInmAnt"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@HuboRetirosAnioInmAnt"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@MontTotRetiradoAnioInmAnt"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="premios:Premios">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@EntidadFederativa"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@MontTotPago"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@MontTotPagoGrav"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@MontTotPagoExent"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="operacionesconderivados:Operacionesconderivados">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@MontGanAcum"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@MontPerdDed"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="sectorfinanciero:SectorFinanciero">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@IdFideicom"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NomFideicom"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@DescripFideicom"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="plataformasTecnologicas:ServiciosPlataformasTecnologicas">
    <!-- Iniciamos el tratamiento de los atributos de ServiciosPlataformasTecnologicas-->
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Periodicidad"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NumServ"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@MonTotServSIVA"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TotalIVATrasladado"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TotalIVARetenido"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TotalISRRetenido"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@DifIVAEntregadoPrestServ"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@MonTotalporUsoPlataforma"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@MonTotalContribucionGubernamental"/>
    </xsl:call-template>
    <!--
			Llamadas para procesar al los sub nodos de Servicios
		-->
    <xsl:apply-templates select="./plataformasTecnologicas:Servicios"/>
  </xsl:template>

  <!-- Manejador de nodos tipo Servicios -->
  <xsl:template match="plataformasTecnologicas:Servicios">
    <!--  Iniciamos el manejo de los elementos hijo en la DetallesDelServicio -->
    <xsl:for-each select="./plataformasTecnologicas:DetallesDelServicio">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="plataformasTecnologicas:DetallesDelServicio">
    <!-- Iniciamos el tratamiento de los atributos de Servicios-->
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@FormaPagoServ"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@TipoDeServ"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@SubTipServ"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@RFCTerceroAutorizado"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@FechaServ"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@PrecioServSinIVA"/>
    </xsl:call-template>
    <!--  Iniciamos el manejo de los elementos hijo en la ImpuestosTrasladadosdelServicio -->
    <xsl:apply-templates select="./plataformasTecnologicas:ImpuestosTrasladadosdelServicio"/>
    <!-- Llamada al manejador de nodos de ContribucionGubernamental en caso de existir -->
    <xsl:if test="./plataformasTecnologicas:ContribucionGubernamental">
      <xsl:apply-templates select="./plataformasTecnologicas:ContribucionGubernamental"/>
    </xsl:if>
    <!--  Iniciamos el manejo de los elementos hijo en la ComisionDelServicio -->
    <xsl:apply-templates select="./plataformasTecnologicas:ComisionDelServicio"/>
  </xsl:template>

  <xsl:template match="plataformasTecnologicas:ImpuestosTrasladadosdelServicio">
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
      <xsl:with-param name="valor" select="./@TasaCuota"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Importe"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="plataformasTecnologicas:ContribucionGubernamental">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@ImpContrib"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@EntidadDondePagaLaContribucion"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="plataformasTecnologicas:ComisionDelServicio">
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Base"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@Porcentaje"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Importe"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="/">|<xsl:apply-templates select="/retenciones:Retenciones"/>||</xsl:template>
  <xsl:template match="retenciones:Retenciones">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Version"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@NumCert"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@FolioInt"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@FechaExp"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@CveRetenc"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@DescRetenc"/>
    </xsl:call-template>
    <xsl:apply-templates select="./retenciones:Emisor"/>
    <xsl:apply-templates select="./retenciones:Receptor"/>
    <xsl:apply-templates select="./retenciones:Periodo"/>
    <xsl:apply-templates select="./retenciones:Totales"/>
    <xsl:apply-templates select="./retenciones:Complemento"/>
  </xsl:template>
  <xsl:template match="retenciones:Emisor">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@RFCEmisor"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@NomDenRazSocE"/>
    </xsl:call-template>
    <xsl:call-template name="Opcional">
      <xsl:with-param name="valor" select="./@CURPE"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="retenciones:Receptor">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Nacionalidad"/>
    </xsl:call-template>
    <xsl:if test="./retenciones:Nacional">
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./retenciones:Nacional/@RFCRecep"/>
      </xsl:call-template>
    </xsl:if>
    <xsl:if test="./retenciones:Nacional">
      <xsl:call-template name="Opcional">
        <xsl:with-param name="valor" select="./retenciones:Nacional/@NomDenRazSocR"/>
      </xsl:call-template>
    </xsl:if>
    <xsl:if test="./retenciones:Nacional">
      <xsl:call-template name="Opcional">
        <xsl:with-param name="valor" select="./retenciones:Nacional/@CURPR"/>
      </xsl:call-template>
    </xsl:if>
    <xsl:if test="./retenciones:Extranjero">
      <xsl:call-template name="Opcional">
        <xsl:with-param name="valor" select="./retenciones:Extranjero/@NumRegIdTrib"/>
      </xsl:call-template>
    </xsl:if>
    <xsl:if test="./retenciones:Extranjero">
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./retenciones:Extranjero/@NomDenRazSocR"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template match="retenciones:Periodo">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@MesIni"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@MesFin"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@Ejerc"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="retenciones:Totales">
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@montoTotOperacion"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@montoTotGrav"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@montoTotExent"/>
    </xsl:call-template>
    <xsl:call-template name="Requerido">
      <xsl:with-param name="valor" select="./@montoTotRet"/>
    </xsl:call-template>
    <xsl:for-each select="./retenciones:ImpRetenidos">
      <xsl:apply-templates select="."/>
      <xsl:call-template name="Opcional">
        <xsl:with-param name="valor" select="./@BaseRet"/>
      </xsl:call-template>
      <xsl:call-template name="Opcional">
        <xsl:with-param name="valor" select="./@Impuesto"/>
      </xsl:call-template>
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./@montoRet"/>
      </xsl:call-template>
      <xsl:call-template name="Requerido">
        <xsl:with-param name="valor" select="./@TipoPagoRet"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="retenciones:Complemento">
    <xsl:for-each select="./*">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
