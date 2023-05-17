<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
   CI-SIS_IMG-CR-IMG_2022.01.sch
   Schématron de vérification de la conformité au modèle du CI-SIS d'un document IMG-CR-IMG_2022.01
   
   IMG-CR-IMG : Compte rendu d'imagerie
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
      23/03/2022 : Création
   ......................................................................................................................................................    
-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_IMG-CR-IMG_2022.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_IMG-CR-IMG_2022.01.sch">
    <title>Rapport de conformité du document aux spécifications du modèle IMG-CR-IMG du CI-SIS</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    <ns uri="urn:dicom-org:ps3-20" prefix="ps3-20"/>
    
    <!-- Abstract patterns -->
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/> 
    
    <!-- JDV -->
    <include href="include/jeuxDeValeurs/IMG-CR-IMG_2022.01/JDV_ModaliteImagerie-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/IMG-CR-IMG_2022.01/JDV_ModaliteImagerieDocumentationOf-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/IMG-CR-IMG_2022.01/JDV_ModaliteAcquisition-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/IMG-CR-IMG_2022.01/JDV_QuantiteExpositionRayonnements-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/IMG-CR-IMG_2022.01/JDV_contre-indications-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/IMG-CR-IMG_2022.01/JDV_StatutGrossesse-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/IMG-CR-IMG_2022.01/JDV_LocalisationAnatomiqueTechniqueImg-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/IMG-CR-IMG_2022.01/JDV_LocalisationAnatomiqueQuantite-CISIS.sch"/>
 
    
    <!-- Entete -->
    <include href="include/specificationsVolets/IMG-CR-IMG_2022.01/Entete/Entete_IMG-CR-IMG.sch"/>
    
    <!-- Sections -->
    <include href="include/specificationsVolets/IMG-CR-IMG_2022.01/Sections/S_EducationDuPatient_IMG-CR-IMG.sch"/>
    <include href="include/specificationsVolets/IMG-CR-IMG_2022.01/Sections/S_DICOM_Addendum_IMG-CR-IMG.sch"/>
    <include href="include/specificationsVolets/IMG-CR-IMG_2022.01/Sections/S_DICOM_Conclusion_IMG-CR-IMG.sch"/>
    <include href="include/specificationsVolets/IMG-CR-IMG_2022.01/Sections/S_DICOM_ExamenComparatif_IMG-CR-IMG.sch"/>
    <include href="include/specificationsVolets/IMG-CR-IMG_2022.01/Sections/S_DICOM_ActeImagerie_IMG-CR-IMG.sch"/>
    <include href="include/specificationsVolets/IMG-CR-IMG_2022.01/Sections/S_DICOM_ExpositionsAuxRadiations_IMG-CR-IMG.sch"/>
    <include href="include/specificationsVolets/IMG-CR-IMG_2022.01/Sections/S_DICOM_CatalogueObjets_IMG-CR-IMG.sch"/>
    <include href="include/specificationsVolets/IMG-CR-IMG_2022.01/Sections/S_DICOM_InformationClinique_IMG-CR-IMG.sch"/>
    <include href="include/specificationsVolets/IMG-CR-IMG_2022.01/Sections/S_DICOM_HistoriqueMedical_IMG-CR-IMG.sch"/>
    <include href="include/specificationsVolets/IMG-CR-IMG_2022.01/Sections/S_DICOM_Complications_IMG-CR-IMG.sch"/>
    <include href="include/specificationsVolets/IMG-CR-IMG_2022.01/Sections/S_DICOM_Resultat_IMG-CR-IMG.sch"/>
    
    <!-- Entrées -->
    <include href="include/specificationsVolets/IMG-CR-IMG_2022.01/Entrees/E_TechniqueImagerie_IMG-CR-IMG.sch"/>
    <include href="include/specificationsVolets/IMG-CR-IMG_2022.01/Entrees/E_ExamenImagerie_IMG-CR-IMG.sch"/>
    <include href="include/specificationsVolets/IMG-CR-IMG_2022.01/Entrees/E_AdministrationProduitDeSante_IMG-CR-IMG.sch"/>
    
    <phase id="CI-SIS_IMG-CR-IMG_2022.01">
        <active pattern="principal"/>
        
        <!-- Entete --> 
        <active pattern="Entete_IMG-CR-IMG"/>
        
        <!-- JDV --> 
        <active pattern="JDV_ModaliteImagerie-CISIS"/> 
        <active pattern="JDV_ModaliteImagerieDocumentationOf-CISIS"/>
        <active pattern="JDV_ModaliteAcquisition-CISIS"/>
        <active pattern="JDV_QuantiteExpositionRayonnements-CISIS"/>
        <active pattern="JDV_contre-indications-CISIS"/>
        <active pattern="JDV_StatutGrossesse-CISIS"/>
        <active pattern="JDV_LocalisationAnatomiqueTechniqueImg-CISIS"/>
        <active pattern="JDV_LocalisationAnatomiqueQuantite-CISIS"/>
        
        <!-- Sections spécifiques au volet CI-SIS_IMG-CR-IMG -->
        <active pattern="S_EducationDuPatient_IMG-CR-IMG"/>
        <active pattern="S_DICOM_Addendum_IMG-CR-IMG"/>
        <active pattern="S_DICOM_Conclusion_IMG-CR-IMG"/>
        <active pattern="S_DICOM_ActeImagerie_IMG-CR-IMG"/>
        <active pattern="S_DICOM_ExamenComparatif_IMG-CR-IMG"/>
        <active pattern="S_DICOM_InformationClinique_IMG-CR-IMG"/>
        <active pattern="S_DICOM_ExpositionsAuxRadiations_IMG-CR-IMG"/>
        <active pattern="S_DICOM_CatalogueObjets_IMG-CR-IMG"/>
        <active pattern="S_DICOM_InformationClinique_IMG-CR-IMG"/>
        <active pattern="S_DICOM_HistoriqueMedical_IMG-CR-IMG"/>
        <active pattern="S_DICOM_Complications_IMG-CR-IMG"/>
        <active pattern="S_DICOM_Resultat_IMG-CR-IMG"/>

        <!-- Entrées spécifiques au volet CI-SIS_IMG-CR-IMG -->
        <active pattern="E_TechniqueImagerie_IMG-CR-IMG"/>
        <active pattern="E_ExamenImagerie_IMG-CR-IMG"/>
        <active pattern="E_AdministrationProduitDeSante_IMG-CR-IMG"/>
        
    </phase>
    
    <pattern id="principal">
        <let name="JDV_ModaliteImagerie-CISIS" value="'../jeuxDeValeurs/JDV_ModaliteImagerie-CISIS.xml'"/>
        <let name="JDV_ModaliteImagerieDocumentationOf-CISIS" value="'../jeuxDeValeurs/JDV_ModaliteImagerie-CISIS.xml'"/>
        <let name="JDV_ModaliteAcquisition-CISIS" value="'../jeuxDeValeurs/JDV_ModaliteAcquisition-CISIS.xml'"/>
        <let name="JDV_QuantiteExpositionRayonnements-CISIS" value="'../jeuxDeValeurs/JDV_QuantiteExpositionRayonnements-CISIS.xml'"/>
        <let name="JDV_contre-indications-CISIS" value="'../jeuxDeValeurs/JDV_contre-indications-CISIS.xml'"/>
        <let name="JDV_StatutGrossesse-CISIS" value="'../jeuxDeValeurs/JDV_StatutGrossesse-CISIS.xml'"/>
        <let name="JDV_LocalisationAnatomiqueTechniqueImg-CISIS" value="'../jeuxDeValeurs/JDV_LocalisationAnatomique-CISIS.xml'"/>
        <let name="JDV_LocalisationAnatomiqueQuantite-CISIS" value="'../jeuxDeValeurs/JDV_LocalisationAnatomique-CISIS.xml'"/>
        
        <rule context="cda:ClinicalDocument/cda:component/cda:structuredBody">    
            <!-- présence des sections obligatoires --> 
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.209'])=1"> 
                [CI-SIS_IMG-CR-IMG] Erreur de conformité au modèle : La section "FR-DICOM-Conclusion" (1.2.250.1.213.1.1.2.209) doit être présente.
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.206'])&gt;=1"> 
                [CI-SIS_IMG-CR-IMG] Erreur de conformité au modèle : La section "FR-DICOM-Acte-imagerie" (1.2.250.1.213.1.1.2.206) doit être présente.
            </assert>
            
            <!-- controle des sections optionnelles --> 
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.210']) &lt;=1"> 
                [CI-SIS_IMG-CR-IMG] Erreur de conformité au modèle : La section "FR-DICOM-Addendum" (1.2.250.1.213.1.1.2.210) doit être présente au maximum une seule fois [0..1].
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.205']) &lt;=1"> 
                [CI-SIS_IMG-CR-IMG] Erreur de conformité au modèle : La section "FR-DICOM-informations-cliniques" (1.2.250.1.213.1.1.2.205) doit être présente au maximum une seule fois [0..1].
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.1']) &lt;=1"> 
                [CI-SIS_IMG-CR-IMG] Erreur de conformité au modèle : La section FR-Dispositifs-medicaux" (1.2.250.1.213.1.1.2.1) doit être présente au maximum une seule fois [0..1].
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.208']) &lt;=1"> 
                [CI-SIS_IMG-CR-IMG] Erreur de conformité au modèle : La section "FR-DICOM-Resultats" (1.2.250.1.213.1.1.2.208) doit être présente au maximum une seule fois [0..1].
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.207']) &lt;=1"> 
                [CI-SIS_IMG-CR-IMG] Erreur de conformité au modèle : La section "FR-DICOM-Examen-comparatif" (1.2.250.1.213.1.1.2.207) doit être présente au maximum une seule fois [0..1].
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.150']) &lt;=1"> 
                [CI-SIS_IMG-CR-IMG] Erreur de conformité au modèle : La section "FR-Resultats-examens-non-code" (1.2.250.1.213.1.1.2.150) doit être présente au maximum une seule fois [0..1].
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.73']) &lt;=1"> 
                [CI-SIS_IMG-CR-IMG] Erreur de conformité au modèle : La section "FR-Commentaire-non-code" (1.2.250.1.213.1.1.2.73) doit être présente au maximum une seule fois [0..1].
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.37']) &lt;=1"> 
                [CI-SIS_IMG-CR-IMG] Erreur de conformité au modèle : La section "FR-Documents-ajoutes" (1.2.250.1.213.1.1.2.37) doit être présente au maximum une seule fois [0..1].
            </assert> 
            
            
        </rule>
    </pattern>
</schema>