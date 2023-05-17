<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
   CI-SIS_CANCER-D2LM-FIN_2022.01.sch
   Schématron de vérification de la conformité au modèle du CI-SIS d'un document CANCER-D2LM-FIN_2022.01
   
   CANCER-D2LM-FIN : DÉPISTAGE DU CANCER DU SEIN - FICHE D’INTERPRÉTATION DE LA MAMMOGRAPHIE
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
       31/08/2021 : SBM : Création
       05/04/2022:  Migration des terminologies et JDV en SNOMED-CT
   ......................................................................................................................................................    
-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_CANCER-D2LM-FIN_2022.01"
        xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_CANCER-D2LM-FIN_2022.01.sch">
        <title>Rapport de conformité du document aux spécifications du volet CANCER-D2LM-FIN_2022.01</title>
        <ns prefix="cda" uri="urn:hl7-org:v3"/>
        <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
        <ns prefix="jdv" uri="http://esante.gouv.fr"/>
        <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
        
        <!-- Abstract patterns -->
        
        <include href="abstract/dansJeuDeValeurs.sch"/>
        <include href="abstract/IVL_TS.sch"/>   
 
        <!-- Sections spécifiques à la D2LM-FIN -->
        <!-- [APE 06/09/2021] supprimé 
        <include href="include/specificationsVolets/CANCER-D2LM-FIN_2022.01/Sections/S_Identification_D2LM-FIN.sch"/> -->
        
        <!-- [APE 06/09/2021] supprimé 
        <include href="include/specificationsVolets/CANCER-D2LM-FIN_2022.01/Sections/S_antecedents_D2LM-FIN.sch"/>  -->
        
        <!-- [APE 06/09/2021] supprimé car existe déjà sous le nom S_Bilan-diagnostic-immediat_ANS.sch dans schematron/include/sections -->
        <!-- <include href="include/specificationsVolets/CANCER-D2LM-FIN_2022.01/Sections/S_Bilan-diagnostic-immediat-D2LM-FIN.sch"/>   -->   
        
        <!-- [APE 06/09/2021] renommé -->
        <include href="include/specificationsVolets/CANCER-D2LM-FIN_2022.01/Sections/S_Interpretation-1er-lecteur-D2LM-FIN.sch"/>        
        <!-- [APE 06/09/2021] créé -->
        <include href="include/specificationsVolets/CANCER-D2LM-FIN_2022.01/Sections/S_Interpretation-2eme-lecteur-DL2M-FIN.sch"/>
        
        <!-- Entrées spécifiques à la D2LM-FIN -->
        <include href="include/specificationsVolets/CANCER-D2LM-FIN_2022.01/Entrees/E_Acte-D2LM-FIN.sch"/>
        <include href="include/specificationsVolets/CANCER-D2LM-FIN_2022.01/Entrees/E_ListeDesAntecedents-D2LM-FIN.sch"/>
        <!-- [APE 06/09/2021] supprimé 
        <include href="include/specificationsVolets/CANCER-D2LM-FIN_2022.01/Entrees/E_ListeDesProblemesActifs-D2LM-FIN.sch"/> -->
        
        <!--JDV-->
        <include href="include/jeuxDeValeurs/CANCER-D2LM-FIN_2022.01/JDV_AntecedentsPersonnels-CISIS.sch"/>
        <include href="include/jeuxDeValeurs/CANCER-D2LM-FIN_2022.01/JDV_BilanDiagnostic-CISIS.sch"/>
        <include href="include/jeuxDeValeurs/CANCER-D2LM-FIN_2022.01/JDV_ConduiteATenir_1-CISIS.sch"/>
        <include href="include/jeuxDeValeurs/CANCER-D2LM-FIN_2022.01/JDV_ConduiteATenir_3-CISIS.sch"/>
        <include href="include/jeuxDeValeurs/CANCER-D2LM-FIN_2022.01/JDV_DensiteMammaire-CISIS.sch"/>
        <include href="include/jeuxDeValeurs/CANCER-D2LM-FIN_2022.01/JDV_ExamenClinique-CISIS.sch"/>
        <include href="include/jeuxDeValeurs/CANCER-D2LM-FIN_2022.01/JDV_MotifDiagnostic-CISIS.sch"/>
        <include href="include/jeuxDeValeurs/CANCER-D2LM-FIN_2022.01/JDV_MotifEchographie-CISIS.sch"/>
        <include href="include/jeuxDeValeurs/CANCER-D2LM-FIN_2022.01/JDV_TypeLecture-CISIS.sch"/>
        <include href="include/jeuxDeValeurs/CANCER-D2LM-FIN_2022.01/JDV_Technique_imagerie-D2LM-CISIS.sch"/>
        <include href="include/jeuxDeValeurs/CANCER-D2LM-FIN_2022.01/JDV_Classification_ACR-CISIS_3.sch"/>
         
        <!--Entete-->
        <include href="include/specificationsVolets/CANCER-D2LM-FIN_2022.01/Entete/Entete_D2LM-FIN.sch"/>
        
        <!-- [APE 06/09/2021] supprimé : pas de schématron spécifique -->
        
        <phase id="CI-SIS_CANCER-D2LM-FIN_2022.01">
                <active pattern="variables"/>
                
                <!-- [APE 06/09/2021] supprimé <active pattern="S_identification_D2LM-FIN"/> -->
                <!-- [APE 06/09/2021] supprimé <active pattern="S_antecedents_D2LM-FIN"/> -->
                <!-- [APE 06/09/2021] supprimé <active pattern="S_Bilan-diagnostic-immediat-D2LM-FIN"/> -->
                <active pattern="S_Interpretation-1er-lecteur-D2LM-FIN"/>
                <active pattern="S_Interpretation-2eme-lecteur-DL2M-FIN"/>
                
                <active pattern="E_Acte-D2LM-FIN"/>
                <!-- [APE 06/09/2021] supprimé 
                <active pattern="E_ListeDesProblemesActifs-D2LM-FIN"/> -->
                <active pattern="E_ListeDesAntecedents-D2LM-FIN"/>
                
                <active pattern="JDV_AntecedentsPersonnels-CISIS"/>
                <active pattern="JDV_BilanDiagnostic-CISIS"/>
                <active pattern="JDV_ConduiteATenir_1-CISIS"/>
                <active pattern="JDV_ConduiteATenir_3-CISIS"/>
                <active pattern="JDV_DensiteMammaire-CISIS"/>
                <active pattern="JDV_ExamenClinique-CISIS"/>
                <active pattern="JDV_MotifDiagnostic-CISIS"/>
                <active pattern="JDV_MotifEchographie-CISIS"/>
                <active pattern="JDV_TypeLecture-CISIS"/>
                <active pattern="JDV_Technique_imagerie-D2LM-CISIS"/>
                <active pattern="JDV_Classification_ACR-CISIS_3"/>
                
                <!--Entete-->
                <active pattern="Entete_D2LM-FIN"/>
                
        </phase>

        <pattern id="variables">
                
                <let name="JDV_AntecedentsPersonnels-CISIS" value="'../jeuxDeValeurs/JDV_AntecedentsPersonnels-CISIS.xml'"/>
                <let name="JDV_BilanDiagnostic-CISIS" value="'../jeuxDeValeurs/JDV_BilanDiagnostic-CISIS.xml'"/>
                <let name="JDV_ConduiteATenir_1-CISIS" value="'../jeuxDeValeurs/JDV_ConduiteATenir_1-CISIS.xml'"/>
                <let name="JDV_ConduiteATenir_3-CISIS" value="'../jeuxDeValeurs/JDV_ConduiteATenir_3-CISIS.xml'"/>
                <let name="JDV_DensiteMammaire-CISIS" value="'../jeuxDeValeurs/JDV_DensiteMammaire-CISIS.xml'"/>
                <let name="JDV_ExamenClinique-CISIS" value="'../jeuxDeValeurs/JDV_ExamenClinique-CISIS.xml'"/>
                <let name="JDV_MotifDiagnostic-CISIS" value="'../jeuxDeValeurs/JDV_MotifDiagnostic-CISIS.xml'"/>
                <let name="JDV_MotifEchographie-CISIS" value="'../jeuxDeValeurs/JDV_MotifEchographie-CISIS.xml'"/>
                <let name="JDV_TypeLecture-CISIS" value="'../jeuxDeValeurs/JDV_TypeLecture-CISIS.xml'"/>
                <let name="JDV_Technique_imagerie-D2LM-CISIS" value="'../jeuxDeValeurs/JDV_Technique_imagerie-D2LM-CISIS.xml'"/>
                <let name="JDV_Classification_ACR-CISIS_3" value="'../jeuxDeValeurs/JDV_Classification_ACR-CISIS.xml'"/>
                
        </pattern>
</schema>
