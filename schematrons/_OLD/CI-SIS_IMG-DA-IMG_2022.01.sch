<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
   CI-SIS_IMG-DA-IMG_2022.01.sch
   Schématron de vérification de la conformité au modèle du CI-SIS d'un document IMG-DA-IMG_2022.01
   
   IMG-DA-IMG : Demande d'acte d'imagerie
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
      04/01/2022 : Création
   ......................................................................................................................................................    
-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_IMG-DA-IMG_2022.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_IMG-DA-IMG_2022.01.sch">
    <title>Rapport de conformité du document aux spécifications du modèle IMG-DA-IMG du CI-SIS</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!-- Abstract patterns -->
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/> 
    
    <!-- JDV -->
    <include href="include/jeuxDeValeurs/CI-SIS_IMG-DA-IMG_2022.01/JDV_contre-indications-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CI-SIS_IMG-DA-IMG_2022.01/JDV_modalite-demandeActeImagerie-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CI-SIS_IMG-DA-IMG_2022.01/JDV_ModaliteAcquisition-CISIS.sch"/>
    <!--<include href="include/jeuxDeValeurs/CI-SIS_IMG-DA-IMG_2022.01/JDV_Lateralite-CISIS.sch"/>-->
    <include href="include/jeuxDeValeurs/CI-SIS_IMG-DA-IMG_2022.01/JDV_InjectionPDC_TEP-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CI-SIS_IMG-DA-IMG_2022.01/JDV_LateraliteTechniqueImagerie-CISIS.sch"/>
    
    <!-- Entete -->
    <include href="include/specificationsVolets/CI-SIS_IMG-DA-IMG_2022.01/Entete/Entete_IMG-DA-IMG.sch"/>
    
    <!-- Sections -->
    
    <include href="include/specificationsVolets/CI-SIS_IMG-DA-IMG_2022.01/Sections/S_DICOM_InformationClinique_IMG-DA-IMG.sch"/>
    <include href="include/specificationsVolets/CI-SIS_IMG-DA-IMG_2022.01/Sections/S_DICOM_HistoriqueMedical_IMG-DA-IMG.sch"/>
    <include href="include/specificationsVolets/CI-SIS_IMG-DA-IMG_2022.01/Sections/S_PlanDeSoins_IMG-DA-IMG.sch"/>
    <!-- Entrées -->
    <include href="include/specificationsVolets/CI-SIS_IMG-DA-IMG_2022.01/Entrees/E_InformationDuPatient_IMG-DA-IMG.sch"/>
   
    <phase id="CI-SIS_IMG-DA-IMG_2022.01">
        <active pattern="principal"/>
        <!-- Entete --> 
        <active pattern="Entete_IMG-DA-IMG"/>
        <!-- JDV --> 
        <active pattern="JDV_modalite-demandeActeImagerie-CISIS"/>
        <active pattern="JDV_ModaliteAcquisition-CISIS"/>
        <active pattern="JDV_contre-indications-CISIS"/>
       <!-- <active pattern="JDV_Lateralite-CISIS"/>-->
        <active pattern="JDV_InjectionPDC_TEP-CISIS"/>
        <active pattern="JDV_LateraliteTechniqueImagerie-CISIS"/>
        <!-- Sections spécifiques au volet CI-SIS_IMG-CR-IMG -->
        <active pattern="S_DICOM_InformationClinique_IMG-DA-IMG"/>
        <active pattern="S_DICOM_HistoriqueMedical_IMG-DA-IMG"/>
        <active pattern="S_PlanDeSoins_IMG-DA-IMG"/>
        <!-- Entrées spécifiques au volet CI-SIS_IMG-CR-IMG -->
        <active pattern="E_InformationDuPatient_IMG-DA-IMG"/>
    </phase>
    
    <pattern id="principal">
        <let name="JDV_modalite-demandeActeImagerie-CISIS" value="'../jeuxDeValeurs/JDV_modalite-demandeActeImagerie-CISIS.xml'"/>
        <let name="JDV_contre-indications-CISIS" value="'../jeuxDeValeurs/JDV_contre-indications-CISIS.xml'"/>
        <let name="JDV_ModaliteAcquisition-CISIS" value="'../jeuxDeValeurs/JDV_ModaliteAcquisition-CISIS.xml'"/>
        <let name="JDV_InjectionPDC_TEP-CISIS" value="'../jeuxDeValeurs/JDV_InjectionPDC_TEP-CISIS.xml'"/>
        <let name="JDV_LateraliteTechniqueImagerie-CISIS" value="'../jeuxDeValeurs/JDV_LateraliteTechniqueImagerie-CISIS.xml'"/>
        
        <rule context="cda:ClinicalDocument/cda:component/cda:structuredBody">    
            <!-- présence des sections obligatoires --> 
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.840.10008.9.2'])=1"> 
                [CI-SIS_IMG-DA-IMG] Erreur de conformité au modèle : La section "FR-DICOM-informations-cliniques" (1.2.840.10008.9.2) doit être présente.
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.107'])=1"> 
                [CI-SIS_IMG-DA-IMG] Erreur de conformité au modèle : La section "FR-Education-et-consentement-du-patient" (1.2.250.1.213.1.1.2.107) doit être présente.
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.158'])=1"> 
                [CI-SIS_IMG-DA-IMG] Erreur de conformité au modèle : La section " FR-Plan-de-soins" (1.2.250.1.213.1.1.2.158) doit être présente.
            </assert>
        </rule>
    </pattern>
</schema>