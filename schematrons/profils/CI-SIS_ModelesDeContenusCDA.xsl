<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:xhtml="http://www.w3.org/1999/xhtml"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:saxon="http://saxon.sf.net/"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:schold="http://www.ascc.net/xml/schematron"
                xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                xmlns:cda="urn:hl7-org:v3"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:jdv="http://esante.gouv.fr"
                xmlns:svs="urn:ihe:iti:svs:2008"
                xmlns:lab="urn:oid:1.3.6.1.4.1.19376.1.3.2"
                xmlns:pharm="urn:ihe:pharm"
                version="2.0"><!--Implementers: please note that overriding process-prolog or process-root is 
    the preferred method for meta-stylesheets to use where possible. -->
<xsl:param name="archiveDirParameter"/>
   <xsl:param name="archiveNameParameter"/>
   <xsl:param name="fileNameParameter"/>
   <xsl:param name="fileDirParameter"/>
   <xsl:variable name="document-uri">
      <xsl:value-of select="document-uri(/)"/>
   </xsl:variable>

   <!--PHASES-->


<!--PROLOG-->
<xsl:output xmlns:svrl="http://purl.oclc.org/dsdl/svrl" method="xml"
               omit-xml-declaration="no"
               standalone="yes"
               indent="yes"/>

   <!--XSD TYPES FOR XSLT2-->


<!--KEYS AND FUNCTIONS-->


<!--DEFAULT RULES-->


<!--MODE: SCHEMATRON-SELECT-FULL-PATH-->
<!--This mode can be used to generate an ugly though full XPath for locators-->
<xsl:template match="*" mode="schematron-select-full-path">
      <xsl:apply-templates select="." mode="schematron-get-full-path-2"/>
   </xsl:template>

   <!--MODE: SCHEMATRON-FULL-PATH-->
<!--This mode can be used to generate an ugly though full XPath for locators-->
<xsl:template match="*" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:choose>
         <xsl:when test="namespace-uri()=''">
            <xsl:value-of select="name()"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>*:</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>[namespace-uri()='</xsl:text>
            <xsl:value-of select="namespace-uri()"/>
            <xsl:text>']</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:variable name="preceding"
                    select="count(preceding-sibling::*[local-name()=local-name(current())                                   and namespace-uri() = namespace-uri(current())])"/>
      <xsl:text>[</xsl:text>
      <xsl:value-of select="1+ $preceding"/>
      <xsl:text>]</xsl:text>
   </xsl:template>
   <xsl:template match="@*" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:choose>
         <xsl:when test="namespace-uri()=''">@<xsl:value-of select="name()"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>@*[local-name()='</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>' and namespace-uri()='</xsl:text>
            <xsl:value-of select="namespace-uri()"/>
            <xsl:text>']</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <!--MODE: SCHEMATRON-FULL-PATH-2-->
<!--This mode can be used to generate prefixed XPath for humans-->
<xsl:template match="node() | @*" mode="schematron-get-full-path-2">
      <xsl:for-each select="ancestor-or-self::*">
         <xsl:text>/</xsl:text>
         <xsl:value-of select="name(.)"/>
         <xsl:if test="preceding-sibling::*[name(.)=name(current())]">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/>
            <xsl:text>]</xsl:text>
         </xsl:if>
      </xsl:for-each>
      <xsl:if test="not(self::*)">
         <xsl:text/>/@<xsl:value-of select="name(.)"/>
      </xsl:if>
   </xsl:template>
   <!--MODE: SCHEMATRON-FULL-PATH-3-->
<!--This mode can be used to generate prefixed XPath for humans 
	(Top-level element has index)-->
<xsl:template match="node() | @*" mode="schematron-get-full-path-3">
      <xsl:for-each select="ancestor-or-self::*">
         <xsl:text>/</xsl:text>
         <xsl:value-of select="name(.)"/>
         <xsl:if test="parent::*">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/>
            <xsl:text>]</xsl:text>
         </xsl:if>
      </xsl:for-each>
      <xsl:if test="not(self::*)">
         <xsl:text/>/@<xsl:value-of select="name(.)"/>
      </xsl:if>
   </xsl:template>

   <!--MODE: GENERATE-ID-FROM-PATH -->
<xsl:template match="/" mode="generate-id-from-path"/>
   <xsl:template match="text()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.text-', 1+count(preceding-sibling::text()), '-')"/>
   </xsl:template>
   <xsl:template match="comment()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.comment-', 1+count(preceding-sibling::comment()), '-')"/>
   </xsl:template>
   <xsl:template match="processing-instruction()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.processing-instruction-', 1+count(preceding-sibling::processing-instruction()), '-')"/>
   </xsl:template>
   <xsl:template match="@*" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.@', name())"/>
   </xsl:template>
   <xsl:template match="*" mode="generate-id-from-path" priority="-0.5">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:text>.</xsl:text>
      <xsl:value-of select="concat('.',name(),'-',1+count(preceding-sibling::*[name()=name(current())]),'-')"/>
   </xsl:template>

   <!--MODE: GENERATE-ID-2 -->
<xsl:template match="/" mode="generate-id-2">U</xsl:template>
   <xsl:template match="*" mode="generate-id-2" priority="2">
      <xsl:text>U</xsl:text>
      <xsl:number level="multiple" count="*"/>
   </xsl:template>
   <xsl:template match="node()" mode="generate-id-2">
      <xsl:text>U.</xsl:text>
      <xsl:number level="multiple" count="*"/>
      <xsl:text>n</xsl:text>
      <xsl:number count="node()"/>
   </xsl:template>
   <xsl:template match="@*" mode="generate-id-2">
      <xsl:text>U.</xsl:text>
      <xsl:number level="multiple" count="*"/>
      <xsl:text>_</xsl:text>
      <xsl:value-of select="string-length(local-name(.))"/>
      <xsl:text>_</xsl:text>
      <xsl:value-of select="translate(name(),':','.')"/>
   </xsl:template>
   <!--Strip characters--><xsl:template match="text()" priority="-1"/>

   <!--SCHEMA SETUP-->
<xsl:template match="/">
      <xsl:processing-instruction xmlns:svrl="http://purl.oclc.org/dsdl/svrl" name="xml-stylesheet">type="text/xsl" href="rapportSchematronToHtml4.xsl"</xsl:processing-instruction>
      <xsl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl"/>
      <svrl:schematron-output xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                              title="Rapport de conformité du document aux spécifications françaises (corps – sections, entrées, jeux de valeurs IHE)"
                              schemaVersion="CI-SIS_ModelesDeContenusCDA.sch">
         <xsl:attribute name="phase">CI-SIS_ModelesDeContenusCDA</xsl:attribute>
         <xsl:attribute name="document">
            <xsl:value-of select="document-uri(/)"/>
         </xsl:attribute>
         <xsl:attribute name="dateHeure">
            <xsl:value-of select="format-dateTime(current-dateTime(), '[D]/[M]/[Y] à [H]:[m]:[s] (temps UTC[Z])')"/>
         </xsl:attribute>
         <xsl:text/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_allergiesAndIntoleranceConcern_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M7"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_allergiesAndIntolerances_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M8"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_autorisationSubstitution_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M9"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_birthEventOrganizer_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M10"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_bloodTypeObservation_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M11"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_concernEntry_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M12"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_encounter_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M13"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_familyHistoryObservation_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M14"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_immunizations_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M15"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_instructionsPatient_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M16"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_instructionsDispensateur_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M17"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_itemPlanTraitement_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M18"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_medications_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M19"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_patientTransfer_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M20"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_periodeRenouvellement_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M21"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_pregnancyHistoryOrganizer_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M22"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_pregnancyObservation_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M23"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_problemConcernEntry_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M24"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_problemEntry_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M25"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_produitDeSante_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M26"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_quantiteProduit_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M27"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_referenceItemPlanTraitement_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M28"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_severity_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M29"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_simpleObservation_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M30"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_socialHistoryObservation_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M31"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_supplyEntry_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M32"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_surveyObservation_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M33"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_traitementPrescrit_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M34"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_traitementPrescritSubordonnee_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M35"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_transport_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M36"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_vitalSignsObservation_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M37"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_vitalSignsOrganizer_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M38"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_disposition_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M39"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_statutDuDocument_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M40"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_evenementIndesirablePendantHospitalisation_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M41"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_evenementIndesirableSuiteAdministrationDerivesSang_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M42"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_identificationMicroOrganismesMultiresistants_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M43"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_accidentsTransfusionnels_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M44"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_payers_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M45"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_comments_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M46"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_acte_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M47"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_acteSubstitution_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M48"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_diagnosticDuCancer_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M49"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_administrationDeDerivesDuSang_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M50"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_certitude_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M51"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_criticite_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M52"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_dateRetraite_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M53"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_directiveAnticipee_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M54"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_doseAntigene_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M55"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_dureeOccupationPoste_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M56"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_participantBodyProcedureStepsAPSR2_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M57"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_fluideIntraveineux_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M58"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_surveyPanel_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M59"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_historiqueDesProfessions_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M60"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_historiqueStatutsProfessionnels_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M61"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_horairesDeTravail_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M62"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_scoreDepressionGeriatiqueComposant_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M63"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_scoreDepressionGeriatique_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M64"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_scoreBradenComposant_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M65"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_scoreBraden_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M66"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_traitementDispense_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M67"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_TNMy_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M68"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_TNM-T_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M69"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_TNM-statutTumoralResiduel_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M70"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_TNM-r_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M71"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_nombreNoeuds_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M72"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_TNM-N_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M73"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_TNM-marqueursTumorauxSeriques_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M74"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_TNM-M_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M75"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_TNM-InvasionVeineuse_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M76"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_TNM-InvasionPerineurale_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M77"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_TNM-InvasionLymphatique_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M78"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_TNM-classification_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M79"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_TNM-a_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M80"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_regionInteretSurImage_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M81"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_referencesExternes_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M82"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_referenceItemPrescription_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M83"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_referenceItemDispensation_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M84"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_referenceItemAdministration_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M85"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_referenceConseilDispensateur_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M86"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_rangDeLaVaccination_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M87"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_professionLaPlusLongue_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M88"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_periodeActiviteEnZoneDangeureuse_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M89"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_organismeAssuranceMaladie_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M90"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_observationTNM_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M91"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_observationSurEchelleDouleur_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M92"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_observationAnatomoPathologique_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M93"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_notesDuDispensateur_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M94"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_laboratoryObservation_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M95"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_joursDeTravailHebdomadaire_fr</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M96"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_isolatMicrobiologique_fr</xsl:attribute>
            <svrl:text>Contrôle d'un isolat microbiologie dans un élément organizer</svrl:text>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M97"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_imageIllustrativeAPSR_fr</xsl:attribute>
            <svrl:text>Contrôle d'une image illustrative dans un élément observationMedia</svrl:text>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M98"/>
      </svrl:schematron-output>
   </xsl:template>

   <!--SCHEMATRON PATTERNS-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Rapport de conformité du document aux spécifications françaises (corps – sections, entrées, jeux de valeurs IHE)</svrl:text>

   <!--PATTERN E_allergiesAndIntoleranceConcern_frCI-SIS Allergies and Intolerance Concern-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Allergies and Intolerance Concern</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.3']"
                 priority="1000"
                 mode="M7">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.3']"/>
      <xsl:variable name="count_templateId" select="count(cda:templateId)"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:act[@classCode='ACT' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_allergiesAndIntoleranceConcern_fr] Erreur de conformité CI-SIS: Les attributs classCode et moodCode prennent respectivement les valeurs 'ACT' et 'EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_allergiesAndIntoleranceConcern_fr] Erreur de conformité CI-SIS: Un élément "Allergies and Intolerance Concern" comporte un seul identifiant "id"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code[@nullFlavor='NA']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_allergiesAndIntoleranceConcern_fr] Erreur de conformité CI-SIS: L’élément code prend la valeur nullFlavor='NA' car l'identification du problème est faite à partir des éléments entryRelationship.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_allergiesAndIntoleranceConcern_fr] Erreur de conformité CI-SIS: Un élément "Allergies and Intolerance Concern" comporte un seul code
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code = &#34;completed&#34; or             @code = &#34;active&#34; or             @code = &#34;aborted&#34; or             @code = &#34;suspended&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_allergiesAndIntoleranceConcern_fr] Erreur de conformité CI-SIS: L'élément "statusCode" sera présent.
            Il prendra la valeur "completed" pour les problèmes résolus, ou "active" pour les problèmes 
            toujours en cours dinvestigation, "aborted" pour les problèmes ayant été stoppées avant la fin 
            et "suspended" pour ceux qui ont été mis en suspens.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--REPORT -->
