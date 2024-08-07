<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
   CI-SIS_CANCER-D2LM-FIDD_2022.01.sch
   Schématron de vérification de la conformité au modèle du CI-SIS d'un document CANCER-D2LM-FIDD_2021.01
   
   D2LM_FIN : CR de seconde lecture de mammographie - Fiche d'interprétation de diagnostic différé
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
       02/09/2021 : Création
       27/11/2021 : Modification
       10/11/2022:  Migration des terminologies et JDV en SNOMED-CT
       28/08/2023 : Migration des terminologies et JDV
   ......................................................................................................................................................    
-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_CANCER-D2LM-FIDD_2022.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"   
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_CANCER-D2LM-FIDD_2022.01.sch">
    
    <title>Vérification de conformité du document au volet CANCER-D2LM-FIDD_2022.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!-- Abstract patterns -->
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>   
    
    <!-- JDV -->
    <include href="include/jeuxDeValeurs/CANCER-DL2M-FIDD_2022.01/JDV_TechniqueBilan-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CANCER-DL2M-FIDD_2022.01/JDV_ConduiteATenir_2-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CANCER-DL2M-FIDD_2022.01/JDV_MotifDiagnostic-CISIS.sch"/>   
    <!-- [APE 27/11/2021] ajouté -->
    <include href="include/jeuxDeValeurs/CANCER-DL2M-FIDD_2022.01/JDV_Classification_ACR-CISIS.sch"/>
    
    <!-- Entete -->
    <include href="include/specificationsVolets/CANCER-DL2M-FIDD_2022.01/Entete/Entete_D2LM-FIDD.sch"/> 
    
    <!-- Sections -->    
    <include href="include/specificationsVolets/CANCER-DL2M-FIDD_2022.01/Sections/S_ResultatsExamens_DL2M-FIDD.sch"/>
    <include href="include/specificationsVolets/CANCER-DL2M-FIDD_2022.01/Sections/S_PlanDeSoin_D2LM-FIDD.sch"/> 
    
    <!-- Entrée spécifiques à D2LM-FIDD -->  
    <!-- [APE 08/09/2021] supprimé 
    <include href="include/specificationsVolets/CANCER-D2LM-FIDD_2021.01/Entrees/E_ListeDesProblemesActifs-D2LM-FIDD.sch"/> 
    <include href="include/specificationsVolets/CANCER-D2LM-FIDD_2021.01/Entrees/E_Acte_D2LM_FIDD.sch"/> -->
    
    <phase id="CI-SIS_CANCER-D2LM-FIDD_2022.01">
        <active pattern="variables"/>
        <active pattern="JDV_TechniqueBilan-CISIS"/>
        <active pattern="JDV_ConduiteATenir_2-CISIS"/>
        <active pattern="JDV_MotifDiagnostic-CISIS"/>   
        <!-- [APE 27/11/2021] ajouté -->
        <active pattern="JDV_Classification_ACR-CISIS"/>   
        
        <!--Entete-->
        <active pattern="Entete_D2LM-FIDD"/>
        
        <!-- Sections -->
        <active pattern="S_ResultatsExamens_DL2M-FIDD"/>
        <active pattern="S_PlanDeSoin_D2LM-FIDD"/>
        
        <!-- Entrée -->
        <!-- [APE 08/09/2021] supprimé <active pattern="E_ListeDesProblemesActifs-D2LM-FIDD"></active> 
        <active pattern="E_Acte_D2LM_FIDD"/> -->
        
    </phase>
    
    <pattern id="variables">
        
        <let name="JDV_TechniqueBilan-CISIS" value="'../jeuxDeValeurs/JDV_BilanTechnique_CISIS.xml'"/>
        <let name="JDV_ConduiteATenir_2-CISIS" value="'../jeuxDeValeurs/JDV_ConduiteATenir_2_CISIS.xml'"/>
        <let name="JDV_MotifDiagnostic-CISIS" value="'../jeuxDeValeurs/JDV_MotifDiagnostic_CISIS.xml'"/> 
        <!-- [APE 27/11/2021] ajouté -->        
        <let name="JDV_Classification_ACR-CISIS" value="'../jeuxDeValeurs/JDV_Classification_ACR_CISIS.xml'"/> 
        
        <!-- présence des sections obligatoires -->        
        <rule context="cda:ClinicalDocument/cda:component/cda:structuredBody">            
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.3.28'])=1"> 
                [Entete_D2LM-FIDD] Erreur de conformité au modèle : La section FR-Resultats-examens (1.3.6.1.4.1.19376.1.5.3.1.3.28) doit être présente.
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.3.36'])=1"> 
                [Entete_D2LM-FIDD] Erreur de conformité au modèle : La section FR-Plan-de-soins (1.3.6.1.4.1.19376.1.5.3.1.3.36) doit être présente.
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.37'])=1"> 
                [Entete_D2LM-FIDD] Erreur de conformité au modèle : La section FR-Documents-ajoutes(1.2.250.1.213.1.1.2.37) doit être présente.
            </assert>
        </rule>
        
    </pattern>
</schema>
