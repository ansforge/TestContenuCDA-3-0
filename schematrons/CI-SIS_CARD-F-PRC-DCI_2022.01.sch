<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_CARD-F-PRC-DCI_2022.01.sch
    Vérification de la conformité sémantique au volet Patients à Risques de Cardiologie du CI-SIS.
     
    04/01/2023 : Nouvelle version 2023.01 : Création d'un schématron différent pour chaqu'un des volets CARD-F-PRC
-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_CARD-F-PRC-DCI_2022.01.sch">
    <title>Rapport de conformité du document aux spécifications du volet Fiches Patient à risque en cardiologie (CARD-F-PRC-DCI_2022.01)</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!-- Abstract patterns -->
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>   
    
    <!--Patterns d'entete spécifiques au volet-->
    <include href="include/specificationsVolets/CARD-F-PRC-DCI_2022.01/Entete/Entete_CARD-F-PRC-DCI.sch"/>
    
    <!--Patterns des entrées spécifiques au volet-->
    <include href="include/specificationsVolets/CARD-F-PRC-DCI_2022.01/Entrees/E_DefibrillateurOrg-CARD-F-PRC-DCI.sch"/>
    <include href="include/specificationsVolets/CARD-F-PRC-DCI_2022.01/Entrees/E_SondeDefOrg-CARD-F-PRC-DCI.sch"/>
    
    <!--Patterns des JDVs spécifiques au volet-->
    <include href="include/jeuxDeValeurs/CARD-F-PRC-DCI_2022.01/JDV_UFCV_MatImpl_CARD-F-PRC-DCI.sch"/>
    <include href="include/jeuxDeValeurs/CARD-F-PRC-DCI_2022.01/JDV_UFCV_TypeDM-CARD-F-PRC-DCI.sch"/>
    <include href="include/jeuxDeValeurs/CARD-F-PRC-DCI_2022.01/JDV_UFCV_NYHA-CARD-F-PRC-DCI.sch"/>
    <include href="include/jeuxDeValeurs/CARD-F-PRC-DCI_2022.01/JDV_UFCV_SiteImp-CARD-F-PRC-DCI.sch"/>
    <include href="include/jeuxDeValeurs/CARD-F-PRC-DCI_2022.01/JDV_UFCV_Lat-CARD-F-PRC-DCI.sch"/>
    <include href="include/jeuxDeValeurs/CARD-F-PRC-DCI_2022.01/JDV_UFCV_PolarSnd-CARD-F-PRC-DCI.sch"/>
    <include href="include/jeuxDeValeurs/CARD-F-PRC-DCI_2022.01/JDV_UFCV_Connx-CARD-F-PRC-DCI.sch"/>
    <include href="include/jeuxDeValeurs/CARD-F-PRC-DCI_2022.01/JDV_UFCV_VoieAbord-CARD-F-PRC-DCI.sch"/>
    <include href="include/jeuxDeValeurs/CARD-F-PRC-DCI_2022.01/JDV_UFCV_Impl-CARD-F-PRC-DCI.sch"/>
    <include href="include/jeuxDeValeurs/CARD-F-PRC-DCI_2022.01/JDV_UFCV_CodEntree-CARD-F-PRC-DCI.sch"/>
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <phase id="CI-SIS_F-PRC-DCI_2022.01">
        <!-- Entete-->
        <active pattern="Entete_CARD-F-PRC-DCI"/>
        
        <!-- Entrées -->
        <active pattern="E_DefribrillateurOrg-CARD-F-PRC-DCI"/>
        <active pattern="E_SondeDefOrg-CARD-F-PRC-DCI"/>
        
        <!-- JDVs -->
        <active pattern="JDV_UFCV_MatImpl_CARD-F-PRC-DCI"/>
        <active pattern="JDV_UFCV_TypeDM-CARD-F-PRC-DCI"/>
        <active pattern="JDV_UFCV_NYHA-CARD-F-PRC-DCI"/>
        <active pattern="JDV_UFCV_SiteImp-CARD-F-PRC-DCI"/>
        <active pattern="JDV_UFCV_Lat-CARD-F-PRC-DCI"/>
        <active pattern="JDV_UFCV_PolarSnd-CARD-F-PRC-DCI"/>
        <active pattern="JDV_UFCV_Connx-CARD-F-PRC-DCI"/>
        <active pattern="JDV_UFCV_VoieAbord-CARD-F-PRC-DCI"/>
        <active pattern="JDV_UFCV_CodEntree-CARD-F-PRC-DCI"/>
        <active pattern="JDV_UFCV_Impl-CARD-F-PRC-DCI"/>
    </phase>
    
    <pattern id="variables">
       
        <let name="jdv_UFCV_MatImpl_CARD-F-PRC-DCI" value="'../jeuxDeValeurs/JDV_UFCV_MatImpl-CISIS.xml'"/>
        <let name="jdv_UFCV_TypeDM-CARD-F-PRC-DCI" value="'../jeuxDeValeurs/JDV_UFCV_TypeDMCard-CISIS.xml'"/>
        <let name="jdv_UFCV_NYHA-CARD-F-PRC-DCI" value="'../jeuxDeValeurs/JDV_UFCV_NYHA-CISIS.xml'"/>
        <let name="jdv_UFCV_SiteImp-CARD-F-PRC-DCI" value="'../jeuxDeValeurs/JDV_UFCV_SiteImp-CISIS.xml'"/>
        <let name="jdv_UFCV_Lat-CARD-F-PRC-DCI" value="'../jeuxDeValeurs/JDV_UFCV_Lat-CISIS.xml'"/>
        <let name="jdv_UFCV_PolarSnd-CARD-F-PRC-DCI" value="'../jeuxDeValeurs/JDV_UFCV_PolarSnd-CISIS.xml'"/>
        <let name="jdv_UFCV_Connx-CARD-F-PRC-DCI" value="'../jeuxDeValeurs/JDV_UFCV_Connx-CISIS.xml'"/>
        <let name="jdv_UFCV_VoieAbord-CARD-F-PRC-DCI" value="'../jeuxDeValeurs/JDV_UFCV_VoieAbord-CISIS.xml'"/>
        <let name="jdv_UFCV_Impl-CARD-F-PRC-DCI" value="'../jeuxDeValeurs/JDV_UFCV_Impl-CISIS.xml'"/>
        <let name="jdv_UFCV_CodEntree-CARD-F-PRC-DCI" value="'../jeuxDeValeurs/JDV_UFCV_CodEntree-CISIS.xml'"/>
        
        <!-- présence des sections obligatoires -->        
        <rule context="cda:ClinicalDocument/cda:component/cda:structuredBody">            
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.132'])=1"> 
                [CARD-F-PRC-DCI] Erreur de conformité au modèle : La section "FR-Problemes-actifs" (1.2.250.1.213.1.1.2.132) doit être présente.
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.136'])=1"> 
                [CARD-F-PRC-DCI] Erreur de conformité au modèle : La section "FR-Historique-des-actes" (1.2.250.1.213.1.1.2.136) doit être présente.
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.1'])=1"> 
                [CARD-F-PRC-DCI] Erreur de conformité au modèle : La section "FR-Dispositifs-medicaux" (1.2.250.1.213.1.1.2.1) doit être présente.
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.107'])=1"> 
                [CARD-F-PRC-DCI] Erreur de conformité au modèle : La section "FR-Education-du-patient" (1.2.250.1.213.1.1.2.107) doit être présente.
            </assert>
        </rule>
    </pattern>
    
</schema>