<xsl:if test="cda:effectiveTime/cda:width or cda:effectiveTime/cda:center">
         <svrl:successful-report xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                 test="cda:effectiveTime/cda:width or cda:effectiveTime/cda:center">
            <xsl:attribute name="location">
               <xsl:apply-templates select="." mode="schematron-select-full-path"/>
            </xsl:attribute>
            <svrl:text> 
            [E_allergiesAndIntoleranceConcern_fr] Erreur de conformité CI-SIS: Bien que CDA permette de nombreuses modalités pour exprimer un intervalle de 
            temps (low/high, low/width, high/width, ou center/width), allergiesAndIntoleranceConcern sera contraint à l'utilisation
            exclusive de la forme low/high.</svrl:text>
         </svrl:successful-report>
      </xsl:if>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:effectiveTime/cda:low[@value or @nullFlavor]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_allergiesAndIntoleranceConcern_fr] Erreur de conformité CI-SIS : La composante "low" de l'élément "effectiveTime" doit être exprimée dans 
            un élément "Allergies And Intolerance Concern".
           </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M7"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M7"/>
   <xsl:template match="@*|node()" priority="-2" mode="M7">
      <xsl:apply-templates select="*" mode="M7"/>
   </xsl:template>

   <!--PATTERN E_allergiesAndIntolerances_frCI-SIS Allergies and Intolerances-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Allergies and Intolerances</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.6&#34;]" priority="1000"
                 mode="M8">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.6&#34;]"/>
      <xsl:variable name="count_templateId" select="count(cda:templateId)"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_AllergiesAndIntolerances_fr] : Erreur de conformité CI-SIS : Un élément "Allergies and Intolerance" comporte obligatoirement un identifiant "id".
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='2.16.840.1.113883.10.20.1.18'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_AllergiesAndIntolerances_fr] : Erreur de conformité CI-SIS : L'élément de templatId de conformité CCD '2.16.840.1.113883.10.20.1.18' doit être présent
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code[@codeSystem=&#34;2.16.840.1.113883.5.4&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_AllergiesAndIntolerances_fr] Erreur de Conformité CI-SIS:
            L'élément 'codeSystem' doit obligatoirement être issu de l'ObservationIntoleranceType (2.16.840.1.113883.5.4).</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--REPORT -->
<xsl:if test="cda:effectiveTime/cda:width or cda:effectiveTime/cda:center">
         <svrl:successful-report xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                 test="cda:effectiveTime/cda:width or cda:effectiveTime/cda:center">
            <xsl:attribute name="location">
               <xsl:apply-templates select="." mode="schematron-select-full-path"/>
            </xsl:attribute>
            <svrl:text> 
            [E_allergiesAndIntolerances_fr] Erreur de conformité CI-SIS: Bien que CDA permette de nombreuses modalités pour exprimer un intervalle de 
            temps (low/high, low/width, high/width, ou center/width), allergiesAndIntolerances sera contraint à l'utilisation
            exclusive de la forme low/high.</svrl:text>
         </svrl:successful-report>
      </xsl:if>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:effectiveTime/cda:low[@value or @nullFlavor]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_allergiesAndIntolerances_fr] Erreur de conformité CI-SIS : La composante "low" de l'élément "effectiveTime" doit être exprimée dans 
            un élément "Allergies And Intolerances".
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code = &#34;completed&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_allergiesAndIntolerances_fr] Erreur de conformité CI-SIS: L'élément "statusCode" sera présent et prendra la valeur "completed"</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value/cda:originalText"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_allergiesAndIntolerances_fr] Erreur de conformité CI-SIS: L'élément "value" doit contenir un élément originalText</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:participant) or (cda:participant/cda:participantRole/cda:playingEntity/cda:code/cda:originalText/cda:reference)"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_allergiesAndIntolerances_fr] Erreur de Conformité CI-SIS: Si l'élément participant est présent, le code de la playingEntity dans
            le paticipantRole devra être présent avec un originalText et une référence qui renvoit vers la partie narrative
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:entryRelationship/*/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.1'])&lt;2"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_allergiesAndIntolerances_fr] Erreur de Conformité CI-SIS: une seule entryRelationship avec un templateId (1.3.6.1.4.1.19376.1.5.3.1.4.1) au maximum est autorisée, elle décrit la sévérité de l'allergie/intolérance
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:entryRelationship/*/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.1'])&lt;2"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_allergiesAndIntolerances_fr] Erreur de Conformité CI-SIS: une seule entryRelationship avec un templateId (1.3.6.1.4.1.19376.1.5.3.1.4.1.1) au maximum est autorisée, elle décrit le statut du problème
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M8"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M8"/>
   <xsl:template match="@*|node()" priority="-2" mode="M8">
      <xsl:apply-templates select="*" mode="M8"/>
   </xsl:template>

   <!--PATTERN E_autorisationSubstitution_frCI-SIS Entrée "FR-Autorisation-substitution"-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Entrée "FR-Autorisation-substitution"</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.9.1']" priority="1000"
                 mode="M9">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.9.1']"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.2.250.1.213.1.1.3.87']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
                [1] [E_autorisationSubstitution_fr.sch] Erreur de conformité CI-SIS : 
                L'entrée "FR-Autorisation-substitution" doit avoir un 'templateId' avec l'attribut @root="1.2.250.1.213.1.1.3.87"
            </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="(count(cda:code[@code='N'][@codeSystem='2.16.840.1.113883.5.1070'])=1) or                            (count(cda:code[@code='G'][@codeSystem='2.16.840.1.113883.5.1070'])=1)"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
                [2] [E_autorisationSubstitution_fr.sch] Erreur de conformité CI-SIS : 
                Dans l'entrée "FR-Autorisation-substitution", la valeur de l'attribut du code[@code] doit être obligatoirement 'N' ou 'G' et doit être issu du jeu de valeur JDV_HL7_ActSubstanceAdminSubstitutionCode-CISIS (2.16.840.1.113883.5.1070)
            </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M9"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M9"/>
   <xsl:template match="@*|node()" priority="-2" mode="M9">
      <xsl:apply-templates select="*" mode="M9"/>
   </xsl:template>

   <!--PATTERN E_birthEventOrganizer_fr-->


	<!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2&#34;]"
                 priority="1000"
                 mode="M10">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_birthEventOrganizer_fr] Erreur de conformité CI-SIS : Dans l'élément "Birth Event Organizer", un seul élément "id" doit être présent
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code[@codeSystem='2.16.840.1.113883.6.96']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_birthEventOrganizer_fr] Erreur de conformité CI-SIS : Dans l'élément "Birth Event Organizer", le code doit être codé en SNOMED-CT
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code='completed']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_birthEventOrganizer_fr] Erreur de conformité CI-SIS : L'élément statusCode d'un "Birth Event Organizer" sera donc toujours fixé à la valeur code='completed'. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:subject)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_birthEventOrganizer_fr] : Un organizer "Birth Event Organizer" ne doit contenir qu'un seul élément "subject" pour décrire le nouveau né
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:subject/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.15.2'])=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_birthEventOrganizer_fr] : Le templateId du sujet doit être '1.3.6.1.4.1.19376.1.5.3.1.4.15.2' et ne peut être présent qu'une seule fois
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:subject/cda:relatedSubject/cda:code)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_birthEventOrganizer_fr] : L'élément relatedSubject du sujet doit obligatoirement contenir un code
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:subject/cda:relatedSubject/cda:subject)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_birthEventOrganizer_fr] : L'élément relatedSubject du sujet doit obligatoirement contenir un élément 'subject' qui groupera les caractéristiques du nouveau né
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:subject/cda:relatedSubject/cda:subject/cda:administrativeGenderCode)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_birthEventOrganizer_fr] : Le sexe du nouveau né doit obligatoirement être présent
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:subject/cda:relatedSubject/cda:subject/cda:birthTime)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_birthEventOrganizer_fr] : La date de naissance du nouveau né doit obligatoirement être présente
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M10"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M10"/>
   <xsl:template match="@*|node()" priority="-2" mode="M10">
      <xsl:apply-templates select="*" mode="M10"/>
   </xsl:template>

   <!--PATTERN E_bloodTypeObservation_frIHE PCC v3.0 vital signs Organizer-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">IHE PCC v3.0 vital signs Organizer</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.6']"
                 priority="1000"
                 mode="M11">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.6']"/>
      <xsl:variable name="count_id" select="count(cda:id)"/>
      <xsl:variable name="count_value" select="count(cda:value)"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_id=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_bloodTypeObservation_fr.sch] Erreur de conformité CI-SIS : L'élément bloodTypeObservation doit contenir un seul élément id (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code[@displayName='ABO+RH' and @codeSystemName='LOINC']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_bloodTypeObservation_fr.sch] Erreur de conformité CI-SIS : L'élément bloodTypeObservation doit contenir un élément code avec les attributs @displayName ='ABO+RH' et @codeSystemName='LOINC'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:text/cda:reference"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_bloodTypeObservation_fr.sch] Erreur de conformité CI-SIS : L'élément bloodTypeObservation doit contenir un élément text, lui même contenant un élément référence
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code='completed']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_bloodTypeObservation_fr.sch] Erreur de conformité CI-SIS : L'élément bloodTypeObservation doit contenir un élément statusCode fixé à la valeur @code='completed'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_value=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_bloodTypeObservation_fr.sch] Erreur de conformité CI-SIS : L'élément bloodTypeObservation doit contenir un seul élément value (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M11"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M11"/>
   <xsl:template match="@*|node()" priority="-2" mode="M11">
      <xsl:apply-templates select="*" mode="M11"/>
   </xsl:template>

   <!--PATTERN E_concernEntry_frCI-SIS Concern Entry-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Concern Entry</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.5.1&#34;]"
                 priority="1000"
                 mode="M12">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.5.1&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:author) or (cda:author/cda:assignedAuthor/cda:id and cda:author/cda:assignedAuthor/cda:addr and cda:author/cda:assignedAuthor/cda:telecom and cda:author/cda:assignedAuthor/cda:assignedPerson/cda:name and cda:author/cda:assignedAuthor/cda:representedOrganization/cda:name)"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
                [E_concernEntry_fr] Erreur de conformité CI-SIS : si l'élément author est présent, il doit contenir l'élément assignedAuthor qui devra contenir les éléments: id, addr, telecom, assignedPerson (name) et representedOrganization (name)
            </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M12"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M12"/>
   <xsl:template match="@*|node()" priority="-2" mode="M12">
      <xsl:apply-templates select="*" mode="M12"/>
   </xsl:template>

   <!--PATTERN E_encounter_frIHE PCC v3.0 Encounter - errors validation phase-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">IHE PCC v3.0 Encounter - errors validation phase</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.14']"
                 priority="1000"
                 mode="M13">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.14']"/>
      <xsl:variable name="count_id" select="count(cda:id)"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_id=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_encounter_fr.sch] Erreur de conformité CI-SIS : L'élément 'encounter' doit contenir un élément id (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M13"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M13"/>
   <xsl:template match="@*|node()" priority="-2" mode="M13">
      <xsl:apply-templates select="*" mode="M13"/>
   </xsl:template>

   <!--PATTERN E_familyHistoryObservation_frCI-SIS Family History Observation-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Family History Observation</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.3&#34;]"
                 priority="1000"
                 mode="M14">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.3&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_familyHistoryObservation_fr] Erreur de conformité CI-SIS : Dans l'élément "Family History Observation", 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_familyHistoryObservation_fr] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_familyHistoryObservation_fr] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code='completed']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_familyHistoryObservation_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" d'une "Family History Observation"
            est toujours fixé à la valeur code='completed'. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:effectiveTime)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_familyHistoryObservation_fr] : Erreur de conformité CI-SIS : L'élément effectiveTime doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:interpretationCode)&lt;2"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_familyHistoryObservation_fr] : L'élément interpretationCode ne doit pas être présent plus d'une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:methodCode)&lt;2"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_familyHistoryObservation_fr] : L'élément methodCode ne doit pas être présent plus d'une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:targetSiteCode)&lt;2"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_familyHistoryObservation_fr] : L'élément targetSiteCode ne doit pas être présent plus d'une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:author)&lt;2"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_familyHistoryObservation_fr] : L'élément author ne doit pas être présent plus d'une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M14"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M14"/>
   <xsl:template match="@*|node()" priority="-2" mode="M14">
      <xsl:apply-templates select="*" mode="M14"/>
   </xsl:template>

   <!--PATTERN E_immunizations_frCI-SIS Entrée Vaccination-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Entrée Vaccination</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.12']"
                 priority="1000"
                 mode="M15">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.12']"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_immunizations_fr] Erreur de Conformité CI-SIS : 
            Une entrée 'Immunization' ne peut avoir qu'un seul identifiant (id).
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:statusCode)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_immunizations_fr] Erreur de Conformité CI-SIS :
            Une entrée 'Immunization' doit comporter un (et un seul) élément statusCode.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:text/cda:reference[@value])=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_immunizations_fr] Erreur de Conformité CI-SIS :
            Une entrée 'Immunization' doit comporter un (et un seul) élément 'text' avec une 'reference'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:effectiveTime)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_immunizations_fr] Erreur de Conformité CI-SIS :
            Une entrée 'Immunization' doit comporter un (et un seul) élément 'effectiveTime'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/cda:originalText/cda:reference)=1 or cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/@nullFlavor"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_immunizations_fr] Erreur de conformité CI-SIS :
            Une entrée 'Immunization' doit comporter un (et un seul) élément 'consumable' pour décrire le produit (manufacturedProduct) avec une entrée de type Product Entry.
            Cette entrée 'Product Entry' doit comporter un élément 'code' et une description narrative via une référence à l'élément narratif de la section (originalText/reference).
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:entryRelationship) or              cda:entryRelationship[@typeCode='CAUS']/cda:observation/cda:templateId[@root='2.16.840.1.113883.10.20.1.28'] or              cda:entryRelationship[@typeCode='SUBJ']/cda:act/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.2'] or             cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:templateId[@root='2.16.840.1.113883.10.20.1.46'] or              cda:entryRelationship[@typeCode='REFR']/cda:supply/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.7.3']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_immunizations_fr] Erreur de conformité CI-SIS : 
            Dans une entrée 'Immunization', les éléments 'entryRelationship' ne sont pas obligatoires.
            S'ils sont présents, ils doivent respecter les exigences suivantes :
            - Réaction observée ('entryRelationship' avec typeCode='CAUS') : doit comporter une entrée de type 'observation' avec un OID="2.16.840.1.113883.10.20.1.28".
            - Commentaire ('entryRelationship' avec typeCode='SUBJ') : doit comporter une entrée de type 'act' avec un OID="1.3.6.1.4.1.19376.1.5.3.1.4.2".
            - Rang de la vaccination ('entryRelationship' avec typeCode='SUBJ') : doit comporter une entrée de type 'observation' avec un OID="2.16.840.1.113883.10.20.1.46".
            - Lien avec la prescription ('entryRelationship' avec typeCode 'REFR') : doit comporter une entrée de type 'supply' avec un OID="1.3.6.1.4.1.19376.1.5.3.1.4.7.3".
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:entryRelationship[@typeCode='REFR']/cda:supply/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.7.3'])&lt;2"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_immunizations_fr] Erreur de conformité CI-SIS : 
            Dans une entrée 'Immunization', il ne peut y avoir qu'un seul élément 'entryRelationship' (typeCode 'REFR') décrivant le lien avec la prescription (entrée de type 'supply' avec un OID="1.3.6.1.4.1.19376.1.5.3.1.4.7.3").
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:entryRelationship[@typeCode='SUBJ']/cda:act/cda:templateId[@root='2.16.840.1.113883.10.20.1.46'])&lt;2"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_immunizations_fr] Erreur de conformité CI-SIS :
            Dans une entrée 'Immunization', il ne peut y avoir qu'un seul élément 'entryRelationship' (typeCode 'SUBJ') décrivant le rang de la vaccination (entrée de type 'observation' avec un OID="2.16.840.1.113883.10.20.1.46").
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:entryRelationship[@typeCode='SUBJ']/cda:act/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.2'])&lt;2"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_immunizations_fr] Erreur de conformité CI-SIS : L'élément entryRelationship représentant le commentaire ne peut être présent qu'une fois
            Dans une entrée 'Immunization', il ne peut y avoir qu'un seul élément 'entryRelationship' (typeCode 'SUBJ') portant un commentaire (entrée de type 'act' avec un OID="1.3.6.1.4.1.19376.1.5.3.1.4.2").            
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.46']) or (cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.46']             and cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.46']/cda:code/@code='30973-2')"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_immunizations_fr] Erreur de conformité CI-SIS :
            Dans une entrée 'Immunization', l'entryRelationship (typeCode 'SUBJ') décrivant le rang de la vaccination (entrée de type 'observation' avec un OID="2.16.840.1.113883.10.20.1.46") doit obligatoirement avoir le code @code='30973-2'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M15"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M15"/>
   <xsl:template match="@*|node()" priority="-2" mode="M15">
      <xsl:apply-templates select="*" mode="M15"/>
   </xsl:template>

   <!--PATTERN E_instructionsPatient_frCI-SIS entrée "FR-Instructions-au-patient"-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS entrée "FR-Instructions-au-patient"</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.3']" priority="1000"
                 mode="M16">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.3']"/>
      <xsl:apply-templates select="*" mode="M16"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M16"/>
   <xsl:template match="@*|node()" priority="-2" mode="M16">
      <xsl:apply-templates select="*" mode="M16"/>
   </xsl:template>

   <!--PATTERN E_instructionsDispensateur_frCI-SIS Entrée "FR-Instructions-au-dispensateur"-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Entrée "FR-Instructions-au-dispensateur"</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.3.1']"
                 priority="1000"
                 mode="M17">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.3.1']"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.3.1'] and cda:templateId[@root='2.16.840.1.113883.10.20.1.43']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_instructionsDispensateur_fr.sch] Erreur de conformité CI-SIS : L'entryRelationship "FR-Instructions-au-dispensateur" doit avoir trois occurrences de 'templateId' :
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.3.1" (Conformité de l'entrée au parent IHE PCC)
            - Un deuxième 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.43" (Conformité de l'entrée au parent CDA)
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M17"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M17"/>
   <xsl:template match="@*|node()" priority="-2" mode="M17">
      <xsl:apply-templates select="*" mode="M17"/>
   </xsl:template>

   <!--PATTERN E_itemPlanTraitement_frCI-SIS Entrée "FR-Item-plan-traitement"-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Entrée "FR-Item-plan-traitement"</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.7']" priority="1000"
                 mode="M18">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.7']"/>
      <xsl:variable name="count_templateId"
                    select="count(//cda:entryRelationship/cda:substanceAdministration/cda:entryRelationship[@typeCode='REFR']/cda:substanceAdministration[@classCode='SBADM'][@moodCode='INT']/cda:templateId)"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.2.250.1.213.1.1.3.96']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
                [1] [E_itemPlanTraitement_fr.sch] Erreur de conformité CI-SIS : 
                Le quatrième templateId doit avoir un @root="" (Conformité aux spécifications CI-SIS)
            </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_templateId=5"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
                [2] [E_itemPlanTraitement_fr.sch] Erreur de conformité CI-SIS : 
                Il doit y avoir 5 occurences de l'élément 'templateId' dans cette entrée(cardinalité [5..5]) :
                - La première pour la déclaration de conformité de l'entrée aux spécifications IHE Pharm suppl. MTP @root="1.3.6.1.4.1.19376.1.9.1.3.2"
                - La deuxième pour la déclaration de conformité de l'entrée aux spécifications CCD @root="2.16.840.1.113883.10.20.1.24"
                - La troisème pour la déclaration de conformité de l'entrée aux spécifications IHE PCC @root="1.3.6.1.4.1.19376.1.5.3.1.4.7"
                - La quatrième pour la déclaration de conformité de l'entrée aux spécifications CI-SIS @root="1.2.250.1.213.1.1.3.96"
                - La cinquième pour la déclaration du mode d'administration du traitement prescrit (à choisir parmi la liste des modes d'administration)
            </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M18"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M18"/>
   <xsl:template match="@*|node()" priority="-2" mode="M18">
      <xsl:apply-templates select="*" mode="M18"/>
   </xsl:template>

   <!--PATTERN E_medications_frCI-SIS Medications-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Medications</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.7&#34;]" priority="1008"
                 mode="M19">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.7&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:templateId)&gt;2"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_medications_fr] Erreur de conformité CI-SIS : L'entrée de type "substanceAdministration" doit contenir au minimum trois éléments "templateId".            
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="(count(cda:doseQuantity/cda:low)=1 and count(cda:doseQuantity/cda:high)=1) or cda:doseQuantity/@nullFlavor or not(cda:doseQuantity)"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_medications_fr] Erreur de conformité CI-SIS : L'élément "doseQuantity" (dose à administrer) n'est pas obligatoire mais s'il est présent, ces éléments "low" et "high" sont obligatoires et ne doivent être présents qu'une seule fois (cardinalité [1..1]).
            L'élément "doseQuantity" peut aussi prendre la valeur nullFlavor.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:rateQuantity) or cda:rateQuantity/@nullFlavor or (count(cda:rateQuantity/cda:low)=1 and count(cda:rateQuantity/cda:high)=1)"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_medications_fr] Erreur de conformité CI-SIS : L'élément "rateQuantity" (rythme d'administration) n'est pas obligatoire mais s'il est présent, ces éléments "low" et "high" sont obligatoires et ne doivent être présents qu'une seule fois (cardinalité [1..1]).
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:maxDoseQuantity)&lt;2 "/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_medications_fr] Erreur de conformité CI-SIS : L'élément "maxDoseQuantity" (dose maximale) ne peut être présent plus d'une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:consumable/cda:manufacturedProduct/cda:templateId[@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.7.2&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_medications_fr] Erreur de conformité CI-SIS : L'élément "consumable" doit obligatoirement être présent dans une entrée de type "substanceAdministration".
            Il comportera un élément "manufacturedProduct" de type "Produit de santé" (1.3.6.1.4.1.19376.1.5.3.1.4.7.2).</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:consumable/cda:manufacturedProduct/cda:templateId)&gt;1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_medications_fr] Erreur de conformité CI-SIS : L'élément "manufacturedProduct" contient au minimum deux éléments "templateId" : "1.3.6.1.4.1.19376.1.5.3.1.4.7.2" et "2.16.840.1.113883.10.20.1.53".
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/cda:originalText/cda:reference)=1 or cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/@nullFlavor"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_medications_fr] Erreur de conformité CI-SIS : L'entréede type "Produit de santé" (1.3.6.1.4.1.19376.1.5.3.1.4.7.2) doit contenir un médicament administré (manufacturedMaterial) avec sa codification CIS-Spécialité
            et une description narrative via une référence à l'élément narratif de la section.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:entryRelationship)                     or cda:entryRelationship[@typeCode='RSON']/cda:act/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.4.1']             or cda:entryRelationship[@typeCode='REFR']/cda:supply/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.7.3']             or cda:entryRelationship[@typeCode='COMP']/cda:substanceAdministration             or cda:entryRelationship[@typeCode='SUBJ']/cda:act/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.3']             or cda:entryRelationship[@typeCode='SUBJ']/cda:act/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.3.1']             or cda:entryRelationship[@typeCode='COMP']/cda:observation/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13']             or cda:entryRelationship[@typeCode='REFR']/cda:substanceAdministration/cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.10']             or cda:entryRelationship[@typeCode='COMP']/cda:supply/cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.8']             or cda:entryRelationship[@typeCode='COMP']/cda:act/cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.9.1']             or cda:entryRelationship[@typeCode='COMP']/cda:supply/cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.15']             "/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_medications_fr] Erreur de conformité CI-SIS : Seuls les éléments "entryRelationship" optionnels suivants sont autorisés :
            - Motif du traitement : avec un typeCode='RSON' et une entrée Référence interne (1.3.6.1.4.1.19376.1.5.3.1.4.4.1)           
            - Référence de la prescription : avec un typeCode 'REFR' et une entrée Prescription (1.3.6.1.4.1.19376.1.5.3.1.4.7.3)
            - SubstanceAdministration subordonné : avec un typeCode='COMP' et une entrée de type substanceAdministration subordonnée            
            - Instructions au patient : avec un typeCode='SUBJ'  et une entrée Instructions au patient (1.3.6.1.4.1.19376.1.5.3.1.4.3)  
            - Instructions au dispensateur : avec un typeCode='SUBJ'  et une entrée Instructions au dispensateur (1.3.6.1.4.1.19376.1.5.3.1.4.3.1)            
            - Simple Observation : avec un typeCode='COMP' et une entrée Simple Observation (1.3.6.1.4.1.19376.1.5.3.1.4.13)            
            - Référence à un traitement d'un plan de traitement : avec un typeCode='REFR' et une entrée Référence à un traitement d'un plan de traitement (1.3.6.1.4.1.19376.1.9.1.3.10) 
            - Quantité à dispenser : avec un typeCode='COMP' et une entrée Quantité à dispenser (1.3.6.1.4.1.19376.1.9.1.3.8)
            - Autorisation de substitution : avec un typeCode='COMP' et une entrée Autorisation de substitution (1.3.6.1.4.1.19376.1.9.1.3.9.1)
            - Période de renouvellement : avec un typeCode='COMP' et une entrée Période de renouvellement (1.3.6.1.4.1.19376.1.9.1.3.15)
             
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M19"/>
   </xsl:template>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.7&#34;]/cda:entryRelationship[@typeCode=&#34;RSON&#34;]/cda:act"
                 priority="1007"
                 mode="M19">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.7&#34;]/cda:entryRelationship[@typeCode=&#34;RSON&#34;]/cda:act"/>

		    <!--REPORT -->
<xsl:if test="cda:templateId[@root != '1.3.6.1.4.1.19376.1.5.3.1.4.4.1'             and @root !='1.2.250.1.213.1.1.3.36' and @root !='2.16.840.1.113883.10.22.4.31']">
         <svrl:successful-report xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                 test="cda:templateId[@root != '1.3.6.1.4.1.19376.1.5.3.1.4.4.1' and @root !='1.2.250.1.213.1.1.3.36' and @root !='2.16.840.1.113883.10.22.4.31']">
            <xsl:attribute name="location">
               <xsl:apply-templates select="." mode="schematron-select-full-path"/>
            </xsl:attribute>
            <svrl:text>
            [E_medications_fr] Erreur de conformité CI-SIS : Dans une entryRelationship qui a un @typeCode="RSON" et qui est de type act, seule une entrée "Référence interne (1.3.6.1.4.1.19376.1.5.3.1.4.4.1)" est admise
        </svrl:text>
         </svrl:successful-report>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M19"/>
   </xsl:template>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.7&#34;]/cda:entryRelationship[@typeCode=&#34;REFR&#34;]/cda:supply"
                 priority="1006"
                 mode="M19">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.7&#34;]/cda:entryRelationship[@typeCode=&#34;REFR&#34;]/cda:supply"/>

		    <!--REPORT -->
<xsl:if test="cda:templateId[@root !='2.16.840.1.113883.10.20.1.34'             and @root !='1.3.6.1.4.1.19376.1.5.3.1.4.7.3'             and @root !='1.2.250.1.213.1.1.3.44']">
         <svrl:successful-report xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                 test="cda:templateId[@root !='2.16.840.1.113883.10.20.1.34' and @root !='1.3.6.1.4.1.19376.1.5.3.1.4.7.3' and @root !='1.2.250.1.213.1.1.3.44']">
            <xsl:attribute name="location">
               <xsl:apply-templates select="." mode="schematron-select-full-path"/>
            </xsl:attribute>
            <svrl:text>
            [E_medications_fr] Erreur de conformité CI-SIS : Dans une entryRelationship qui a un @typeCode="REFR" et qui est de type supply, seule une entrée "Prescription (1.3.6.1.4.1.19376.1.5.3.1.4.7.3)" est admise
        </svrl:text>
         </svrl:successful-report>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M19"/>
   </xsl:template>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.7&#34;]/cda:entryRelationship[@typeCode=&#34;SUBJ&#34;]/cda:act"
                 priority="1005"
                 mode="M19">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.7&#34;]/cda:entryRelationship[@typeCode=&#34;SUBJ&#34;]/cda:act"/>

		    <!--REPORT -->
<xsl:if test="cda:templateId[@root !='2.16.840.1.113883.10.20.1.49'             and @root !='1.3.6.1.4.1.19376.1.5.3.1.4.3'             and @root !='1.2.250.1.213.1.1.3.33'             and @root !='2.16.840.1.113883.10.20.1.43'             and @root !='1.3.6.1.4.1.19376.1.5.3.1.4.3.1'             and @root !='1.2.250.1.213.1.1.3.34'             ]">
         <svrl:successful-report xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                 test="cda:templateId[@root !='2.16.840.1.113883.10.20.1.49' and @root !='1.3.6.1.4.1.19376.1.5.3.1.4.3' and @root !='1.2.250.1.213.1.1.3.33' and @root !='2.16.840.1.113883.10.20.1.43' and @root !='1.3.6.1.4.1.19376.1.5.3.1.4.3.1' and @root !='1.2.250.1.213.1.1.3.34' ]">
            <xsl:attribute name="location">
               <xsl:apply-templates select="." mode="schematron-select-full-path"/>
            </xsl:attribute>
            <svrl:text>
            [E_medications_fr] Erreur de conformité CI-SIS : Dans une entryRelationship qui a un @typeCode="SUBJ" et qui est de type act,
            seules des entrées "Instructions au patient (1.3.6.1.4.1.19376.1.5.3.1.4.3)" et "Instructions au dispensateur (1.3.6.1.4.1.19376.1.5.3.1.4.3.1)" sont admises
        </svrl:text>
         </svrl:successful-report>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M19"/>
   </xsl:template>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.7&#34;]/cda:entryRelationship[@typeCode=&#34;COMP&#34;]/cda:observation"
                 priority="1004"
                 mode="M19">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.7&#34;]/cda:entryRelationship[@typeCode=&#34;COMP&#34;]/cda:observation"/>

		    <!--REPORT -->
<xsl:if test="cda:templateId[@root !='1.3.6.1.4.1.19376.1.5.3.1.4.13'             and @root !='1.2.250.1.213.1.1.3.48'             and not(starts-with(@root, '1.2.250.1.213.1.1.3.48.'))]">
         <svrl:successful-report xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                 test="cda:templateId[@root !='1.3.6.1.4.1.19376.1.5.3.1.4.13' and @root !='1.2.250.1.213.1.1.3.48' and not(starts-with(@root, '1.2.250.1.213.1.1.3.48.'))]">
            <xsl:attribute name="location">
               <xsl:apply-templates select="." mode="schematron-select-full-path"/>
            </xsl:attribute>
            <svrl:text>
            [E_medications_fr] Erreur de conformité CI-SIS : Dans une entryRelationship qui a un @typeCode="COMP" et qui est de type observation, seule une entrée "Simple Observation (1.3.6.1.4.1.19376.1.5.3.1.4.13)" est admise
        </svrl:text>
         </svrl:successful-report>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M19"/>
   </xsl:template>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.7&#34;]/cda:entryRelationship[@typeCode=&#34;REFR&#34;]/cda:substanceAdministration"
                 priority="1003"
                 mode="M19">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.7&#34;]/cda:entryRelationship[@typeCode=&#34;REFR&#34;]/cda:substanceAdministration"/>

		    <!--REPORT -->
<xsl:if test="cda:templateId[@root !='1.3.6.1.4.1.19376.1.9.1.3.10'             and @root !='1.2.250.1.213.1.1.3.85']">
         <svrl:successful-report xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                 test="cda:templateId[@root !='1.3.6.1.4.1.19376.1.9.1.3.10' and @root !='1.2.250.1.213.1.1.3.85']">
            <xsl:attribute name="location">
               <xsl:apply-templates select="." mode="schematron-select-full-path"/>
            </xsl:attribute>
            <svrl:text>
            [E_medications_fr] Erreur de conformité CI-SIS : Dans une entryRelationship qui a un @typeCode="REFR" et qui est de type substanceAdministration, seule une entrée "Référence à un traitement d'un plan de traitement (1.3.6.1.4.1.19376.1.9.1.3.10)" est admise
        </svrl:text>
         </svrl:successful-report>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M19"/>
   </xsl:template>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.7&#34;]/cda:entryRelationship[@typeCode=&#34;COMP&#34;]/cda:supply"
                 priority="1002"
                 mode="M19">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.7&#34;]/cda:entryRelationship[@typeCode=&#34;COMP&#34;]/cda:supply"/>

		    <!--REPORT -->
<xsl:if test="cda:templateId[@root !='1.3.6.1.4.1.19376.1.9.1.3.8'             and @root !='1.2.250.1.213.1.1.3.86' and @root !='1.3.6.1.4.1.19376.1.9.1.3.15'             and @root !='1.2.250.1.213.1.1.3.88']">
         <svrl:successful-report xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                 test="cda:templateId[@root !='1.3.6.1.4.1.19376.1.9.1.3.8' and @root !='1.2.250.1.213.1.1.3.86' and @root !='1.3.6.1.4.1.19376.1.9.1.3.15' and @root !='1.2.250.1.213.1.1.3.88']">
            <xsl:attribute name="location">
               <xsl:apply-templates select="." mode="schematron-select-full-path"/>
            </xsl:attribute>
            <svrl:text>
            
            [E_medications_fr] Erreur de conformité CI-SIS : Dans une entryRelationship qui a un @typeCode="COMP" et qui est de type supply,
            seules des entrées "Quantité à dispenser (1.3.6.1.4.1.19376.1.9.1.3.8)" et "Période de renouvellement (1.3.6.1.4.1.19376.1.9.1.3.15)" sont admises
        </svrl:text>
         </svrl:successful-report>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M19"/>
   </xsl:template>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.7&#34;]/cda:entryRelationship[@typeCode=&#34;COMP&#34;]/cda:act"
                 priority="1001"
                 mode="M19">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.7&#34;]/cda:entryRelationship[@typeCode=&#34;COMP&#34;]/cda:act"/>

		    <!--REPORT -->
<xsl:if test="cda:templateId[@root !='1.3.6.1.4.1.19376.1.9.1.3.9.1'             and @root !='1.2.250.1.213.1.1.3.87']">
         <svrl:successful-report xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                 test="cda:templateId[@root !='1.3.6.1.4.1.19376.1.9.1.3.9.1' and @root !='1.2.250.1.213.1.1.3.87']">
            <xsl:attribute name="location">
               <xsl:apply-templates select="." mode="schematron-select-full-path"/>
            </xsl:attribute>
            <svrl:text>
            [E_medications_fr] Erreur de conformité CI-SIS : Dans une entryRelationship qui a un @typeCode="COMP" et qui est de type act, seule une entrée "Autorisation de substitution (1.3.6.1.4.1.19376.1.9.1.3.9.1)" est admise
        </svrl:text>
         </svrl:successful-report>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M19"/>
   </xsl:template>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.7&#34; and not(cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.83&#34;)]/cda:routeCode"
                 priority="1000"
                 mode="M19">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.7&#34; and not(cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.83&#34;)]/cda:routeCode"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="@codeSystem='2.16.840.1.113883.5.112' or @codeSystem='0.4.0.127.0.16.1.1.2.1' or (@nullFlavor and not(@codeSystem))"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_medications_fr] Erreur de conformité CI-SIS : Un élément "routeCode" doit provenir du jeu de valeurs JDV_HL7_RouteOfAdministration-CISIS (2.16.840.1.113883.5.112) ou de la terminologie EDQM (0.4.0.127.0.16.1.1.2.1).
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M19"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M19"/>
   <xsl:template match="@*|node()" priority="-2" mode="M19">
      <xsl:apply-templates select="*" mode="M19"/>
   </xsl:template>

   <!--PATTERN E_patientTransfer_frIHE PCC v3.0 Patient Transfer - errors validation phase-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">IHE PCC v3.0 Patient Transfer - errors validation phase</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.1.25.1.4.1&#34;]"
                 priority="1000"
                 mode="M20">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.1.25.1.4.1&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code[@code = '80413-8']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_patientTransfer_fr] Erreur de conformité PCC : Le code utilisé pour un transfert est '80413-8'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code = &#34;completed&#34; or @code=&#34;normal&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_patientTransfer_fr] Erreur de conformité PCC : Le statut du transfert est obligatoire. l'attribut @code prend la valeur
            @code='completed' si le transfert à eu lieu (moodCode='EVN') ou @code='normal' lorsque le
            tranfert est projeté (moodCode='INT')
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:statusCode[@code = 'completed']) or              (cda:statusCode[@code = 'completed'] and (cda:effectiveTime/cda:low and cda:effectiveTime/cda:high))"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_patientTransfer_fr] Erreur de conformité PCC : effectiveTime est obligatoire lorsque le transfert a eu lieu. 
            Le sous-élément 'low' indique l'heure de départ et le sous-élément 'high' indique celle d'arrivée.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(self::cda:act[@negationInd='false']) or (self::cda:act[@negationInd='false' and @moodCode='EVN'] and cda:statusCode[@code = 'completed'])"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_patientTransfer_fr] Erreur de conformité PCC : l'attribut @code prend la valeur @code='completed' si le transfert à eu lieu (moodCode='EVN'). </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M20"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M20"/>
   <xsl:template match="@*|node()" priority="-2" mode="M20">
      <xsl:apply-templates select="*" mode="M20"/>
   </xsl:template>

   <!--PATTERN E_periodeRenouvellement_frCI-SIS Entrée "FR-Periode-de-renouvellement"-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Entrée "FR-Periode-de-renouvellement"</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.15']" priority="1000"
                 mode="M21">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.15']"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.2.250.1.213.1.1.3.88']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
                [1] [E_periodeRenouvellement_fr.sch] Erreur de conformité CI-SIS : 
                L'entrée "FR-Periode-de-renouvellement" doit avoir deux occurrences de 'templateId' :
                - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.9.1.3.15"
                - Un deuxième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.88"
            </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M21"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M21"/>
   <xsl:template match="@*|node()" priority="-2" mode="M21">
      <xsl:apply-templates select="*" mode="M21"/>
   </xsl:template>

   <!--PATTERN E_pregnancyHistoryOrganizer_frCI-SIS Pregnancy History Organizer-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Pregnancy History Organizer</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.5.1&#34;]"
                 priority="1000"
                 mode="M22">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.5.1&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code[@codeSystem='2.16.840.1.113883.6.96'])=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_pregnancyHistoryOrganizer_fr] : Erreur de conformité CI-SIS : Il doit y avoir un seul élément code et il doit être codé en SNOMED-CT (2.16.840.1.113883.6.96)
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M22"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M22"/>
   <xsl:template match="@*|node()" priority="-2" mode="M22">
      <xsl:apply-templates select="*" mode="M22"/>
   </xsl:template>

   <!--PATTERN E_pregnancyObservation_frCI-SIS Pregnancy Observation" (1.3.6.1.4.1.19376.1.5.3.1.4.13.5)-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Pregnancy Observation" (1.3.6.1.4.1.19376.1.5.3.1.4.13.5)</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.5&#34;]"
                 priority="1000"
                 mode="M23">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.5&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
         [E_pregnancyObservation_fr]: Erreur de conformité CI-SIS : Un élément "Pregnancy Observation" comporte obligatoirement un élément "id" (cardinalité [1..1])</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
         [E_pregnancyObservation_fr]: Erreur de conformité CI-SIS : Un élément "Pregnancy Observation" doit comporter un élément "code" (cardinalité [1..1])</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:text/cda:reference)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
         [E_pregnancyObservation_fr]: Erreur de conformité CI-SIS : Un élément "Pregnancy Observation"  doit comporter un élément "text" avec une référence (cardinalité [1..1])</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code='completed']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
         [E_pregnancyObservation_fr] Erreur de conformité CI-SIS : Un élément "Pregnancy Observation" contient un "statutCode" qui sera toujours fixé à la valeur code='completed'. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:effectiveTime"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
         [E_pregnancyObservation_fr] Erreur de conformité CI-SIS : Un élément "Pregnancy Observation" contient un seul "effectiveTime"</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:value)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
         [E_pregnancyObservation_fr] Erreur de conformité CI-SIS : Un élément "Pregnancy Observation" ne doit comporter qu'un seul élément "value"</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M23"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M23"/>
   <xsl:template match="@*|node()" priority="-2" mode="M23">
      <xsl:apply-templates select="*" mode="M23"/>
   </xsl:template>

   <!--PATTERN E_problemConcernEntry_frCI-SIS Problem Concern Entry-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Problem Concern Entry</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.5.2&#34;]"
                 priority="1000"
                 mode="M24">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.5.2&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code[@nullFlavor=&#34;NA&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_problemConcernEntry_fr] Ereur CI-SIS: L’élément code prend la valeur nullFlavor='NA' car l'identification du problème est faite à partir des éléments entryRelationship.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M24"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M24"/>
   <xsl:template match="@*|node()" priority="-2" mode="M24">
      <xsl:apply-templates select="*" mode="M24"/>
   </xsl:template>

   <!--PATTERN E_problemEntry_frCI-SIS Problem Entry-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Problem Entry</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']" priority="1000"
                 mode="M25">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']"/>
      <xsl:variable name="count_code" select="count(self::cda:observation/cda:code)"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_code=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_problemEntry_fr] Erreur de conformité CI-SIS : Dans l'élément "Problem Entry", il ne doit y avoir qu'un seul élément code
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code[@code and @codeSystem]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_problemEntry_fr] Erreur de conformité CI-SIS : L'élément "code", contient les attributs code et codeSystem
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:value)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_problemEntry_fr] Erreur de conformité CI-SIS : L'élément "value" ne doit être présent qu'une fois </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M25"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M25"/>
   <xsl:template match="@*|node()" priority="-2" mode="M25">
      <xsl:apply-templates select="*" mode="M25"/>
   </xsl:template>

   <!--PATTERN E_produitDeSante_frCI-SIS Entrée "FR-Produit-de-sante-prescrit"-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Entrée "FR-Produit-de-sante-prescrit"</svrl:text>

	  <!--RULE -->
<xsl:template match="//cda:entry/cda:substanceAdministration/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial"
                 priority="1000"
                 mode="M26">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="//cda:entry/cda:substanceAdministration/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:code[@codeSystem]) or cda:code[@codeSystem='1.2.250.1.213.2.3.1']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
                [1] [E_produitDeSante_fr.sch] Erreur de conformité CI-SIS : 
                Dans l'entrée "FR-Produit-de-sante" le produit de santé est codé en CIS dans la balise "code".
            </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M26"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M26"/>
   <xsl:template match="@*|node()" priority="-2" mode="M26">
      <xsl:apply-templates select="*" mode="M26"/>
   </xsl:template>

   <!--PATTERN E_quantiteProduit_frCI-SIS Entrée "FR-Quantite-de-produit"-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Entrée "FR-Quantite-de-produit"</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.8']" priority="1000"
                 mode="M27">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.8']"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.2.250.1.213.1.1.3.86']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
                [1] [E_quantiteProduit_fr.sch] Erreur de conformité CI-SIS : 
                L'entrée "FR-Quantite-de-produit" doit avoir deux occurrences de 'templateId' :
                - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.9.1.3.8"
                - Un deuxième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.86"
            </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M27"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M27"/>
   <xsl:template match="@*|node()" priority="-2" mode="M27">
      <xsl:apply-templates select="*" mode="M27"/>
   </xsl:template>

   <!--PATTERN E_referenceItemPlanTraitement_frCI-SIS Entrée "FR-Reference-item-plan-traitement"-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Entrée "FR-Reference-item-plan-traitement"</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.10']" priority="1000"
                 mode="M28">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.10']"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.2.250.1.213.1.1.3.85']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
                [1] [E_referenceItemPlanTraitement_fr.sch] Erreur de conformité CI-SIS : 
                L'entrée "FR-Reference-item-plan-traitement" doit avoir deux occurrences de 'templateId' :
                - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.9.1.3.10"
                - Un deuxième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.85"
            </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M28"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M28"/>
   <xsl:template match="@*|node()" priority="-2" mode="M28">
      <xsl:apply-templates select="*" mode="M28"/>
   </xsl:template>

   <!--PATTERN E_severity_frCI-SIS Severity-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Severity</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.1&#34;]" priority="1000"
                 mode="M29">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.1&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code[@code=&#34;SEV&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [ER_severity_fr] Erreur de Conformité CI-SIS: L'élément 'code' de l'entrée 'severity' indique la 
            sévérité de l'allergie provoquée.
            L'attribut code de l'élément 'code' est fixé à 'SEV'.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M29"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M29"/>
   <xsl:template match="@*|node()" priority="-2" mode="M29">
      <xsl:apply-templates select="*" mode="M29"/>
   </xsl:template>

   <!--PATTERN E_simpleObservation_frIHE PCC v3.0 Simple Observation-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">IHE PCC v3.0 Simple Observation</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13']"
                 priority="1000"
                 mode="M30">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13']"/>
      <xsl:variable name="count_value" select="count(cda:value)"/>
      <xsl:variable name="count_interpretationCode" select="count(cda:interpretationCode)"/>
      <xsl:variable name="count_methodCode" select="count(cda:methodCode)"/>
      <xsl:variable name="count_targetSiteCode" select="count(cda:targetSiteCode)"/>
      <xsl:variable name="count_author" select="count(cda:author)"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_interpretationCode &lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_simpleObservation_fr.sch] Erreur de conformité CI-SIS : L'élément interpretationCode ne peut être présent qu'une seule fois au maximum (cardinalité [0..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_methodCode &lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_simpleObservation_fr.sch] Erreur de conformité CI-SIS : L'élément methodCode ne peut être présent qu'une seule foix au maximum (cardinalité [0..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_targetSiteCode &lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_simpleObservation_fr.sch] Erreur de conformité CI-SIS : L'élément targetSiteCode ne peut être présent qu'une seule fois au maximum (cardinalité [0..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_author &lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_simpleObservation_fr.sch] Erreur de conformité CI-SIS : L'élément author ne peut être présent qu'une seule fois au maximum (cardinalité [0..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M30"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M30"/>
   <xsl:template match="@*|node()" priority="-2" mode="M30">
      <xsl:apply-templates select="*" mode="M30"/>
   </xsl:template>

   <!--PATTERN E_socialHistoryObservation_frCI-SIS Social History Observation: 1.3.6.1.4.1.19376.1.5.3.1.4.13.4-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Social History Observation: 1.3.6.1.4.1.19376.1.5.3.1.4.13.4</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.4&#34;]"
                 priority="1000"
                 mode="M31">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.4&#34;]"/>
      <xsl:variable name="count_id" select="count(cda:id)"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="@moodCode=&#34;EVN&#34; and @classCode=&#34;OBS&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
          [E_socialHistoryObservation_fr]: Erreur de conformité au CI-SIS : Les attributs de l’élément "observation" sont fixés aux valeurs :
          classCode=’OBS’ et moodCode=’EVN’
       </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:id) or $count_id=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
          [E_socialHistoryObservation_fr]: Erreur de conformité au CI-SIS : L'indentifiant ne peut être présent qu'une seule fois au maximum
       </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
          [E_socialHistoryObservation_fr]: Erreur de conformité au CI-SIS : L'élément code est obligatoirement présent une seule fois
       </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:statusCode)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
          [E_socialHistoryObservation_fr]: Erreur de conformité au CI-SIS : L'élément statusCode est obligatoirement présent une seule fois
       </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:effectiveTime)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
          [E_socialHistoryObservation_fr]: Erreur de conformité au CI-SIS : L'élément effectiveTime est obligatoirement présent une seule fois
       </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
          [E_socialHistoryObservation_fr]: Erreur de conformité au CI-SIS : L'élément value est obligatoirement présent au moins une fois
       </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M31"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M31"/>
   <xsl:template match="@*|node()" priority="-2" mode="M31">
      <xsl:apply-templates select="*" mode="M31"/>
   </xsl:template>

   <!--PATTERN E_supplyEntry_frCI-SIS Supply entry-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Supply entry</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.7.3']"
                 priority="1000"
                 mode="M32">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.7.3']"/>
      <xsl:variable name="count_author" select="count(cda:author)"/>
      <xsl:variable name="count_performer" select="count(cda:performer)"/>
      <xsl:variable name="count_id" select="count(cda:id)"/>
      <xsl:variable name="count_quantity" select="count(cda:quantity)"/>
      <xsl:variable name="count_effectiveTime" select="count(cda:effectiveTime)"/>
      <xsl:variable name="count_entryRelationShip"
                    select="count(cda:entryRelationship[@typeCode='SUBJ']/cda:act)"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_id=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
           [E_supplyEntry_fr.sch] Errreur de conformité CI-SIS: L'élément supply doit contenir un élément id (cardinalité [1..1])
       </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_effectiveTime &lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
           [E_supplyEntry_fr.sch] Errreur de conformité CI-SIS: L'élément supply ne doit contenir qu'un effectiveTime au maximum (cardinalité [0..1])
       </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_quantity&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_supplyEntry_fr.sch] Errreur de conformité CI-SIS: L'élément supply ne doit contenir qu'un élément 'quantity' au maximum (cardinalité [0..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_author&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_supplyEntry_fr.sch] Errreur de conformité CI-SIS: L'élément supply ne doit contenir qu'un élément 'author' au maximum (cardinalité [0..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_performer&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_supplyEntry_fr.sch] Errreur de conformité CI-SIS: L'élément supply ne doit contenir qu'un élément 'performer' au maximum (cardinalité [0..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:entryRelationship) or (cda:entryRelationship and cda:entryRelationship[@typeCode='SUBJ']/cda:act/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.3.1'])"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_supplyEntry_fr.sch] Errreur de conformité CI-SIS: Si l'élément supply contient un entryRelationship, il doit avoir la forme suivante : entryRelationship[@typeCode='SUBJ']/act/templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.3.1'])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M32"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M32"/>
   <xsl:template match="@*|node()" priority="-2" mode="M32">
      <xsl:apply-templates select="*" mode="M32"/>
   </xsl:template>

   <!--PATTERN E_surveyObservation_frIHE PCC v3.0 Survey observation-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">IHE PCC v3.0 Survey observation</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.12.3.6']"
                 priority="1000"
                 mode="M33">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.12.3.6']"/>
      <xsl:variable name="count_id" select="count(cda:id)"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_id=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_surveyObservation_fr] Erreur de conformité CI-SIS : L'élément Survey Observation doit contenir un seul id (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code='completed']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_surveyObservation_fr] Erreur de conformité CI-SIS : L'élément Survey Observation doit avoir un statusCode dont la valeur est fixée à @code='completed'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M33"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M33"/>
   <xsl:template match="@*|node()" priority="-2" mode="M33">
      <xsl:apply-templates select="*" mode="M33"/>
   </xsl:template>

   <!--PATTERN E_traitementPrescrit_frCI-SIS Entrée "FR-Traitement-prescrit"-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Entrée "FR-Traitement-prescrit"</svrl:text>

	  <!--RULE -->
<xsl:template match="//cda:section[cda:templateId[@root='1.2.250.1.213.1.1.2.171']]/cda:entry/cda:substanceAdministration[cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.2']]"
                 priority="1000"
                 mode="M34">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="//cda:section[cda:templateId[@root='1.2.250.1.213.1.1.2.171']]/cda:entry/cda:substanceAdministration[cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.2']]"/>
      <xsl:variable name="count_templateId"
                    select="count(//cda:section[cda:templateId[@root='1.2.250.1.213.1.1.2.171']]/cda:entry/cda:substanceAdministration/cda:templateId)"/>
      <xsl:variable name="count_ER_EnRapportALD"
                    select="count(cda:entryRelationship/cda:observation[cda:templateId[@root='1.2.250.1.213.1.1.3.48.13']])"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.2.250.1.213.1.1.3.83']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
                [1] [E_traitementPrescrit_fr.sch] Erreur de conformité CI-SIS : 
                L'entrée "FR-Traitement-prescrit" doit avoir un templateId dont l'attribut @root="1.2.250.1.213.1.1.3.83" (Conformité de l'entrée aux spécifications CI-SIS)
            </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_templateId&gt;4"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
                [2] [E_traitementPrescrit_fr.sch] Erreur de conformité CI-SIS : Il doit y avoir au minimum 5 occurences de l'élément 'templateId' dans cette entrée :
                - La première pour la déclaration de conformité de l'entrée aux spécifications IHE Pharm PRE @root="1.3.6.1.4.1.19376.1.9.1.3.2"
                - La deuxième pour la déclaration de conformité de l'entrée aux spécifications CCD @root="2.16.840.1.113883.10.20.1.24"
                - La troisème pour la déclaration de conformité de l'entrée aux spécifications IHE PCC @root="1.3.6.1.4.1.19376.1.5.3.1.4.7"
                - La quatrième pour la déclaration de conformité de l'entrée aux spécifications CI-SIS @root="1.2.250.1.213.1.1.3.83"
                - La cinquième pour la déclaration du mode d'administration du traitement prescrit (à choisir parmi la liste des modes d'administration)
            </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="(($count_ER_EnRapportALD=1) or ($count_ER_EnRapportALD=0))"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
                [4] [E_traitementPrescrit_fr.sch] Erreur de conformité CI-SIS : 
                - L'entryRelationship optionnelle "FR-En-rapport-avec-ALD" ne peut être présente qu'une fois (cardinalité [0..1]). 
                - Si présente, elle doit contenir un 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.48.13" (Conformité de l'entrée au format CI-SIS) 
            </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M34"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M34"/>
   <xsl:template match="@*|node()" priority="-2" mode="M34">
      <xsl:apply-templates select="*" mode="M34"/>
   </xsl:template>

   <!--PATTERN E_traitementPrescritSubordonnee_frCI-SIS Entrée "FR-Traitement-prescrit-subordonnee"-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Entrée "FR-Traitement-prescrit-subordonnee"</svrl:text>

	  <!--RULE -->
<xsl:template match="//cda:entry/cda:substanceAdministration/cda:entryRelationship[@typeCode='COMP']/cda:substanceAdministration[@classCode='SBADM'][@moodCode='INT'][cda:templateId[@root='1.2.250.1.213.1.1.3.83.1']]"
                 priority="1000"
                 mode="M35">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="//cda:entry/cda:substanceAdministration/cda:entryRelationship[@typeCode='COMP']/cda:substanceAdministration[@classCode='SBADM'][@moodCode='INT'][cda:templateId[@root='1.2.250.1.213.1.1.3.83.1']]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:id"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
                [1] [E_traitementPrescritSubordonnee_fr.sch] Erreur de conformité CI-SIS : 
                L'entrée "FR-Traitement-prescrit-subordonnee" doit posséder un élément 'id' (Conformité aux spécifications CI-SIS)
            </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:text"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
                [1] [E_traitementPrescritSubordonnee_fr.sch] Erreur de conformité CI-SIS : 
                L'entrée "FR-Traitement-prescrit-subordonnee" doit posséder un élément 'text' (Conformité aux spécifications CI-SIS)
            </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
                [1] [E_traitementPrescritSubordonnee_fr.sch] Erreur de conformité CI-SIS : 
                L'entrée "FR-Traitement-prescrit-subordonnee" doit posséder un élément 'statusCode' (Conformité aux spécifications CI-SIS)
            </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:consumable"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
                [1] [E_traitementPrescritSubordonnee_fr.sch] Erreur de conformité CI-SIS : 
                L'entrée "FR-Traitement-prescrit-subordonnee" doit posséder un élément 'consumable' (Conformité aux spécifications CI-SIS)
            </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M35"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M35"/>
   <xsl:template match="@*|node()" priority="-2" mode="M35">
      <xsl:apply-templates select="*" mode="M35"/>
   </xsl:template>

   <!--PATTERN E_transport_frIHE PCC v3.0 transport-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">IHE PCC v3.0 transport</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.1.10.4.1&#34;]"
                 priority="1000"
                 mode="M36">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.1.10.4.1&#34;]"/>
      <xsl:variable name="count_Id" select="count(cda:id)"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_Id = 1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
          [E_transport_fr.sch] Erreur de conformité CI-SIS : L'élément transport ne doit avoir qu'un seul id (cardinalité [1..1])
      </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:effectiveTime/cda:low[@value] and cda:effectiveTime/cda:high[@value]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
          [E_transport_fr.sch] Erreur de conformité CI-SIS : L'élément transport doit avoir un élément effectiveTime/low avec un attribut @value et un élément effectiveTime/high avec un attribut @value
      </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M36"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M36"/>
   <xsl:template match="@*|node()" priority="-2" mode="M36">
      <xsl:apply-templates select="*" mode="M36"/>
   </xsl:template>

   <!--PATTERN E_vitalSignsObservation_frModèles de contenu CDA  Vital Signs Observation-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Modèles de contenu CDA  Vital Signs Observation</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.2&#34;]"
                 priority="1000"
                 mode="M37">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.2&#34;]"/>
      <xsl:variable name="count_id" select="count(cda:id)"/>
      <xsl:variable name="count_interpretationCode" select="count(cda:interpretationCode)"/>
      <xsl:variable name="count_methodCode" select="count(cda:methodCode)"/>
      <xsl:variable name="count_targetSiteCode" select="count(cda:targetSiteCode)"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_id&lt;2"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_vitalSignsObservation_fr.sch] Erreur de conformité CI-SIS : L'élément 'id' ne peut être présent qu'une seule fois (cardinalité [0..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:text/cda:reference"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_vitalSignsObservation_fr.sch] Erreur de conformité CI-SIS : L'élément 'text' doit être présent et contenir un élément 'reference'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code='completed']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_vitalSignsObservation_fr.sch] Erreur de conformité CI-SIS : L'élément 'statusCode' est obligatoir et l'attribut @code est fixé à 'Completed'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_interpretationCode &lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_vitalSignsObservation_fr.sch] Erreur de conformité CI-SIS : L'élément interpretationCode ne peut être présent qu'une seule fois au maximum (cardinalité [0..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_methodCode &lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_vitalSignsObservation_fr.sch] Erreur de conformité CI-SIS : L'élément methodCode ne peut être présent qu'une seule fois au maximum (cardinalité [0..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_targetSiteCode &lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_vitalSignsObservation_fr.sch] Erreur de conformité CI-SIS : L'élément targetSiteCode ne peut être présent qu'une seule fois au maximum (cardinalité [0..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M37"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M37"/>
   <xsl:template match="@*|node()" priority="-2" mode="M37">
      <xsl:apply-templates select="*" mode="M37"/>
   </xsl:template>

   <!--PATTERN E_vitalSignsOrganizer_frModèle de Contenu CDA vital signs Organizer-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Modèle de Contenu CDA vital signs Organizer</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.1']"
                 priority="1000"
                 mode="M38">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.1']"/>
      <xsl:variable name="count_id" select="count(cda:id)"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_id=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_vitalSignsOrganizer_fr] : Erreur de conformité CI-SIS : L'élément id ne peut être présent qu'une seule (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code[(@code='F-03400' and @codeSystem='1.2.250.1.213.2.12') or (@code='85353-1' and @codeSystem='2.16.840.1.113883.6.1')]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
           [E_vitalSignsOrganizer_fr] : Erreur de conformité CI-SIS : L'élément code doit avoir les attributs suivants : 
           •	code='F-03400' et codeSystem=1.2.250.1.213.2.12 (SNOMED 3.5) ou
           •	code='85353-1' et codeSystem=2.16.840.1.113883.6.1 (LOINC)
           
       </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M38"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M38"/>
   <xsl:template match="@*|node()" priority="-2" mode="M38">
      <xsl:apply-templates select="*" mode="M38"/>
   </xsl:template>

   <!--PATTERN E_disposition_frCI-SIS Entrée FR-Disposition-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Entrée FR-Disposition</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.2.250.1.213.1.1.3.97']" priority="1000"
                 mode="M39">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.97']"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_disposition_fr] Erreur de Conformité CI-SIS : 
            Une entrée 'FR_Disposition' ne peut avoir qu'un seul identifiant (id).
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:statusCode)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_disposition_fr] Erreur de Conformité CI-SIS :
            Une entrée 'FR_Disposition' doit comporter un (et un seul) élément statusCode.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:text/cda:reference[@value])=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_disposition_fr] Erreur de Conformité CI-SIS :
            Une entrée 'FR_Disposition' doit comporter un (et un seul) élément 'text' avec une 'reference'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_disposition_fr] Erreur de Conformité CI-SIS :
            Une entrée 'FR_Disposition' doit comporter un (et un seul) élément 'code'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code/@code='11302-7'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_disposition_fr] Erreur de Conformité CI-SIS :
            Une entrée 'FR_Disposition' doit comporter le code 11302-7.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M39"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M39"/>
   <xsl:template match="@*|node()" priority="-2" mode="M39">
      <xsl:apply-templates select="*" mode="M39"/>
   </xsl:template>

   <!--PATTERN E_statutDuDocument_frCI-SIS Statut du document-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Statut du document</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.48.16&#34;]" priority="1000"
                 mode="M40">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.48.16&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_statutDuDocument_fr] : Erreur de conformité CI-SIS : Un élément "Allergies and Intolerance" comporte obligatoirement un identifiant "id".
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.2.250.1.213.1.1.3.48.16'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_statutDuDocument_fr] : Erreur de conformité CI-SIS : L'élément de templatId '1.2.250.1.213.1.1.3.48.16' doit être présent
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.2.250.1.213.1.1.3.48'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_statutDuDocument_fr] : Erreur de conformité CI-SIS : L'élément de templatId '1.2.250.1.213.1.1.3.48' doit être présent
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_statutDuDocument_fr] : Erreur de conformité CI-SIS : L'élément de templatId '1.3.6.1.4.1.19376.1.5.3.1.4.13' doit être présent
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code/@code=&#34;GEN-065&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_statutDuDocument_fr] Erreur de Conformité CI-SIS:
            L'élément 'code' doit être obligatoirement 'GEN-065'.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:effectiveTime"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_statutDuDocument_fr] Erreur de conformité CI-SIS : L'élément "effectiveTime" doit être présent.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code = &#34;completed&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_statutDuDocument_fr] Erreur de conformité CI-SIS: L'élément "statusCode" sera présent et prendra la valeur "completed"</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_statutDuDocument_fr] Erreur de conformité CI-SIS: L'élément "value" doit être présent.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M40"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M40"/>
   <xsl:template match="@*|node()" priority="-2" mode="M40">
      <xsl:apply-templates select="*" mode="M40"/>
   </xsl:template>

   <!--PATTERN E_evenementIndesirablePendantHospitalisation_frCI-SIS evenement indesirable pendant hospitalisation -->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS evenement indesirable pendant hospitalisation </svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.48.3&#34;]" priority="1000"
                 mode="M41">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.48.3&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_evenementIndesirablePendantHospitalisation_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Evenement-indesirable-pendant-hospitalisation (1.2.250.1.213.1.1.3.48.3), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_evenementIndesirablePendantHospitalisation_fr] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code=&#34;MED-143&#34; and cda:code/@codeSystem=&#34;1.2.250.1.213.1.1.4.322&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_evenementIndesirablePendantHospitalisation_fr] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois et doit avoir l'attribut @code='MED-143' et
            le codeSystem='1.2.250.1.213.1.1.4.322'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code='completed']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_evenementIndesirablePendantHospitalisation_fr] : Erreur de conformité CI-SIS : Le composant "statutCode"
            est toujours fixé à la valeur code='completed'. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:effectiveTime)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_evenementIndesirablePendantHospitalisation_fr] : Erreur de conformité CI-SIS : L'élément effectiveTime doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:value)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_evenementIndesirablePendantHospitalisation_fr] : Erreur de conformité CI-SIS : L'élément value doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M41"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M41"/>
   <xsl:template match="@*|node()" priority="-2" mode="M41">
      <xsl:apply-templates select="*" mode="M41"/>
   </xsl:template>

   <!--PATTERN E_evenementIndesirableSuiteAdministrationDerivesSang_frCI-SIS evenement indesirable suite administration derives sang -->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS evenement indesirable suite administration derives sang </svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.48.4&#34;]" priority="1000"
                 mode="M42">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.48.4&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_evenementIndesirableSuiteAdministrationDerivesSang_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Evenement-indesirable-suite-administration-derives-sang (1.2.250.1.213.1.1.3.48.4), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_evenementIndesirableSuiteAdministrationDerivesSang_fr] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code=&#34;MED-148&#34; and cda:code/@codeSystem=&#34;1.2.250.1.213.1.1.4.322&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_evenementIndesirableSuiteAdministrationDerivesSang_fr] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois et doit avoir l'attribut @code='MED-148' et
            le codeSystem='1.2.250.1.213.1.1.4.322'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code='completed']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_evenementIndesirableSuiteAdministrationDerivesSang_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" 
            est toujours fixé à la valeur code='completed'. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:effectiveTime)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_evenementIndesirableSuiteAdministrationDerivesSang_fr] : Erreur de conformité CI-SIS : L'élément effectiveTime doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:value)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_evenementIndesirableSuiteAdministrationDerivesSang_fr] : Erreur de conformité CI-SIS : L'élément value doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M42"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M42"/>
   <xsl:template match="@*|node()" priority="-2" mode="M42">
      <xsl:apply-templates select="*" mode="M42"/>
   </xsl:template>

   <!--PATTERN E_identificationMicroOrganismesMultiresistants_frCI-SIS identification microOrganismes multiresistants-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS identification microOrganismes multiresistants</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.48.5&#34;]" priority="1000"
                 mode="M43">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.48.5&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_identificationMicroOrganismesMultiresistants_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Identification-micro-organismes-multiresistants (1.2.250.1.213.1.1.3.48.5), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_identificationMicroOrganismesMultiresistants_fr] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code=&#34;MED-144&#34; and cda:code/@codeSystem=&#34;1.2.250.1.213.1.1.4.322&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_identificationMicroOrganismesMultiresistants_fr] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois et doit avoir l'attribut @code='MED-144' et
            le codeSystem='1.2.250.1.213.1.1.4.322'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code='completed']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_identificationMicroOrganismesMultiresistants_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" 
            est toujours fixé à la valeur code='completed'. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:effectiveTime)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_identificationMicroOrganismesMultiresistants_fr] : Erreur de conformité CI-SIS : L'élément effectiveTime doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:value)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_identificationMicroOrganismesMultiresistants_fr] : Erreur de conformité CI-SIS : L'élément value doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:author)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_identificationMicroOrganismesMultiresistants_fr] : Erreur de conformité CI-SIS : L'élément author doit être présent maximum une fois [0..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M43"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M43"/>
   <xsl:template match="@*|node()" priority="-2" mode="M43">
      <xsl:apply-templates select="*" mode="M43"/>
   </xsl:template>

   <!--PATTERN E_accidentsTransfusionnels_frCI-SIS accidents transfusionnels -->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS accidents transfusionnels </svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.48.1&#34;]" priority="1000"
                 mode="M44">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.48.1&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_accidentsTransfusionnels_fr] Erreur de conformité CI-SIS : Dans l'entrée	FR-Accidents-transfusionnels (1.2.250.1.213.1.1.3.48.1), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_accidentsTransfusionnels_fr] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code=&#34;MED-146&#34; and cda:code/@codeSystem=&#34;1.2.250.1.213.1.1.4.322&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_accidentsTransfusionnels_fr] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois et doit avoir l'attribut @code='MED-146' et
            le codeSystem='1.2.250.1.213.1.1.4.322'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code='completed']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_accidentsTransfusionnels_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" 
            est toujours fixé à la valeur code='completed'. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:effectiveTime)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_accidentsTransfusionnels_fr] : Erreur de conformité CI-SIS : L'élément effectiveTime doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:value)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_accidentsTransfusionnels_fr] : Erreur de conformité CI-SIS : L'élément value doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:author)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_accidentsTransfusionnels_fr] : Erreur de conformité CI-SIS : L'élément author doit être présent maximum une fois [0..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M44"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M44"/>
   <xsl:template match="@*|node()" priority="-2" mode="M44">
      <xsl:apply-templates select="*" mode="M44"/>
   </xsl:template>

   <!--PATTERN E_payers_frCI-SIS Entrée FR-Couverture-sociale-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Entrée FR-Couverture-sociale</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.17']"
                 priority="1000"
                 mode="M45">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.17']"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_payers_fr] Erreur de Conformité CI-SIS : 
            Une entrée 'FR-Couverture-sociale' ne peut avoir qu'un seul identifiant (id).
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:statusCode)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_payers_fr] Erreur de Conformité CI-SIS :
            Une entrée 'FR-Couverture-sociale' doit comporter un (et un seul) élément statusCode.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_payers_fr] Erreur de Conformité CI-SIS :
            Une entrée 'FR-Couverture-sociale' doit comporter un (et un seul) élément 'code'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code/@code='48768-6'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_payers_fr] Erreur de Conformité CI-SIS :
            Une entrée 'FR-Couverture-sociale' doit comporter le code 48768-6.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:entryRelationship/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.18'])&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_payers_fr] Erreur de Conformité CI-SIS :
            Une entrée 'FR-Couverture-sociale' doit comporter minimum une entryRelationship FR-Organisme-assurance-maladie [1..*].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M45"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M45"/>
   <xsl:template match="@*|node()" priority="-2" mode="M45">
      <xsl:apply-templates select="*" mode="M45"/>
   </xsl:template>

   <!--PATTERN E_comments_frIHE PCC Comments-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">IHE PCC Comments</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.2&#34;]" priority="1001"
                 mode="M46">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.2&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root=&#34;1.2.250.1.213.1.1.3.32&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_comments_fr] Erreur de Conformité PCC: Le templateId (1.2.250.1.213.1.1.3.32) de l'entrée
            Comments doit être déclaré.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M46"/>
   </xsl:template>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.32&#34;]" priority="1000"
                 mode="M46">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.32&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.2&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_comments_fr] Erreur de Conformité PCC: Le templateId (1.3.6.1.4.1.19376.1.5.3.1.4.2) de l'entrée
            Comments doit être déclaré.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M46"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M46"/>
   <xsl:template match="@*|node()" priority="-2" mode="M46">
      <xsl:apply-templates select="*" mode="M46"/>
   </xsl:template>

   <!--PATTERN E_acte_frVérification de la conformité de l'entrée FR-Acte(1.3.6.1.4.1.19376.1.5.3.1.4.19)-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Acte(1.3.6.1.4.1.19376.1.5.3.1.4.19)</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.19&#34;]"
                 priority="1000"
                 mode="M47">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.19&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.19'] and (cda:templateId[@root='2.16.840.1.113883.10.20.1.29']             or cda:templateId[@root='2.16.840.1.113883.10.20.1.25']) and cda:templateId[@root='1.2.250.1.213.1.1.3.62']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [1] [E_acte_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Acte" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.19"
            - Un deuxième 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.29" si l'acte est réalisé
            - Un troisième 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.25" si l'acte est prévu
            - Un quatrième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.62"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_acte_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Acte" doit comporter un élément 'code'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:text)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_acte_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Acte" doit comporter un élément 'text'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:statusCode)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_acte_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Acte" doit comporter un élément 'statusCode'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:targetSiteCode)&gt;=0"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_acte_fr.sch] Erreur de conformité CI-SIS : Un seul élément targetSiteCode au maximum peut être présent
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:entryRelationship[@typeCode='COMP' and @inversionInd='true']/cda:act[cda:templateId/@root='1.2.250.1.213.1.1.3.36']) or cda:entryRelationship[@typeCode='COMP' and @inversionInd='true']/cda:act[cda:templateId/@root='1.2.250.1.213.1.1.3.36']/cda:code"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_acte_fr.sch] Erreur de conformité CI-SIS : Si l'entrée 'Circonstances ayant décidé de l'acte' est présente, les attributs @typeCode et @inversionInd doivent avoir les valeurs suivantes 'COMP' et 'true'.
            L'élément code de l'entrée est obligatoire [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:entryRelationship[@typeCode='RSON' and @inversionInd='false']/cda:act[cda:templateId/@root='1.2.250.1.213.1.1.3.36']) or cda:entryRelationship[@typeCode='RSON' and @inversionInd='false']/cda:act[cda:templateId/@root='1.2.250.1.213.1.1.3.36']/cda:code"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_acte_fr.sch] Erreur de conformité CI-SIS : Si l'entrée 'Motif de l'acte' est présente, les attributs @typeCode et @inversionInd doivent avoir les valeurs suivantes 'RSON' et 'false'.
            L'élément code de l'entrée est obligatoire [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:entryRelationship[@typeCode='REFR' and @inversionInd='false']/cda:act[cda:templateId/@root='1.2.250.1.213.1.1.3.36']) or cda:entryRelationship[@typeCode='REFR' and @inversionInd='false']/cda:act[cda:templateId/@root='1.2.250.1.213.1.1.3.36']/cda:code"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_acte_fr.sch] Erreur de conformité CI-SIS : Si l'entrée 'Réference interne au DM' est présente, les attributs @typeCode et @inversionInd doivent avoir les valeurs suivantes 'REFR' et 'false'.
            L'élément code de l'entrée est obligatoire [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:entryRelationship[cda:observation/cda:code/@code='GEN-023' and @typeCode='COMP' and @inversionInd='false']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48']) or cda:entryRelationship[@typeCode='COMP' and @inversionInd='false']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48']/cda:code[@code='GEN-023']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_acte_fr.sch] Erreur de conformité CI-SIS : Si l'entrée 'Difficulté' est présente, les attributs @typeCode et @inversionInd doivent avoir les valeurs suivantes 'COMP' et 'false'.
            Le code de l'entrée doit avoir l'attribut @code='GEN-023'.
            L'élément code de l'entrée est obligatoire [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:entryRelationship[cda:observation/cda:code/@code!='GEN-023' and @typeCode='COMP' and @inversionInd='false']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48']) or cda:entryRelationship[@typeCode='COMP' and @inversionInd='false']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48']/cda:code"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_acte_fr.sch] Erreur de conformité CI-SIS : Si l'entrée 'Score' est présente, les attributs @typeCode et @inversionInd doivent avoir les valeurs suivantes 'COMP' et 'false'.
            L'élément code de l'entrée est obligatoire [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M47"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M47"/>
   <xsl:template match="@*|node()" priority="-2" mode="M47">
      <xsl:apply-templates select="*" mode="M47"/>
   </xsl:template>

   <!--PATTERN E_acteSubstitution_frVérification de la conformité de l'entrée FR-Acte-substitution(1.2.250.1.213.1.1.3.206)-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Acte-substitution(1.2.250.1.213.1.1.3.206)</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.206&#34;]" priority="1000"
                 mode="M48">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.206&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.2.250.1.213.1.1.3.206'] and cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.9.2']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [1] [E_acteSubstitution_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Acte-substitution" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.206"
            - Un deuxième 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.9.1.3.9.2"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_acteSubstitution_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Acte-substitution" doit comporter un élément 'code'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M48"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M48"/>
   <xsl:template match="@*|node()" priority="-2" mode="M48">
      <xsl:apply-templates select="*" mode="M48"/>
   </xsl:template>

   <!--PATTERN E_diagnosticDuCancer_frVérification de la conformité de l'entrée FR-Diagnostic-du-cancer(1.2.250.1.213.1.1.3.113)-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Diagnostic-du-cancer(1.2.250.1.213.1.1.3.113)</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.113&#34;]" priority="1000"
                 mode="M49">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.113&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.2.250.1.213.1.1.3.113'] and cda:templateId[@root='1.3.6.1.4.1.19376.1.7.3.1.4.14.1'] and              cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.5'] and cda:templateId[@root='2.16.840.1.113883.10.20.1.28']             and cda:templateId[@root='1.2.250.1.213.1.1.3.37']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [1] [E_diagnosticDuCancer_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Diagnostic-du-cancer" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.113"
            - Un deuxième 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.7.3.1.4.14.1"
            - Un troisième 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.5"
            - Un quatrième 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.28"
            - Un cinquième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.37"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code='282291009'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_diagnosticDuCancer_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Diagnostic-du-cancer" doit comporter un élément 'code' ayant comme attribut @code='282291009'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:text)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_diagnosticDuCancer_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Diagnostic-du-cancer" doit comporter un élément 'text'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:statusCode)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_diagnosticDuCancer_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Diagnostic-du-cancer" doit comporter un élément 'statusCode'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:effectiveTime)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_diagnosticDuCancer_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Diagnostic-du-cancer" doit comporter un élément 'effectiveTime'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:value)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_diagnosticDuCancer_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Diagnostic-du-cancer" doit comporter un élément 'value'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:targetSiteCode)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_diagnosticDuCancer_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Diagnostic-du-cancer" doit comporter un élément 'targetSiteCode'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='false']/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.7.3.1.4.14.2']) or cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='false']/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.7.3.1.4.14.2']/cda:code[@code='75620-5']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_diagnosticDuCancer_fr.sch] Erreur de conformité CI-SIS : Si l'entrée 'Stade clinique TNM' est présente, les attributs @typeCode et @inversionInd doivent avoir les valeurs suivantes 'SUBJ' et 'false'.
            L'élément code de l'entrée Stade clinique TNM est obligatoire [1..1] et doit avoir comme attribut @code='75620-5'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='false']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48']) or cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='false']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48']/cda:code[@code='21918-8']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_diagnosticDuCancer_fr.sch] Erreur de conformité CI-SIS : Si l'entrée 'Autre stade si pertinent' est présente, les attributs @typeCode et @inversionInd doivent avoir les valeurs suivantes 'SUBJ' et 'false'.
            L'élément code de l'entrée 'Autre stade si pertinent' est obligatoire [1..1] et doit avoir comme attribut @code='21918-8'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='true']/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.2']) or cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='true']/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.2']/cda:code[@code='48767-8']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_diagnosticDuCancer_fr.sch] Erreur de conformité CI-SIS : Si l'entrée 'FR-Commentaire-ER' est présente, les attributs @typeCode et @inversionInd doivent avoir les valeurs suivantes 'SUBJ' et 'true'.
            L'élément code de l'entrée 'FR-Commentaire-ER' est obligatoire [1..1] et doit avoir comme attribut @code='48767-8'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M49"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M49"/>
   <xsl:template match="@*|node()" priority="-2" mode="M49">
      <xsl:apply-templates select="*" mode="M49"/>
   </xsl:template>

   <!--PATTERN E_administrationDeDerivesDuSang_frCI-SIS administration du dérivés du sang -->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS administration du dérivés du sang </svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.48.2&#34;]" priority="1000"
                 mode="M50">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.48.2&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_administrationDeDerivesDuSang_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Administration-de-derives-du-sang(1.2.250.1.213.1.1.3.48.2), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_administrationDeDerivesDuSang_fr] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code=&#34;MED-147&#34; and cda:code/@codeSystem=&#34;1.2.250.1.213.1.1.4.322&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_administrationDeDerivesDuSang_fr] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois et doit avoir l'attribut @code='MED-147' et
            le codeSystem='1.2.250.1.213.1.1.4.322'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code='completed']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_administrationDeDerivesDuSang_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" 
            est toujours fixé à la valeur code='completed'. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:effectiveTime)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_administrationDeDerivesDuSang_fr] : Erreur de conformité CI-SIS : L'élément effectiveTime doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:value)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_administrationDeDerivesDuSang_fr] : Erreur de conformité CI-SIS : L'élément value doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:author)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_administrationDeDerivesDuSang_fr] : Erreur de conformité CI-SIS : L'élément author doit être présent maximum une fois [0..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M50"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M50"/>
   <xsl:template match="@*|node()" priority="-2" mode="M50">
      <xsl:apply-templates select="*" mode="M50"/>
   </xsl:template>

   <!--PATTERN E_certitude_frCI-SIS certitude -->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS certitude </svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.171&#34;]" priority="1000"
                 mode="M51">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.171&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_certitude_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Certitude(1.2.250.1.213.1.1.3.171), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_certitude_fr] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code=&#34;66455-7&#34; and cda:code/@codeSystem=&#34;2.16.840.1.113883.6.1&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_certitude_fr] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois et doit avoir l'attribut @code='66455-7' et
            le codeSystem='2.16.840.1.113883.6.1'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code='completed']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_certitude_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" 
            est toujours fixé à la valeur code='completed'. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:effectiveTime)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_certitude_fr] : Erreur de conformité CI-SIS : L'élément effectiveTime doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:value)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_certitude_fr] : Erreur de conformité CI-SIS : L'élément value doit être présent une fois [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:repeatNumber)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_certitude_fr] : Erreur de conformité CI-SIS : L'élément repeatNumber doit être présent maximum une fois [0..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M51"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M51"/>
   <xsl:template match="@*|node()" priority="-2" mode="M51">
      <xsl:apply-templates select="*" mode="M51"/>
   </xsl:template>

   <!--PATTERN E_criticite_frCI-SIS Criticite -->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Criticite </svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.172&#34;]" priority="1000"
                 mode="M52">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.172&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_criticite_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Criticite(1.2.250.1.213.1.1.3.172), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_criticite_fr] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code=&#34;82606-5&#34; and cda:code/@codeSystem=&#34;2.16.840.1.113883.6.1&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_criticite_fr] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois et doit avoir l'attribut @code='82606-5' et
            le codeSystem='2.16.840.1.113883.6.1'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code='completed']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_criticite_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" 
            est toujours fixé à la valeur code='completed'. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:effectiveTime"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_criticite_fr] : Erreur de conformité CI-SIS : L'élément effectiveTime doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_criticite_fr] : Erreur de conformité CI-SIS : L'élément value doit être présent une fois [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:repeatNumber)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_criticite_fr] : Erreur de conformité CI-SIS : L'élément repeatNumber doit être présent maximum une fois [0..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:author)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_criticite_fr] : Erreur de conformité CI-SIS : L'élément author doit être présent maximum une fois [0..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M52"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M52"/>
   <xsl:template match="@*|node()" priority="-2" mode="M52">
      <xsl:apply-templates select="*" mode="M52"/>
   </xsl:template>

   <!--PATTERN E_dateRetraite_frCI-SIS date de retraite -->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS date de retraite </svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.132&#34;]" priority="1000"
                 mode="M53">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.132&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_dateRetraite_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Date-retraite(1.2.250.1.213.1.1.3.132), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.3.6.1.4.1.19376.1.7.3.1.4.24.21'] and cda:templateId[@root='1.2.250.1.213.1.1.3.132']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [1] [E_dateRetraite_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Date-retraite" doit comporter les 'templateId' suivants :
            - Un premier 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.132"
            - Un deuxième 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.7.3.1.4.24.21"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_dateRetraite_fr] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une ou plusieurs fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code=&#34;87510-4&#34; and cda:code/@codeSystem=&#34;2.16.840.1.113883.6.1&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_dateRetraite_fr] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois et doit avoir l'attribut @code='87510-4' et
            le codeSystem='2.16.840.1.113883.6.1'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code='completed']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_dateRetraite_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" 
            est toujours fixé à la valeur code='completed'. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:value)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_dateRetraite_fr] : Erreur de conformité CI-SIS : L'élément value doit être présent une fois [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:participant)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_dateRetraite_fr] : Erreur de conformité CI-SIS : L'élément participant doit être présent une fois [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M53"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M53"/>
   <xsl:template match="@*|node()" priority="-2" mode="M53">
      <xsl:apply-templates select="*" mode="M53"/>
   </xsl:template>

   <!--PATTERN E_directiveAnticipee_frCI-SIS directive anticipée-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS directive anticipée</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.54&#34;]" priority="1000"
                 mode="M54">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.54&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_directiveAnticipee_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Directive-anticipee(1.2.250.1.213.1.1.3.54), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.7'] and cda:templateId[@root='1.2.250.1.213.1.1.3.54']             and cda:templateId[@root='2.16.840.1.113883.10.20.1.17'] and cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [1] [E_directiveAnticipee_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Directive-anticipee" doit comporter les 'templateId' suivants :
            - Un premier 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.54"
            - Un deuxième 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.13.7"
            - Un troisième 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.17"
            - Un quatrième 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.13"
            
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_directiveAnticipee_fr] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une ou plusieurs fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_directiveAnticipee_fr] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:text)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_directiveAnticipee_fr] : Erreur de conformité CI-SIS : L'élément text doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code='completed']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_directiveAnticipee_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" 
            est toujours fixé à la valeur code='completed'. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:effectiveTime)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_directiveAnticipee_fr] : Erreur de conformité CI-SIS : L'élément effectiveTime doit être présent une fois [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:value)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_directiveAnticipee_fr] : Erreur de conformité CI-SIS : L'élément value doit être présent maximum une fois [0..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:reference)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_directiveAnticipee_fr] : Erreur de conformité CI-SIS : L'élément reference doit être présent maximum une fois [0..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M54"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M54"/>
   <xsl:template match="@*|node()" priority="-2" mode="M54">
      <xsl:apply-templates select="*" mode="M54"/>
   </xsl:template>

   <!--PATTERN E_doseAntigene_frCI-SIS dose antigene-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS dose antigene</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.46&#34;]" priority="1000"
                 mode="M55">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.46&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:substanceAdministration[@classCode='SBADM' and @moodCode='EVN' and @negationInd='false']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_doseAntigene_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Dose-antigene(1.2.250.1.213.1.1.3.46), 
            les attributs de l'élément CDA 'substanceAdministration' sont classCode='SBADM' et moodCode='EVN' et negationInd='false'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_doseAntigene_fr] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une ou plusieurs fois [1..*].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.2.250.1.213.1.1.3.46'] and cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.12.1']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [1] [E_doseAntigene_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Dose-antigene" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.46"
            - Un deuxième 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.12.1" 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:doseQuantity"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_doseAntigene_fr] : L'élément doseQuantity doit être présent une fois</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:consumable"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_doseAntigene_fr] : Erreur de conformité CI-SIS : L'élément consumable doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M55"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M55"/>
   <xsl:template match="@*|node()" priority="-2" mode="M55">
      <xsl:apply-templates select="*" mode="M55"/>
   </xsl:template>

   <!--PATTERN E_dureeOccupationPoste_frCI-SIS durée d'occupation de poste -->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS durée d'occupation de poste </svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.72&#34;]" priority="1000"
                 mode="M56">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.72&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_dureeOccupationPoste_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Durée-d'occupation-d'un-poste(1.2.250.1.213.1.1.3.72), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)&gt;1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_dureeOccupationPoste_fr] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une ou plusieurs fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.2.250.1.213.1.1.3.72'] and cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.20.9']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [1] [E_dureeOccupationPoste_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Durée-d'occupation-d'un-poste" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.72"
            - Un deuxième 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.20.9"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code=&#34;74163-7&#34; and cda:code/@codeSystem=&#34;2.16.840.1.113883.6.1&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_dureeOccupationPoste_fr] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois et doit avoir l'attribut @code='74163-7' et
            le codeSystem='2.16.840.1.113883.6.1'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code='completed']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_dureeOccupationPoste_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" 
            est toujours fixé à la valeur code='completed'. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:value)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_dureeOccupationPoste_fr] : Erreur de conformité CI-SIS : L'élément value doit être présent une fois [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M56"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M56"/>
   <xsl:template match="@*|node()" priority="-2" mode="M56">
      <xsl:apply-templates select="*" mode="M56"/>
   </xsl:template>

   <!--PATTERN E_participantBodyProcedureStepsAPSR2_frPalm_Suppl_APSR V2.0 participantBodyProcedureStepsAPSR2 Entry-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Palm_Suppl_APSR V2.0 participantBodyProcedureStepsAPSR2 Entry</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.106&#34;]" priority="1000"
                 mode="M57">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.106&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:time)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_participantBodyProcedureStepsAPSR2_int.sch] Erreur de conformité APSR : L'entrée "participantBodyProcedureStepsAPSR2" peut contenir un élément "time"(cardinalité [0..1]).
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:participantRole)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_participantBodyProcedureStepsAPSR2_int.sch] Erreur de conformité APSR : L'élément "participantRole" doit être présent une seule fois (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:participantRole/cda:playingEntity)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_participantBodyProcedureStepsAPSR2_int.sch] Erreur de conformité APSR : L'élément "playingEntity" doit être présent une seule fois (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M57"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M57"/>
   <xsl:template match="@*|node()" priority="-2" mode="M57">
      <xsl:apply-templates select="*" mode="M57"/>
   </xsl:template>

   <!--PATTERN E_fluideIntraveineux_frVérification de la conformité de l'entrée FR-Fluide-intraveineux (1.2.250.1.213.1.1.3.26) créée par l'ANS-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Fluide-intraveineux (1.2.250.1.213.1.1.3.26) créée par l'ANS</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.26&#34;]" priority="1000"
                 mode="M58">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.26&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:substanceAdministration[@classCode='SBADM' and (@moodCode='EVN' or @moodCode='INT')]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_fluideIntraveineux_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fluide-intraveineux, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'SBADM', 'EVN' ou 'INT' </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_fluideIntraveineux_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fluide-intraveineux, il doit y avoir un élément id (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.13.3.2' and cda:templateId/@root='2.16.840.1.113883.10.20.1.24' and cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.7'             and cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.7.1'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_fluideIntraveineux_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fluide-intraveineux, il doit y avoir les templateIds suivants :
            - 1.3.6.1.4.1.19376.1.5.3.1.1.13.3.2
            - 2.16.840.1.113883.10.20.1.24
            - 1.3.6.1.4.1.19376.1.5.3.1.4.7
            - 1.3.6.1.4.1.19376.1.5.3.1.4.7.1
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_fluideIntraveineux_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Fluide-intraveineux" doit comporter un élément 'code'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed' or cda:statusCode/@code='active'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_fluideIntraveineux_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fluide-intraveineux, le statusCode doit présent et fixé à la valeur @code='completed' ou  @code='active'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:effectiveTime[not(@operator='A')]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_fluideIntraveineux_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fluide-intraveineux, un élément effectiveTime doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:effectiveTime[@operator='A'])&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_fluideIntraveineux_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fluide-intraveineux, un élément effectiveTime avec @operator='A' peut être présen.t une seule fois [0..1]
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:consumable)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_fluideIntraveineux_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fluide-intraveineux, il doit y avoir un élément consumable (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M58"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M58"/>
   <xsl:template match="@*|node()" priority="-2" mode="M58">
      <xsl:apply-templates select="*" mode="M58"/>
   </xsl:template>

   <!--PATTERN E_surveyPanel_frIHE PCC v3.0 Survey Panel-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">IHE PCC v3.0 Survey Panel</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.2.250.1.213.1.1.3.95']" priority="1000"
                 mode="M59">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.95']"/>
      <xsl:variable name="count_templateId" select="count(cda:templateId)"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="@classCode='CLUSTER'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_surveyPanel_fr] Erreur de Conformité PCC : Dans une entrée "FR-Groupe-de-questionnaires-d-evaluation, l'attribut "classCode" sera fixé à la valeur "CLUSTER". 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="@moodCode = 'EVN'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_surveyPanel_fr] Erreur de Conformité PCC : Dans une entrée "FR-Groupe-de-questionnaires-d-evaluation", l'élément "moodCode" 
            sera fixé à la valeur "EVN".
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_templateId&gt;2"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_surveyPanel_fr] Erreur de Conformité PCC : Dans une entrée "FR-Groupe-de-questionnaires-d-evaluation", il doit y avoir au minimum deux éléments templateId
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.1.12.3.7']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_surveyPanel_fr] Erreur de Conformité PCC : L'entrée "FR-Groupe-de-questionnaires-d-evaluation" doit avoir un templateId fixé à la valeur @root='1.3.6.1.4.1.19376.1.5.3.1.1.12.3.7'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='2.16.840.1.113883.10.20.1.32']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_surveyPanel_fr] Erreur de Conformité PCC : L'entrée "FR-Groupe-de-questionnaires-d-evaluation" doit avoir une templateId fixé à la valeur @root='2.16.840.1.113883.10.20.1.32' pour respecter la conformité CCD
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_surveyPanel_fr] Erreur de Conformité PCC :
            Dans une entrée "FR-Groupe-de-questionnaires-d-evaluation", un 'élément "id" est obligatoire (cardinalité [1..*]).
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_surveyPanel_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Groupe-de-questionnaires-d-evaluation, le statusCode doit présent et fixé à la valeur @code='completed'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_surveyPanel_fr] Erreur de Conformité PCC :
            Dans une entrée "FR-Groupe-de-questionnaires-d-evaluation", un 'élément "code" est obligatoire (cardinalité [1..1]).
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:effectiveTime"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_surveyPanel_fr] Erreur de Conformité PCC :
            Dans une entrée "FR-Groupe-de-questionnaires-d-evaluation", un 'élément "effectiveTime" est obligatoire (cardinalité [1..1]).
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.12.3.6'])&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_surveyPanel_fr] Erreur de Conformité PCC :
            Dans une entrée "FR-Groupe-de-questionnaires-d-evaluation", l'entrée "IHE Survey Observation" est obligatoire (cardinalité [1..*]).
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M59"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M59"/>
   <xsl:template match="@*|node()" priority="-2" mode="M59">
      <xsl:apply-templates select="*" mode="M59"/>
   </xsl:template>

   <!--PATTERN E_historiqueDesProfessions_frCI-SIS Entrée "FR-Historique-des-professions"-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Entrée "FR-Historique-des-professions"</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.7.3.1.4.24.19']"
                 priority="1000"
                 mode="M60">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.7.3.1.4.24.19']"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.2.250.1.213.1.1.3.124']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_historiqueDesProfessions_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Historique-des-professions" doit avoir un 'templateId' avec l'attribut @root="1.2.250.1.213.1.1.3.124"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_historiqueDesProfessions_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-des-professions", l'élément id doit etre présent une ou plusiers fois [1..*].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_historiqueDesProfessions_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-des-professions", l'élément code est obligatoire [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_historiqueDesProfessions_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-des-professions", l'élément statusCode est obligatoire [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:effectiveTime"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_historiqueDesProfessions_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-des-professions", l'élément code est obligatoire [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_historiqueDesProfessions_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-des-professions", l'élément code est obligatoire [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M60"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M60"/>
   <xsl:template match="@*|node()" priority="-2" mode="M60">
      <xsl:apply-templates select="*" mode="M60"/>
   </xsl:template>

   <!--PATTERN E_historiqueStatutsProfessionnels_frCI-SIS Entrée "FR-Historique-statuts-professionnels"-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Entrée "FR-Historique-statuts-professionnels"</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.7.3.1.4.24.18']"
                 priority="1000"
                 mode="M61">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.7.3.1.4.24.18']"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.2.250.1.213.1.1.3.123']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_historiqueStatutsProfessionnels_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Historique-statuts-professionnels" doit avoir un 'templateId' avec l'attribut @root="1.2.250.1.213.1.1.3.124"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_historiqueStatutsProfessionnels_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-statuts-professionnels", l'élément id doit etre présent une ou plusiers fois [1..*].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_historiqueStatutsProfessionnels_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-statuts-professionnels", l'élément code est obligatoire [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_historiqueStatutsProfessionnels_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-statuts-professionnels", l'élément statusCode est obligatoire [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:effectiveTime"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_historiqueStatutsProfessionnels_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-statuts-professionnels", l'élément code est obligatoire [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_historiqueStatutsProfessionnels_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-statuts-professionnels", l'élément code est obligatoire [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M61"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M61"/>
   <xsl:template match="@*|node()" priority="-2" mode="M61">
      <xsl:apply-templates select="*" mode="M61"/>
   </xsl:template>

   <!--PATTERN E_horairesDeTravail_frCI-SIS horaire de travail -->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS horaire de travail </svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.70&#34;]" priority="1000"
                 mode="M62">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.70&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_horairesDeTravail_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Horaires-de-travail(1.2.250.1.213.1.1.3.70), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_horairesDeTravail_fr] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une ou plusieurs fois [1..*].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.2.250.1.213.1.1.3.70'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_horairesDeTravail_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Horaires-de-travail, Il doit y avoir le templateId/@root='1.2.250.1.213.1.1.3.70'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.20.7'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_horairesDeTravail_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Horaires-de-travail, Il doit y avoir le templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.20.7'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code=&#34;74159-5&#34; and cda:code/@codeSystem=&#34;2.16.840.1.113883.6.1&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_horairesDeTravail_fr] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois et doit avoir l'attribut @code='74159-5' et
            le codeSystem='2.16.840.1.113883.6.1'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code='completed']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_horairesDeTravail_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" 
            est toujours fixé à la valeur code='completed'. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:value)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_horairesDeTravail_fr] : Erreur de conformité CI-SIS : L'élément value doit être présent une fois [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M62"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M62"/>
   <xsl:template match="@*|node()" priority="-2" mode="M62">
      <xsl:apply-templates select="*" mode="M62"/>
   </xsl:template>

   <!--PATTERN E_scoreDepressionGeriatiqueComposant_frVérification de la conformité de l'entrée FR-Score-depression-geriatrique-composant (1.2.250.1.213.1.1.3.112) créée par l'ANS-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Score-depression-geriatrique-composant (1.2.250.1.213.1.1.3.112) créée par l'ANS</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.112&#34;]" priority="1000"
                 mode="M63">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.112&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreDepressionGeriatiqueComposant_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-depression-geriatrique-composant, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreDepressionGeriatiqueComposant_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-depression-geriatrique-composant, il doit y avoir un élément id (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreDepressionGeriatiqueComposant_fr.sch] Erreur de conformité IHE : Dans l'entrée FR-Score-depression-geriatrique-composant, il doit y avoir le templateId  (’1.3.6.1.4.1.19376.1.5.3.1.4.13’)
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='2.16.840.1.113883.10.20.1.31'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreDepressionGeriatiqueComposant_fr.sch] Erreur de conformité CCD : Dans l'entrée FR-Score-depression-geriatrique-composant, il doit y avoir le templateId  (’2.16.840.1.113883.10.20.1.31’)
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.12.3.5'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreDepressionGeriatiqueComposant_fr.sch] Erreur de conformité IHE : Dans l'entrée FR-Score-depression-geriatrique-composant, il doit y avoir le templateId  (’1.3.6.1.4.1.19376.1.5.3.1.1.12.3.5’)
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreDepressionGeriatiqueComposant_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Score-depression-geriatrique-composant" doit comporter un élément 'code' (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreDepressionGeriatiqueComposant_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-depression-geriatrique-composant, le statusCode doit présent et fixé à la valeur @code='completed'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:text"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreDepressionGeriatiqueComposant_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-depression-geriatrique-composant, un élément text doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreDepressionGeriatiqueComposant_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-depression-geriatrique-composant, un élément value doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M63"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M63"/>
   <xsl:template match="@*|node()" priority="-2" mode="M63">
      <xsl:apply-templates select="*" mode="M63"/>
   </xsl:template>

   <!--PATTERN E_scoreDepressionGeriatique_frVérification de la conformité de l'entrée FR-Score-Depression-Geriatrique (1.2.250.1.213.1.1.3.110) créée par l'ANS-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Score-Depression-Geriatrique (1.2.250.1.213.1.1.3.110) créée par l'ANS</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.110&#34;]" priority="1000"
                 mode="M64">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.110&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreDepressionGeriatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Depression-Geriatrique, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreDepressionGeriatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Depression-Geriatrique, il doit y avoir un élément id (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreDepressionGeriatique_fr.sch] Erreur de conformité IHE : Dans l'entrée FR-Score-Depression-Geriatrique, il doit y avoir le templateId  (’1.3.6.1.4.1.19376.1.5.3.1.4.13’)
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='2.16.840.1.113883.10.20.1.31'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreDepressionGeriatique_fr.sch] Erreur de conformité CCD : Dans l'entrée FR-Score-Depression-Geriatrique, il doit y avoir le templateId  (’2.16.840.1.113883.10.20.1.31’)
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.12.3.4'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreDepressionGeriatique_fr.sch] Erreur de conformité IHE : Dans l'entrée FR-Score-Depression-Geriatrique, il doit y avoir le templateId  (’1.3.6.1.4.1.19376.1.5.3.1.1.12.3.4’)
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code='48544-1'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreDepressionGeriatique_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Score-Depression-Geriatrique" doit comporter un élément 'code' avec les attributs :
            - @code="48544-1" (cardinalité [1..1])
            - @codeSystem="2.16.840.1.113883.6.1" (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreDepressionGeriatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Depression-Geriatrique, le statusCode doit présent et fixé à la valeur @code='completed'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:text"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreDepressionGeriatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Depression-Geriatrique, un élément text doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreDepressionGeriatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Depression-Geriatrique, un élément value doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M64"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M64"/>
   <xsl:template match="@*|node()" priority="-2" mode="M64">
      <xsl:apply-templates select="*" mode="M64"/>
   </xsl:template>

   <!--PATTERN E_scoreBradenComposant_frVérification de la conformité de l'entrée FR-Score-Braden-Composant (1.2.250.1.213.1.1.3.111) -->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Score-Braden-Composant (1.2.250.1.213.1.1.3.111) </svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.111&#34;]" priority="1000"
                 mode="M65">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.111&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreBradenComposant_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Braden-Composant, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreBradenComposant_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Braden-Composant, il doit y avoir un élément id (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreBradenComposant_fr.sch] Erreur de conformité IHE : Dans l'entrée FR-Score-Braden-Composant, il doit y avoir le templateId  (’1.3.6.1.4.1.19376.1.5.3.1.4.13’)
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='2.16.840.1.113883.10.20.1.31'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreBradenComposant_fr.sch] Erreur de conformité CCD : Dans l'entrée FR-Score-Braden-Composant, il doit y avoir le templateId  (’2.16.840.1.113883.10.20.1.31’)
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.12.3.3'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreBradenComposant_fr.sch] Erreur de conformité IHE : Dans l'entrée FR-Score-Braden-Composant, il doit y avoir le templateId  (’1.3.6.1.4.1.19376.1.5.3.1.1.12.3.3’)
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreBradenComposant_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Score-Braden-Composant" doit comporter un élément 'code' (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreBradenComposant_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Braden-Composant, le statusCode doit présent et fixé à la valeur @code='completed'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:text"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreBradenComposant_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Braden-Composant, un élément text doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreBradenComposant_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Braden-Composant, un élément value doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M65"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M65"/>
   <xsl:template match="@*|node()" priority="-2" mode="M65">
      <xsl:apply-templates select="*" mode="M65"/>
   </xsl:template>

   <!--PATTERN E_scoreBraden_frVérification de la conformité de l'entrée FR-Score-Braden (1.2.250.1.213.1.1.3.99) -->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Score-Braden (1.2.250.1.213.1.1.3.99) </svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.99&#34;]" priority="1000"
                 mode="M66">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.99&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreBraden_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Braden, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreBraden_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Braden, il doit y avoir un élément id (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreBraden_fr.sch] Erreur de conformité IHE : Dans l'entrée FR-Score-Braden, il doit y avoir le templateId  (’1.3.6.1.4.1.19376.1.5.3.1.4.13’)
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='2.16.840.1.113883.10.20.1.31'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreBraden_fr.sch] Erreur de conformité CCD : Dans l'entrée FR-Score-Braden, il doit y avoir le templateId  (’2.16.840.1.113883.10.20.1.31’)
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.12.3.2'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreBraden_fr.sch] Erreur de conformité IHE : Dans l'entrée FR-Score-Braden, il doit y avoir le templateId  (’1.3.6.1.4.1.19376.1.5.3.1.1.12.3.2’)
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="(count(cda:code[@code='38227‑5'][@codeSystem='2.16.840.1.113883.6.1'])=1 and cda:code/@code='38227‑5' and cda:code/@codeSystem='2.16.840.1.113883.6.1')"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreBraden_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Score-Braden" doit comporter un élément 'code' avec les attributs :
            - @code="38227‑5" (cardinalité [1..1])
            - @codeSystem="2.16.840.1.113883.6.1" (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreBraden_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Braden, le statusCode doit présent et fixé à la valeur @code='completed'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:text"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreBraden_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Braden, un élément text doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_scoreBraden_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Braden, un élément value doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M66"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M66"/>
   <xsl:template match="@*|node()" priority="-2" mode="M66">
      <xsl:apply-templates select="*" mode="M66"/>
   </xsl:template>

   <!--PATTERN E_traitementDispense_frCI-SIS FR-Traitement-dispense-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS FR-Traitement-dispense</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.2.250.1.213.1.1.3.204']" priority="1000"
                 mode="M67">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.204']"/>
      <xsl:variable name="count_product" select="count(cda:product)"/>
      <xsl:variable name="count_id" select="count(cda:id)"/>
      <xsl:variable name="count_text" select="count(cda:text)"/>
      <xsl:variable name="count_quantity" select="count(cda:quantity)"/>
      <xsl:variable name="count_referenceItemPresc"
                    select="count(cda:entryRelationship[@typeCode='REFR']/cda:substanceAdministration[cda:templateId/@root='1.2.250.1.213.1.1.3.90'])&lt;=1"/>
      <xsl:variable name="count_insctructionDosage"
                    select="count(cda:entryRelationship[@typeCode='COMP']/cda:substanceAdministration[cda:templateId/@root='1.2.250.1.213.1.1.3.205'])&lt;=1"/>
      <xsl:variable name="count_insctructionPatient"
                    select="count(cda:entryRelationship[@typeCode='SUBJ']/cda:substanceAdministration[cda:templateId/@root='1.2.250.1.213.1.1.3.33'])&lt;=1"/>
      <xsl:variable name="count_notesDispensateur"
                    select="count(cda:entryRelationship[@typeCode='SUBJ']/cda:substanceAdministration[cda:templateId/@root='1.2.250.1.213.1.1.3.207'])&lt;=1"/>
      <xsl:variable name="count_acteSubstitution"
                    select="count(cda:entryRelationship[@typeCode='COMP']/cda:substanceAdministration[cda:templateId/@root='1.2.250.1.213.1.1.3.206'])&lt;=1"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_id=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_traitementDispense_fr.sch] Errreur de conformité CI-SIS: L'élément supply doit contenir un élément id (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.2.250.1.213.1.1.3.204'] and cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.4'] and cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.7.3'] and cda:templateId[@root='2.16.840.1.113883.10.20.1.34']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [1] [E_traitementDispense_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Traitement-dispense" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' France dont l'attribut @root="1.2.250.1.213.1.1.3.204"
            - Un deuxième 'templateId' IHE PHRAM DIS dont l'attribut @root="1.3.6.1.4.1.19376.1.9.1.3.4"
            - Un troisième 'templateId' IHE PCC dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.7.3"
            - Un quatrième 'templateId' CCD dont l'attribut @root="2.16.840.1.113883.10.20.1.34"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_text=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_traitementDispense_fr.sch] Errreur de conformité CI-SIS: L'élément supply doit contenir un élément 'text' (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_quantity=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_traitementDispense_fr.sch] Errreur de conformité CI-SIS: L'élément supply doit contenir un élément 'quantity' au maximum (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$count_product=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_traitementDispense_fr.sch] Errreur de conformité CI-SIS: L'élément supply doit contenir élément 'product' (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:entryRelationship) or (cda:entryRelationship and $count_referenceItemPresc)"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_traitementDispense_fr.sch] Errreur de conformité CI-SIS: Si l'élément supply contient un entryRelationship ayant le @typeCode='REFR', il doit avoir le templateId 1.2.250.1.213.1.1.3.90
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:entryRelationship) or (cda:entryRelationship and $count_insctructionDosage)"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_traitementDispense_fr.sch] Errreur de conformité CI-SIS: Si l'élément supply contient un entryRelationship ayant le @typeCode='COMP', il doit avoir le templateId 1.2.250.1.213.1.1.3.205
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:entryRelationship) or (cda:entryRelationship and $count_insctructionPatient)"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_traitementDispense_fr.sch] Errreur de conformité CI-SIS: Si l'élément supply contient un entryRelationship ayant le @typeCode='SUBJ', il doit avoir le templateId 1.2.250.1.213.1.1.3.33
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:entryRelationship) or (cda:entryRelationship and $count_notesDispensateur)"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_traitementDispense_fr.sch] Errreur de conformité CI-SIS: Si l'élément supply contient un entryRelationship ayant le @typeCode='SUBJ', il doit avoir le templateId 1.2.250.1.213.1.1.3.207
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:entryRelationship) or (cda:entryRelationship and $count_acteSubstitution)"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_traitementDispense_fr.sch] Errreur de conformité CI-SIS: Si l'élément supply contient un entryRelationship ayant le @typeCode='COMP', il doit avoir le templateId 1.2.250.1.213.1.1.3.206
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M67"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M67"/>
   <xsl:template match="@*|node()" priority="-2" mode="M67">
      <xsl:apply-templates select="*" mode="M67"/>
   </xsl:template>

   <!--PATTERN E_TNMy_frVérification de la conformité de l'entrée FR-TNM-y (1.2.250.1.213.1.1.3.135) créée par l'ANS-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-TNM-y (1.2.250.1.213.1.1.3.135) créée par l'ANS</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.135&#34;]" priority="1000"
                 mode="M68">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.135&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNMy_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-y, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.2.250.1.213.1.1.3.135' and cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.32'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNMy_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-y, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.135’) et ('1.3.6.1.4.1.19376.1.3.10.9.32')
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code='277649004'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNMy_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-TNM-y" doit comporter un élément 'code'(cardinalité [1..1]) ayant comme attribut @code='277649004'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:statusCode) or (cda:statusCode/@code='completed' or cda:statusCode/@code='aborted')"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNMy_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-y, si le statusCode est présent, il est fixé à la valeur @code='completed' ou  @code='aborted'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:text)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNMy_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-y, un élément text doit être présent maximum une fois [0..1] 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNMy_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-y, un élément value doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M68"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M68"/>
   <xsl:template match="@*|node()" priority="-2" mode="M68">
      <xsl:apply-templates select="*" mode="M68"/>
   </xsl:template>

   <!--PATTERN E_TNM-T_frVérification de la conformité de l'entrée FR-TNM-T (1.2.250.1.213.1.1.3.138) créée par l'ANS-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-TNM-T (1.2.250.1.213.1.1.3.138) créée par l'ANS</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.138&#34;]" priority="1000"
                 mode="M69">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.138&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-T_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-T, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.2.250.1.213.1.1.3.138' and cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.25'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-T_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-T, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.138’) et ('1.3.6.1.4.1.19376.1.3.10.9.25')
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code='21899-0'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-T_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-TNM-T" doit comporter un élément 'code'(cardinalité [1..1]) ayant comme attribut @code='21899-0'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-T_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-T, le statusCode est fixé à la valeur @code='completed' ou  @code='aborted'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:text)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-T_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-T, un élément text doit être présent maximum une fois [0..1] 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:effectiveTime"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-T_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-T, un élément effectiveTime doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-T_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-T, un élément value doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M69"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M69"/>
   <xsl:template match="@*|node()" priority="-2" mode="M69">
      <xsl:apply-templates select="*" mode="M69"/>
   </xsl:template>

   <!--PATTERN E_TNM-statutTumoralResiduel_frVérification de la conformité de l'entrée FR-TNM-Statut-tumoral-residuel (1.2.250.1.213.1.1.3.146) créée par l'ANS-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-TNM-Statut-tumoral-residuel (1.2.250.1.213.1.1.3.146) créée par l'ANS</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.146&#34;]" priority="1000"
                 mode="M70">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.146&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-statutTumoralResiduel_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Statut-tumoral-residuel, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.2.250.1.213.1.1.3.146' and cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.29'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-statutTumoralResiduel_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Statut-tumoral-residuel, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.146’) et ('1.3.6.1.4.1.19376.1.3.10.9.29')
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code='C4809'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-statutTumoralResiduel_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-TNM-Statut-tumoral-residuel" doit comporter un élément 'code'(cardinalité [1..1]) ayant comme attribut @code='C4809'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-statutTumoralResiduel_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Statut-tumoral-residuel, le statusCode est fixé à la valeur @code='completed' ou  @code='aborted'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:text)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-statutTumoralResiduel_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Statut-tumoral-residuel, un élément text doit être présent maximum une fois [0..1] 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:effectiveTime"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-statutTumoralResiduel_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Statut-tumoral-residuel, un élément effectiveTime doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-statutTumoralResiduel_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Statut-tumoral-residuel, un élément value doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M70"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M70"/>
   <xsl:template match="@*|node()" priority="-2" mode="M70">
      <xsl:apply-templates select="*" mode="M70"/>
   </xsl:template>

   <!--PATTERN E_TNM-r_frVérification de la conformité de l'entrée FR-TNM-r (1.2.250.1.213.1.1.3.137) créée par l'ANS-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-TNM-r (1.2.250.1.213.1.1.3.137) créée par l'ANS</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.137&#34;]" priority="1000"
                 mode="M71">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.137&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-r_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-r, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.2.250.1.213.1.1.3.137' and cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.31'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-r_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-r, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.137’) et ('1.3.6.1.4.1.19376.1.3.10.9.31')
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code='277647002'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-r_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-TNM-r" doit comporter un élément 'code'(cardinalité [1..1]) ayant comme attribut @code='277647002'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-r_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-r, le statusCode est fixé à la valeur @code='completed' ou  @code='aborted'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:text)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-r_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-r, un élément text doit être présent maximum une fois [0..1] 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-r_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-r, un élément value doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M71"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M71"/>
   <xsl:template match="@*|node()" priority="-2" mode="M71">
      <xsl:apply-templates select="*" mode="M71"/>
   </xsl:template>

   <!--PATTERN E_nombreNoeuds_frVérification de la conformité de l'entrée FR-TNM-nombre-noeuds (1.2.250.1.213.1.1.3.159)-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-TNM-nombre-noeuds (1.2.250.1.213.1.1.3.159)</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.159&#34;]" priority="1000"
                 mode="M72">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.159&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_nombreNoeuds_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-nombre-noeuds, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.2.250.1.213.1.1.3.159' and cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.37'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_nombreNoeuds_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-nombre-noeuds, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.159’) et ('1.3.6.1.4.1.19376.1.3.10.9.37')
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code='21893-3'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_nombreNoeuds_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-TNM-nombre-noeuds" doit comporter un élément 'code'(cardinalité [1..1]) ayant comme attribut @code='21893-3'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:code/cda:qualifier) or (cda:code/cda:qualifier and cda:code/cda:qualifier/cda:name/@code='85342-4')"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_nombreNoeuds_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-nombre-noeuds, si l'élément code/qualifier/name existe, il est fixé à la valeur @code='85342-4'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_nombreNoeuds_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-nombre-noeuds, le statusCode est fixé à la valeur @code='completed' ou  @code='aborted'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:text)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_nombreNoeuds_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-nombre-noeuds, un élément text doit être présent maximum une fois [0..1] 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:effectiveTime"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-T_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-T, un élément effectiveTime doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_nombreNoeuds_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-nombre-noeuds, un élément value doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:specimen[@typeCode='SPC'])&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_nombreNoeuds_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-nombre-noeuds, une ou plusieurs entrée FR-Echantillon-identifiant(1.2.250.1.213.1.1.3.104) doit être présente (s). 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:specimen[@typeCode='SPC']/cda:specimenRole[@classCode='SPEC']/cda:id"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_nombreNoeuds_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-nombre-noeuds, un élément specimenRole/id doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M72"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M72"/>
   <xsl:template match="@*|node()" priority="-2" mode="M72">
      <xsl:apply-templates select="*" mode="M72"/>
   </xsl:template>

   <!--PATTERN E_TNM-N_frVérification de la conformité de l'entrée FR-TNM-N (1.2.250.1.213.1.1.3.139)-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-TNM-N (1.2.250.1.213.1.1.3.139)</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.139&#34;]" priority="1000"
                 mode="M73">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.139&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-N_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-N, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.2.250.1.213.1.1.3.139' and cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.26'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-N_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-N, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.139’) et ('1.3.6.1.4.1.19376.1.3.10.9.26')
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code='21900-6'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-N_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-TNM-N" doit comporter un élément 'code'(cardinalité [1..1]) ayant comme attribut @code='21900-6'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-N_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-N, le statusCode est fixé à la valeur @code='completed' ou  @code='aborted'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:text)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-N_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-N, un élément text doit être présent maximum une fois [0..1] 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-N_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-N, un élément value doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value/cda:qualifier/cda:name/@code='tnmCp' and cda:value/cda:qualifier[cda:name/@code='tnmCp']/cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-N_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-N, un élément value/qualifier/name est fixé à la valeur @code='tnmCp'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:specimen[@typeCode='SPC'])&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-N_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-N, une ou plusieurs entrée FR-Echantillon-identifiant(1.2.250.1.213.1.1.3.104) doit être présente (s). 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:specimen[@typeCode='SPC']/cda:specimenRole[@classCode='SPEC']/cda:id"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-N_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-N, un élément specimenRole/id doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M73"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M73"/>
   <xsl:template match="@*|node()" priority="-2" mode="M73">
      <xsl:apply-templates select="*" mode="M73"/>
   </xsl:template>

   <!--PATTERN E_TNM-marqueursTumorauxSeriques_frVérification de la conformité de l'entrée FR-TNM-marqueurs-tumoraux-seriques (1.2.250.1.213.1.1.3.141) créée par l'ANS-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-TNM-marqueurs-tumoraux-seriques (1.2.250.1.213.1.1.3.141) créée par l'ANS</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.141&#34;]" priority="1000"
                 mode="M74">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.141&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-marqueursTumorauxSeriques_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-marqueurs-tumoraux-seriques, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.2.250.1.213.1.1.3.141' and cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.33'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-marqueursTumorauxSeriques_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-marqueurs-tumoraux-seriques, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.141’) et ('1.3.6.1.4.1.19376.1.3.10.9.33')
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code='C93025'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-marqueursTumorauxSeriques_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-TNM-marqueurs-tumoraux-seriques" doit comporter un élément 'code'(cardinalité [1..1]) ayant comme attribut @code='C93025'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-marqueursTumorauxSeriques_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-marqueurs-tumoraux-seriques, le statusCode est fixé à la valeur @code='completed' ou  @code='aborted'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:text)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-marqueursTumorauxSeriques_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-marqueurs-tumoraux-seriques, un élément text doit être présent maximum une fois [0..1] 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:effectiveTime"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-marqueursTumorauxSeriques_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-marqueurs-tumoraux-seriques, un élément effectiveTime doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-marqueursTumorauxSeriques_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-marqueurs-tumoraux-seriques, un élément value doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M74"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M74"/>
   <xsl:template match="@*|node()" priority="-2" mode="M74">
      <xsl:apply-templates select="*" mode="M74"/>
   </xsl:template>

   <!--PATTERN E_TNM-M_frVérification de la conformité de l'entrée FR-TNM-M (1.2.250.1.213.1.1.3.140) créée par l'ANS-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-TNM-M (1.2.250.1.213.1.1.3.140) créée par l'ANS</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.140&#34;]" priority="1000"
                 mode="M75">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.140&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-M_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-M, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.2.250.1.213.1.1.3.140' and cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.27'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-M_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-M, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.140’) et ('1.3.6.1.4.1.19376.1.3.10.9.27')
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code='21901-4'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-M_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-TNM-M" doit comporter un élément 'code'(cardinalité [1..1]) ayant comme attribut @code='21901-4'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-M_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-M, le statusCode est fixé à la valeur @code='completed' ou  @code='aborted'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:text)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-M_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-M, un élément text doit être présent maximum une fois [0..1] 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:effectiveTime"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-M_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-M, un élément effectiveTime doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-M_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-M, un élément value doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M75"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M75"/>
   <xsl:template match="@*|node()" priority="-2" mode="M75">
      <xsl:apply-templates select="*" mode="M75"/>
   </xsl:template>

   <!--PATTERN E_TNM-InvasionVeineuse_frVérification de la conformité de l'entrée FR-TNM-Invasion-veineuse (1.2.250.1.213.1.1.3.143)-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-TNM-Invasion-veineuse (1.2.250.1.213.1.1.3.143)</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.143&#34;]" priority="1000"
                 mode="M76">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.143&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionVeineuse_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-veineuse, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.2.250.1.213.1.1.3.143' and cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.35'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionVeineuse_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-veineuse, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.143’) et ('1.3.6.1.4.1.19376.1.3.10.9.35')
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code='33740-2'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionVeineuse_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-TNM-Invasion-veineuse" doit comporter un élément 'code'(cardinalité [1..1]) ayant comme attribut @code='33740-2'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionVeineuse_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-veineuse, le statusCode est fixé à la valeur @code='completed' ou  @code='aborted'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:text)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionVeineuse_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-veineuse, un élément text doit être présent maximum une fois [0..1] 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionVeineuse_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-veineuse, un élément value doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:specimen[@typeCode='SPC'])&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionVeineuse_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-veineuse, une ou plusieurs entrée FR-Echantillon-identifiant(1.2.250.1.213.1.1.3.104) doit être présente (s). 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:specimen[@typeCode='SPC']/cda:specimenRole[@classCode='SPEC']/cda:id"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionVeineuse_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-veineuse, un élément specimenRole/id doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M76"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M76"/>
   <xsl:template match="@*|node()" priority="-2" mode="M76">
      <xsl:apply-templates select="*" mode="M76"/>
   </xsl:template>

   <!--PATTERN E_TNM-InvasionPerineurale_frVérification de la conformité de l'entrée FR-TNM-Invasion-perineurale (1.2.250.1.213.1.1.3.144)-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-TNM-Invasion-perineurale (1.2.250.1.213.1.1.3.144)</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.144&#34;]" priority="1000"
                 mode="M77">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.144&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionPerineurale_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-perineurale, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.2.250.1.213.1.1.3.144' and cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.36'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionPerineurale_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-perineurale, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.144’) et ('1.3.6.1.4.1.19376.1.3.10.9.36')
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code='92837-4'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionPerineurale_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-TNM-Invasion-perineurale" doit comporter un élément 'code'(cardinalité [1..1]) ayant comme attribut @code='92837-4'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionPerineurale_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-perineurale, le statusCode est fixé à la valeur @code='completed' ou  @code='aborted'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:text)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionPerineurale_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-perineurale, un élément text doit être présent maximum une fois [0..1] 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionPerineurale_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-perineurale, un élément value doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:specimen[@typeCode='SPC'])&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionPerineurale_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-perineurale, une ou plusieurs entrée FR-Echantillon-identifiant(1.2.250.1.213.1.1.3.104) doit être présente (s). 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:specimen[@typeCode='SPC']/cda:specimenRole[@classCode='SPEC']/cda:id"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionPerineurale_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-perineurale, un élément specimenRole/id doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M77"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M77"/>
   <xsl:template match="@*|node()" priority="-2" mode="M77">
      <xsl:apply-templates select="*" mode="M77"/>
   </xsl:template>

   <!--PATTERN E_TNM-InvasionLymphatique_frVérification de la conformité de l'entrée FR-TNM-Invasion-lymphatique (1.2.250.1.213.1.1.3.142)-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-TNM-Invasion-lymphatique (1.2.250.1.213.1.1.3.142)</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.142&#34;]" priority="1000"
                 mode="M78">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.142&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionLymphatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-lymphatique, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.2.250.1.213.1.1.3.142' and cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.34'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionLymphatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-lymphatique, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.142’) et ('1.3.6.1.4.1.19376.1.3.10.9.34')
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code='33739-4'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionLymphatique_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-TNM-Invasion-lymphatique" doit comporter un élément 'code'(cardinalité [1..1]) ayant comme attribut @code='33739-4'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionLymphatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-lymphatique, le statusCode est fixé à la valeur @code='completed' ou  @code='aborted'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:text)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionLymphatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-lymphatique, un élément text doit être présent maximum une fois [0..1] 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionLymphatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-lymphatique, un élément value doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:specimen[@typeCode='SPC'])&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionLymphatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-lymphatique, une ou plusieurs entrée FR-Echantillon-identifiant(1.2.250.1.213.1.1.3.104) doit être présente (s). 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:specimen[@typeCode='SPC']/cda:specimenRole[@classCode='SPEC']/cda:id"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-InvasionLymphatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-lymphatique, un élément specimenRole/id doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M78"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M78"/>
   <xsl:template match="@*|node()" priority="-2" mode="M78">
      <xsl:apply-templates select="*" mode="M78"/>
   </xsl:template>

   <!--PATTERN E_TNM-classification_frVérification de la conformité de l'entrée FR-TNM-classification (1.2.250.1.213.1.1.3.145)-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-TNM-classification (1.2.250.1.213.1.1.3.145)</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.145&#34;]" priority="1000"
                 mode="M79">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.145&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-classification_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-classification, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.2.250.1.213.1.1.3.145' and cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.28'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-classification_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-classification, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.145’) et ('1.3.6.1.4.1.19376.1.3.10.9.28')
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code='59541-3'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-classification_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-TNM-classification" doit comporter un élément 'code'(cardinalité [1..1]) ayant comme attribut @code='59541-3'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-classification_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-classification, le statusCode est fixé à la valeur @code='completed' ou  @code='aborted'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:text)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-classification_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-classification, un élément text doit être présent maximum une fois [0..1] 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-classification_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-classification, un élément value doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:specimen[@typeCode='SPC'])&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-classification_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-classification, une ou plusieurs entrée FR-Echantillon-identifiant(1.2.250.1.213.1.1.3.104) doit être présente (s). 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:specimen[@typeCode='SPC']/cda:specimenRole[@classCode='SPEC']/cda:id"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-classification_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-classification, un élément specimenRole/id doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M79"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M79"/>
   <xsl:template match="@*|node()" priority="-2" mode="M79">
      <xsl:apply-templates select="*" mode="M79"/>
   </xsl:template>

   <!--PATTERN E_TNM-a_frVérification de la conformité de l'entrée FR-TNM-a (1.2.250.1.213.1.1.3.136) créée par l'ANS-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-TNM-a (1.2.250.1.213.1.1.3.136) créée par l'ANS</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.136&#34;]" priority="1000"
                 mode="M80">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.136&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-a_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-a, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.2.250.1.213.1.1.3.136' and cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.30'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-a_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-a, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.136’) et ('1.3.6.1.4.1.19376.1.3.10.9.30')
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code='85699-7'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-a_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-TNM-a" doit comporter un élément 'code'(cardinalité [1..1]) ayant comme attribut @code='85699-7'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-a_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-a, le statusCode est fixé à la valeur @code='completed' ou  @code='aborted'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:text)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-a_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-a, un élément text doit être présent maximum une fois [0..1] 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:effectiveTime"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-a_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-a, un élément effectiveTime doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_TNM-a_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-a, un élément value doit être présent 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M80"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M80"/>
   <xsl:template match="@*|node()" priority="-2" mode="M80">
      <xsl:apply-templates select="*" mode="M80"/>
   </xsl:template>

   <!--PATTERN E_regionInteretSurImage_frVérification de la conformité de l'entrée FR-Region-interet-sur-image -->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Region-interet-sur-image </svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.81&#34;]" priority="1000"
                 mode="M81">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.81&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:regionOfInterest[@classCode='ROIOVL' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_regionInteretSurImage_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Region-interet-sur-image(1.2.250.1.213.1.1.3.81), 
            les attributs de l'élément CDA 'observation' sont classCode='ROIOVL' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='2.16.840.1.113883.10.12.307']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [E_regionInteretSurImage_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Region-interet-sur-image" doit comporter le 'templateId' suivant:
            - 'templateId' dont l'attribut @root="2.16.840.1.113883.10.12.307"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_regionInteretSurImage_fr] : Erreur de conformité CI-SIS : L'élément "id" est obligatoirement présent minimun une fois[1..*].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_regionInteretSurImage_fr] : Erreur de conformité CI-SIS : L'élément "code" doit être présent une fois[1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:value)&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_regionInteretSurImage_fr] : Erreur de conformité CI-SIS : L'élément "value" doit être présent minimum une fois [1..*].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M81"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M81"/>
   <xsl:template match="@*|node()" priority="-2" mode="M81">
      <xsl:apply-templates select="*" mode="M81"/>
   </xsl:template>

   <!--PATTERN E_referencesExternes_frVérification de la conformité  de l'entrée FR-References-externes-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité  de l'entrée FR-References-externes</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.35&#34;]" priority="1000"
                 mode="M82">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.35&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:act[@classCode='ACT' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referencesExternes_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-References-externes(1.2.250.1.213.1.1.3.35), 
            les attributs de l'élément CDA 'observation' sont classCode='ACT' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.4']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [E_referencesExternes_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-References-externes" doit comporter le 'templateId' suivant:
            - 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.4"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referencesExternes_fr] : Erreur de conformité CI-SIS : L'élément "id" est obligatoirement présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@nullFlavor=&#34;NA&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referencesExternes_fr] : Erreur de conformité CI-SIS : L'élément "cod"e doit être présent une fois et doit avoir l'attribut @nullFlavor="NA"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:text)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_referencesExternes_fr] : Erreur de conformité CI-SIS :  L'élément "text" est obligatoire[1..1]
             </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:reference)&gt;=1 and (cda:reference/@typeCode=&#34;SPRT&#34; or cda:reference/@typeCode=&#34;REFR&#34;)"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referencesExternes_fr] : Erreur de conformité CI-SIS : L'élément "reference" doit être présent une fois ou plusieurs fois et et doit avoir l'attribut @typeCode="SPRT" or @typeCode="REFR".
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:reference/cda:externalDocument[@classCode=&#34;DOC&#34; and @moodCode=&#34;EVN&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referencesExternes_fr] : Erreur de conformité CI-SIS : L'élément "externalDocument" doit être présent une fois et doit avoir les attributs suivants : .
            @classCode="DOC" and @moodCode="EVN".
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:reference/cda:externalDocument/cda:id"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referencesExternes_int] : Erreur de conformité CI-SIS : L'élément "externalDocument" doit contenir un "id" une seule fois[1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M82"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M82"/>
   <xsl:template match="@*|node()" priority="-2" mode="M82">
      <xsl:apply-templates select="*" mode="M82"/>
   </xsl:template>

   <!--PATTERN E_referenceItemPrescription_frVérification de la conformité de l'entrée FR-Reference-item-prescription -->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Reference-item-prescription </svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.90&#34;]" priority="1000"
                 mode="M83">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.90&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:substanceAdministration[@classCode='SBADM' and @moodCode='INT']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referenceItemPrescription_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Reference-item-prescription (1.2.250.1.213.1.1.3.90), 
            les attributs de l'élément CDA 'observation' sont classCode='SBADM' et moodCode='INT'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.11']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [E_referenceItemPrescription_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Reference-item-prescription " doit comporter le 'templateId' suivant:
            - 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.9.1.3.11"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referenceItemPrescription_fr] : Erreur de conformité CI-SIS : L'élément "id" est présent une fois [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code=&#34;PREItem&#34; and cda:code/@codeSystem=&#34;1.3.6.1.4.1.19376.1.9.2.2&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referenceItemPrescription_fr] : Erreur de conformité CI-SIS : L'élément "code" doit être présent une fois et doit avoir l'attribut @code='PREItem' 
            et le codeSystem='1.3.6.1.4.1.19376.1.9.2.2'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:consumable)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_referenceItemPrescription_fr] : Erreur de conformité CI-SIS : L'élément "consumable" doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial[@nullFlavor=&#34;NA&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referenceItemPrescription_fr] : Erreur de conformité CI-SIS : L'élément "manufacturedMaterial" doit avoir l'attribut @nullFlavor="NA".
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M83"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M83"/>
   <xsl:template match="@*|node()" priority="-2" mode="M83">
      <xsl:apply-templates select="*" mode="M83"/>
   </xsl:template>

   <!--PATTERN E_referenceItemDispensation_frVérification de la conformité de l'entrée FR-Reference-item-dispensation -->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Reference-item-dispensation </svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.91&#34;]" priority="1000"
                 mode="M84">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.91&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:substanceAdministration[@classCode='SPLY' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referenceItemDispensation_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Reference-item-dispensation (1.2.250.1.213.1.1.3.91), 
            les attributs de l'élément CDA 'observation' sont classCode='SPLY' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.12']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [E_referenceItemDispensation_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Reference-item-dispensation " doit comporter le 'templateId' suivant:
            - 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.9.1.3.12"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referenceItemDispensation_fr] : Erreur de conformité CI-SIS : L'élément "id" est présent une fois [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code=&#34;DISItem&#34; and cda:code/@codeSystem=&#34;1.3.6.1.4.1.19376.1.9.2.2&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referenceItemDispensation_fr] : Erreur de conformité CI-SIS : L'élément "code" doit être présent une fois et doit avoir l'attribut @code='DISItem' 
            et le codeSystem='1.3.6.1.4.1.19376.1.9.2.2'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:consumable)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_referenceItemDispensation_fr] : Erreur de conformité CI-SIS : L'élément "consumable" doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial[@nullFlavor=&#34;NA&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referenceItemDispensation_fr] : Erreur de conformité CI-SIS : L'élément "manufacturedMaterial" doit avoir l'attribut @nullFlavor="NA".
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M84"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M84"/>
   <xsl:template match="@*|node()" priority="-2" mode="M84">
      <xsl:apply-templates select="*" mode="M84"/>
   </xsl:template>

   <!--PATTERN E_referenceItemAdministration_frVérification de la conformité de l'entrée FR-Reference-item-administration -->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Reference-item-administration </svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.93&#34;]" priority="1000"
                 mode="M85">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.93&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:substanceAdministration[@classCode='SBADM' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referenceItemAdministration_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Reference-item-administration (1.2.250.1.213.1.1.3.93), 
            les attributs de l'élément CDA 'observation' sont classCode='SBADM' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.14']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [E_referenceItemAdministration_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Reference-item-administration " doit comporter le 'templateId' suivant:
            - 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.9.1.3.14"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referenceItemAdministration_fr] : Erreur de conformité CI-SIS : L'élément "id" est présent une fois [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code=&#34;CMAItem&#34; and cda:code/@codeSystem=&#34;1.3.6.1.4.1.19376.1.9.2.2&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referenceItemAdministration_fr] : Erreur de conformité CI-SIS : L'élément "code" doit être présent une fois et doit avoir l'attribut @code='CMAItem' 
            et le codeSystem='1.3.6.1.4.1.19376.1.9.2.2'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:consumable)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_referenceItemAdministration_fr] : Erreur de conformité CI-SIS : L'élément "consumable" doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial[@nullFlavor=&#34;NA&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referenceItemAdministration_fr] : Erreur de conformité CI-SIS : L'élément "manufacturedMaterial" doit avoir l'attribut @nullFlavor="NA" .
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M85"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M85"/>
   <xsl:template match="@*|node()" priority="-2" mode="M85">
      <xsl:apply-templates select="*" mode="M85"/>
   </xsl:template>

   <!--PATTERN E_referenceConseilDispensateur_frVérification de la conformité de l'entrée FR-Reference-conseil-dispensateur -->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Reference-conseil-dispensateur </svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.92&#34;]" priority="1000"
                 mode="M86">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.92&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referenceConseilDispensateur_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Reference-conseil-dispensateur (1.2.250.1.213.1.1.3.92), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.13']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [E_referenceConseilDispensateur_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Reference-conseil-dispensateur " doit comporter le 'templateId' suivant:
            - 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.9.1.3.13"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referenceConseilDispensateur_fr] : Erreur de conformité CI-SIS : L'élément "id" est présent une fois [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code=&#34;PADVItem&#34; and cda:code/@codeSystem=&#34;1.3.6.1.4.1.19376.1.9.2.2&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referenceConseilDispensateur_fr] : Erreur de conformité CI-SIS : L'élément "code" doit être présent une fois et doit avoir l'attribut @code='PADVItem' 
            et le codeSystem='1.3.6.1.4.1.19376.1.9.2.2'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:consumable)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_referenceConseilDispensateur_fr] : Erreur de conformité CI-SIS : L'élément "consumable" doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial[@nullFlavor=&#34;NA&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_referenceConseilDispensateur_fr] : Erreur de conformité CI-SIS : L'élément "manufacturedMaterial" doit avoir l'attribut @nullFlavor='NA'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M86"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M86"/>
   <xsl:template match="@*|node()" priority="-2" mode="M86">
      <xsl:apply-templates select="*" mode="M86"/>
   </xsl:template>

   <!--PATTERN E_rangDeLaVaccination_frVérification de la conformité de l'entrée FR-Rang-de-la-vaccination -->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Rang-de-la-vaccination </svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.82&#34;]" priority="1000"
                 mode="M87">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.82&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_rangDeLaVaccination_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Rang-de-la-vaccination (1.2.250.1.213.1.1.3.82), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='2.16.840.1.113883.10.20.1.46']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [E_rangDeLaVaccination_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Rang-de-la-vaccination " doit comporter le 'templateId' suivant:
            -'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.46"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code=&#34;30973-2&#34; and cda:code/@codeSystem=&#34;2.16.840.1.113883.6.1&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_rangDeLaVaccination_fr] : Erreur de conformité CI-SIS : L'élément "code" doit être présent une fois et doit avoir l'attribut @code='30973-2' et
            le codeSystem='2.16.840.1.113883.6.1'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_rangDeLaVaccination_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:value)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_rangDeLaVaccination_fr] : Erreur de conformité CI-SIS : L'élément "value" doit être présent une fois [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M87"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M87"/>
   <xsl:template match="@*|node()" priority="-2" mode="M87">
      <xsl:apply-templates select="*" mode="M87"/>
   </xsl:template>

   <!--PATTERN E_professionLaPlusLongue_frVérification de la conformité de l'entrée FR-Profession-la-plus-longue -->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Profession-la-plus-longue </svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.125&#34;]" priority="1001"
                 mode="M88">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.125&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_professionLaPlusLongue_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Profession-la-plus-longue (1.2.250.1.213.1.1.3.125), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.2.250.1.213.1.1.3.125'] and cda:templateId[@root='1.3.6.1.4.1.19376.1.7.3.1.4.24.20']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [E_professionLaPlusLongue_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Profession-la-plus-longue " doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.7.3.1.4.24.20"
            - Un deuxième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.125" 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_professionLaPlusLongue_fr] : Erreur de conformité CI-SIS : L'élément "id" est présent une ou plusieurs fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code=&#34;21843-8&#34; and cda:code/@codeSystem=&#34;2.16.840.1.113883.6.1&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_professionLaPlusLongue_fr] : Erreur de conformité CI-SIS : L'élément "code" doit être présent une fois et doit avoir l'attribut @code='21843-8' et
            le codeSystem='2.16.840.1.113883.6.1'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code='completed']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_professionLaPlusLongue_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" 
            est toujours fixé à la valeur code='completed'. 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:effectiveTime)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_professionLaPlusLongue_fr] : Erreur de conformité CI-SIS : L'élément "effectiveTime" doit être présent une fois [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:effectiveTime/cda:low"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_professionLaPlusLongue_fr] : Erreur de conformité CI-SIS : L'élément "effectiveTime" doit contenir l'élément "low"[1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:value)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_professionLaPlusLongue_fr] : Erreur de conformité CI-SIS : L'élément "value" doit être présent une fois [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M88"/>
   </xsl:template>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.2.250.1.213.1.1.3.125']/cda:author"
                 priority="1000"
                 mode="M88">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.125']/cda:author"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:author)&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_professionLaPlusLongue_fr] : Erreur de conformité CI-SIS : L'élément "author" est présent une ou plusieurs fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M88"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M88"/>
   <xsl:template match="@*|node()" priority="-2" mode="M88">
      <xsl:apply-templates select="*" mode="M88"/>
   </xsl:template>

   <!--PATTERN E_periodeActiviteEnZoneDangeureuse_frVérification de la conformité de l'entrée FR-Periode-activite-en-zone-dangeureuse-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Periode-activite-en-zone-dangeureuse</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.133&#34;]" priority="1000"
                 mode="M89">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.133&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_periodeActiviteEnZoneDangeureuse_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Periode-activite-en-zone-dangeureuse(1.2.250.1.213.1.1.3.133), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.3.6.1.4.1.19376.1.7.3.1.4.24.22']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [E_periodeActiviteEnZoneDangeureuse_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Periode-activite-en-zone-dangeureuse" doit comporter le 'templateId' suivant:
            - 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.7.3.1.4.24.22"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_periodeActiviteEnZoneDangeureuse_fr] : Erreur de conformité CI-SIS : L'élément "id" est présent une ou plusieurs fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code=&#34;87511-2&#34; and cda:code/@codeSystem=&#34;2.16.840.1.113883.6.1&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_periodeActiviteEnZoneDangeureuse_fr] : Erreur de conformité CI-SIS : L'élément "code" doit être présent une fois et doit avoir l'attribut @code='87511-2' et
            le codeSystem='2.16.840.1.113883.6.1'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code='completed']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_periodeActiviteEnZoneDangeureuse_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" 
            est toujours fixé à la valeur code='completed'. 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:value)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_periodeActiviteEnZoneDangeureuse_fr] : Erreur de conformité CI-SIS : L'élément "value" doit être présent une fois [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M89"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M89"/>
   <xsl:template match="@*|node()" priority="-2" mode="M89">
      <xsl:apply-templates select="*" mode="M89"/>
   </xsl:template>

   <!--PATTERN E_organismeAssuranceMaladie_frVérification de la conformité de l'entrée FR-Organisme-assurance-maladie-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Organisme-assurance-maladie</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.18&#34;]"
                 priority="1001"
                 mode="M90">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.18&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:act[@classCode = 'ACT' and @moodCode = 'EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_organismeAssuranceMaladie_fr] Erreur de conformité CI-SIS : L'élément "act" doit
            contenir les attributs @classCode="ACT" et @moodCode="EVN". 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="(cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.18'] and cda:templateId[@root='2.16.840.1.113883.10.20.1.26'])             or cda:templateId[@root='1.2.250.1.213.1.1.3.94']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [E_organismeAssuranceMaladie_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Organisme-assurance-maladie" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.18"
            - Un deuxième 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.26" 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_organismeAssuranceMaladie_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Organisme-assurance-maladie " doit comporter un ou plusieurs élément 'id'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_organismeAssuranceMaladie_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Organisme-assurance-maladie " doit comporter un élément 'code'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode[@code='completed']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_organismeAssuranceMaladie_fr.sch] : Erreur de conformité CI-SIS : Le composant "statutCode" est toujours fixé à la valeur code='completed'. 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M90"/>
   </xsl:template>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.18']/cda:performer"
                 priority="1000"
                 mode="M90">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.18']/cda:performer"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="@typeCode='PRF'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_organismeAssuranceMaladie_fr.sch] Errreur de conformité CI-SIS : Dans l'entrée 'FR-Organisme-assurance-maladie', l'élément 'performer' doit contenir un attribut typeCode='PRF'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:assignedEntity"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_organismeAssuranceMaladie_fr.sch] Errreur de conformité CI-SIS : Dans l'entrée 'FR-Organisme-assurance-maladie', l'élément 'performer' doit contenir un élément 'assignedEntity'. 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M90"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M90"/>
   <xsl:template match="@*|node()" priority="-2" mode="M90">
      <xsl:apply-templates select="*" mode="M90"/>
   </xsl:template>

   <!--PATTERN E_observationTNM_frVérification de la conformité de l'entrée FR-ObservationTNM  -->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-ObservationTNM  </svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.134&#34;]" priority="1000"
                 mode="M91">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.134&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_observationTNM_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-ObservationTNM(1.2.250.1.213.1.1.3.134), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.2.250.1.213.1.1.3.134']and cda:templateId[@root='1.3.6.1.4.1.19376.1.3.10.4.2']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [1] [E_observationTNM_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-ObservationTNM" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.3.10.4.2"
            - Un deuxième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.134"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1 and cda:code/@code=&#34;21902-2&#34; and cda:code/@codeSystem=&#34;2.16.840.1.113883.6.1&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_observationTNM_fr] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois et doit avoir l'attribut @code='21902-2' et le codeSystem='2.16.840.1.113883.6.1'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_observationTNM_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" est fixé à la valeur code='completed' or code='aborted' </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:effectiveTime)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_observationTNM_fr] : Erreur de conformité CI-SIS : L'élément effectiveTime doit être présent une fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:specimen)&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_observationTNM_fr] Erreur de Conformité CI-SIS :  L'élément "specimen" doit être présent une ou plusieurs fois.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:specimen/cda:specimenRole"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_observationTNM_fr] Erreur de Conformité CI-SIS : L'élément specimen doit contenir l'élément specimenRole
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:specimenRole/@classCode='SPEC'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_observationTNM_fr]Erreur de Conformité CI-SIS : L'élément specimenRole doit contenir l'attribut @classCode 'SPEC'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:specimenRole/cda:id"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_observationTNM_fr] Erreur de Conformité CI-SIS : L'élément specimenRole doit contenir l'élément id
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:entryRelationship[@classCode='OBS' and @moodCode='EVN']/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.28']/cda:code[@code='59541-3']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_observationTNM_fr] Erreur de conformité CI-SIS : L'entrée ' FR-TNM-classification' doit être présente, les attributs @classCode et @moodCode doivent avoir les valeurs suivantes 'OBS' et 'EVN'.
            L'élément code de l'entrée 'FR-TNM-classification' est obligatoire [1..1] et doit avoir comme attribut @code='59541-3'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M91"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M91"/>
   <xsl:template match="@*|node()" priority="-2" mode="M91">
      <xsl:apply-templates select="*" mode="M91"/>
   </xsl:template>

   <!--PATTERN E_observationSurEchelleDouleur_frVérification de la conformité de l'entrée FR-Observation-sur-echelle-douleur(1.3.6.1.4.1.19376.1.5.3.1.1.12.3.1)-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Observation-sur-echelle-douleur(1.3.6.1.4.1.19376.1.5.3.1.1.12.3.1)</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.89&#34;]" priority="1000"
                 mode="M92">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.89&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode = 'OBS' and @moodCode = 'EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_observationSurEchelleDouleur_fr] Erreur de conformité CI-SIS : L'élément "observation" doit
            contenir les attributs @classCode="OBS" et @moodCode="EVN".
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.1.12.3.1'] and cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13']             and cda:templateId[@root='1.2.250.1.213.1.1.3.89']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [1] [E_observationSurEchelleDouleur_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Notes-du-dispensateur" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.13"
            - Un deuxième 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.1.12.3.1"
            - Un troisième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.89"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_observationSurEchelleDouleur_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Observation-sur-echelle-douleur" doit comporter au moins un élément 'id'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code[@code ='38208-5' and @codeSystem ='2.16.840.1.113883.6.1']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_observationSurEchelleDouleur_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Observation-sur-echelle-douleur" doit comporter un élément 'code'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:text)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_observationSurEchelleDouleur_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Observation-sur-echelle-douleur" doit comporter au moins un élément 'text'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:statusCode)=1 and cda:statusCode[@code ='completed']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_observationSurEchelleDouleur_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Observation-sur-echelle-douleur" doit comporter un élément 'statusCode' fixé à la valeur 'completed'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:value)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_observationSurEchelleDouleur_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Observation-sur-echelle-douleur" doit comporter un élément 'value'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M92"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M92"/>
   <xsl:template match="@*|node()" priority="-2" mode="M92">
      <xsl:apply-templates select="*" mode="M92"/>
   </xsl:template>

   <!--PATTERN E_observationAnatomoPathologique_frVérification de la conformité de l'entrée FR-Observation-Anatomo-pathologique-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Observation-Anatomo-pathologique</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.102&#34;]" priority="1000"
                 mode="M93">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.102&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode = 'OBS' and @moodCode = 'EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_observationAnatomoPathologique_fr] Erreur de conformité CI-SIS : L'élément "observation" doit
            contenir les attributs @classCode="OBS" et @moodCode="EVN".
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.3.6.1.4.1.19376.1.8.1.4.9'] and cda:templateId[@root='1.2.250.1.213.1.1.3.102']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [E_observationAnatomoPathologique_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Observation-Anatomo-pathologique" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.8.1.4.9"
            - Un deuxième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.102"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_observationAnatomoPathologique_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Observation-Anatomo-pathologique" doit comporter un élément 'code'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed' or cda:statusCode/@code='active' or cda:statusCode/@code='aborted'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_observationAnatomoPathologique_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Observation-Anatomo-pathologique" doit comporter un élément 'statusCode' et fixé à la valeur @code='completed' ou  @code='active ou 'aborted'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:effectiveTime)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_observationAnatomoPathologique_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Observation-Anatomo-pathologique" doit contenir un élément "effectiveTime".</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M93"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M93"/>
   <xsl:template match="@*|node()" priority="-2" mode="M93">
      <xsl:apply-templates select="*" mode="M93"/>
   </xsl:template>

   <!--PATTERN E_notesDuDispensateur_frVérification de la conformité de l'entrée FR-Notes-du-dispensateur (1.2.250.1.213.1.1.3.207)-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Notes-du-dispensateur (1.2.250.1.213.1.1.3.207)</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.207&#34;]" priority="1000"
                 mode="M94">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.207&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:act[@classCode = 'ACT' and @moodCode = 'INT']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_notesDuDispensateur_fr] Erreur de conformité CI-SIS : L'élément "act" doit
            contenir les attributs @classCode="ACT" et @moodCode="INT". </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.3.1'] and cda:templateId[@root='2.16.840.1.113883.10.20.1.43']             and cda:templateId[@root='1.2.250.1.213.1.1.3.207']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [1] [E_notesDuDispensateur_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Notes-du-dispensateur" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.3.1"
            - Un deuxième 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.43"
            - Un troisième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.207"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code/cda:code/@code='FINSTRUCT' and cda:code/@codeSystem='1.3.6.1.4.1.19376.1.5.3.2'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_notesDuDispensateur_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Notes-du-dispensateur" doit comporter un élément 'code'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M94"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M94"/>
   <xsl:template match="@*|node()" priority="-2" mode="M94">
      <xsl:apply-templates select="*" mode="M94"/>
   </xsl:template>

   <!--PATTERN E_laboratoryObservation_frVérification de la conformité de l'entrée FR-Resultat-examens-de-biologie-element-clinique-pertinent -->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Resultat-examens-de-biologie-element-clinique-pertinent </svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.80&#34;]" priority="1000"
                 mode="M95">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.80&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_laboratoryObservation_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Resultat-examens-de-biologie-element-clinique-pertinent(1.2.250.1.213.1.1.3.80), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.3.6.1.4.1.19376.1.3.1.6']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            
            [E_laboratoryObservation_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Resultat-examens-de-biologie-element-clinique-pertinent" doit comporter le 'templateId' suivant:
            - 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.3.1.6"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_laboratoryObservation_fr] : Erreur de conformité CI-SIS : L'élément "code" doit être présent une fois[1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code/cda:originalText)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_laboratoryObservation_fr] : Erreur de conformité CI-SIS : L'élément "code" doit contenir l'élément "originalText" une seule fois[1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code/cda:originalText/cda:reference)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_laboratoryObservation_fr] : Erreur de conformité CI-SIS : L'élément "originalText" doit contenir l'élément "reference" une fois[1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted' "/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_laboratoryObservation_fr] Erreur de Conformité CI-SIS : L'élément "statusCode" doit être présent et fixé à la valeur @code='completed' ou @code='aborted'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M95"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M95"/>
   <xsl:template match="@*|node()" priority="-2" mode="M95">
      <xsl:apply-templates select="*" mode="M95"/>
   </xsl:template>

   <!--PATTERN E_joursDeTravailHebdomadaire_frVérification de la conformité de l'entrée FR-Jours-de-travail-hebdomadaire(1.2.250.1.213.1.1.3.131)-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Vérification de la conformité de l'entrée FR-Jours-de-travail-hebdomadaire(1.2.250.1.213.1.1.3.131)</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.131&#34;]" priority="1000"
                 mode="M96">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.131&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_joursDeTravailHebdomadaire_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Jours-de-travail-hebdomadaire, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'SBADM' et 'EVN'  </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:id)&gt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_joursDeTravailHebdomadaire_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Jours-de-travail-hebdomadaire, il doit y avoir un ou plusieurs élément id (cardinalité [1..*])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId/@root='1.3.6.1.4.1.19376.1.7.3.1.4.24.7' and cda:templateId/@root='1.2.250.1.213.1.1.3.131'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_joursDeTravailHebdomadaire_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Jours-de-travail-hebdomadaire, il doit y avoir les templateIds suivants :
            - 1.3.6.1.4.1.19376.1.7.3.1.4.24.7
            - 1.2.250.1.213.1.1.3.131
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:code)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_joursDeTravailHebdomadaire_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Jours-de-travail-hebdomadaire" doit comporter un élément 'code'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_joursDeTravailHebdomadaire_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Jours-de-travail-hebdomadaire, le statusCode doit présent et fixé à la valeur @code='completed'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="count(cda:value)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_joursDeTravailHebdomadaire_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Jours-de-travail-hebdomadaire, il doit y avoir un élément value (cardinalité [1..1])
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M96"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M96"/>
   <xsl:template match="@*|node()" priority="-2" mode="M96">
      <xsl:apply-templates select="*" mode="M96"/>
   </xsl:template>

   <!--PATTERN E_isolatMicrobiologique_fr-->


	<!--RULE -->
<xsl:template match="*[cda:templateId/@root ='1.2.250.1.213.1.1.3.79']" priority="1000"
                 mode="M97">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root ='1.2.250.1.213.1.1.3.79']"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.3.6.1.4.1.19376.1.3.1.5']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_isolatMicrobiologique_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Isolat-microbiologique" doit avoir un 'templateId' avec l'attribut @root="1.3.6.1.4.1.19376.1.3.1.5"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="../cda:organizer[@classCode = 'CLUSTER' and @moodCode = 'EVN']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_isolatMicrobiologique_fr.sch] Erreur de Conformité CI-SIS : 
            Le template d'image illustrative doit apparaître dans un élément organizer 
            de classCode 'CLUSTER' et de moodCode 'EVN'. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:statusCode/@code='completed' or cda:statusCode/@code='active' or cda:statusCode/@code='aborted' "/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_isolatMicrobiologique_fr.sch] Erreur de Conformité CI-SIS : Dans l'entrée FR-Isolat-microbiologique, le statusCode doit présent et fixé à la valeur @code='completed' ou  @code='active ou 'aborted'
            . </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:specimen/cda:specimenRole"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_isolatMicrobiologique_fr.sch] Erreur de Conformité CI-SIS : L'élément specimen doit contenir l'élément specimenRole
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:specimen/cda:specimenRole/@classCode='SPEC'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_isolatMicrobiologique_fr.sch]Erreur de Conformité CI-SIS : L'élément specimenRole doit contenir l'attribut @classCode 'SPEC'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M97"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M97"/>
   <xsl:template match="@*|node()" priority="-2" mode="M97">
      <xsl:apply-templates select="*" mode="M97"/>
   </xsl:template>

   <!--PATTERN E_imageIllustrativeAPSR_fr-->


	<!--RULE -->
<xsl:template match="*[cda:templateId/@root ='1.3.6.1.4.1.19376.1.8.1.4.10']" priority="1000"
                 mode="M98">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root ='1.3.6.1.4.1.19376.1.8.1.4.10']"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='1.2.250.1.213.1.1.3.103.1']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_imageIllustrativeAPSR_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Image-illustrative-APSR" doit avoir un 'templateId' avec l'attribut @root="1.2.250.1.213.1.1.3.103.1"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:templateId[@root='2.16.840.1.113883.10.12.304']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_imageIllustrativeAPSR_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Image-illustrative-APSR" doit avoir un 'templateId' avec l'attribut @root="2.16.840.1.113883.10.12.304"
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="../cda:observationMedia[@classCode = 'OBS' and @moodCode = 'EVN' and @ID]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_imageIllustrativeAPSR_fr] Erreur de Conformité CI-SIS : 
            Le template d'image illustrative doit apparaître dans un élément observationMedia 
            de classCode 'OBS' et de moodCode 'EVN', et identifié par un attribut ID. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:value[(@mediaType = 'image/gif' or @mediaType = 'image/jpeg' or @mediaType = 'image/png') and @representation = 'B64']"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_imageIllustrativeAPSR_fr] Erreur de Conformité CI-SIS : 
            L'image doit être un gif, un png ou un jpeg, encodé en base 64 dans le sous-élément value. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:specimen"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_imageIllustrativeAPSR_fr] Erreur de Conformité CI-SIS :  L'élément "specimen" doit être présent.
             </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:specimenRole/@classCode='SPEC'"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_imageIllustrativeAPSR_fr] Erreur de conformité APSR : L'élément specimenRole doit contenir l'attribut @classCode 'SPEC'
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:specimenRole/cda:id"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_imageIllustrativeAPSR_fr] Erreur de conformité APSR : L'élément id doit être présent dans specimenRole [1..1].
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M98"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M98"/>
   <xsl:template match="@*|node()" priority="-2" mode="M98">
      <xsl:apply-templates select="*" mode="M98"/>
   </xsl:template>
</xsl:stylesheet>