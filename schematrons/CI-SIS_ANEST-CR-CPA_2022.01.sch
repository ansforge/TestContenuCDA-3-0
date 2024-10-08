<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
   CI-SIS_ANEST-CR-CPA_2022.01.sch
   Schématron de vérification de la conformité au modèle du CI-SIS d'un document ANEST-CR-CPA_2022.01
   
   ANEST-CR-CPA : Compte rendu de consultation pré-anesthésique
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
      21/12/2020 : Création
      07/06/2021 : Correction du contrôle du documentationOf/serviceEvent/code
      05/04/2022 : Migration des terminologies et JDV : Ajout du JDV_HL7_ObservationIntoleranceType-CISIS.sch
      28/08/2023 : Migration des terminologies et JDV
   ......................................................................................................................................................    
-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_ANEST-CR-CPA_2022.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_ANEST-CR-CPA_2022.01">
    <title>Rapport de conformité du document aux spécifications du volet ANEST-CR-CPA</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!--=<<o#%@O[ Abstract patterns ]O@%#o>>=-->
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>   
    
    <!--JDV-->
    <include href="include/jeuxDeValeurs/ANEST-CR-CPA_2022.01/JDV_AideAuDeplacement-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/ANEST-CR-CPA_2022.01/JDV_FacteursDeRisqueSociaux-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/ANEST-CR-CPA_2022.01/JDV_FacteursDeRisqueProfessionnels-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/ANEST-CR-CPA_2022.01/JDV_GIR-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/ANEST-CR-CPA_2022.01/JDV_NiveauDependance-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/ANEST-CR-CPA_2022.01/JDV_ScoreDuke-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/ANEST-CR-CPA_2022.01/JDV_ScoreMallampati-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/ANEST-CR-CPA_2022.01/JDV_Sedentarite-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/ANEST-CR-CPA_2022.01/JDV_Severite-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/ANEST-CR-CPA_2022.01/JDV_SupportNutritionnel-CISIS.sch"/>
    
    <!-- Entete -->
    <include href="include/specificationsVolets/ANEST-CR-CPA_2022.01/Entete/Entete_Anest-CR-CPA.sch"/>
    
    <!-- Sections -->
    <include href="include/specificationsVolets/ANEST-CR-CPA_2022.01/Sections/S_SignesVitaux-CISIS.sch"/>
    <include href="include/specificationsVolets/ANEST-CR-CPA_2022.01/Sections/S_ExamenPhysiqueDetaille-CISIS.sch"/>
    <include href="include/specificationsVolets/ANEST-CR-CPA_2022.01/Sections/S_AntecedentsChirurgicauxNonCodee-CISIS.sch"/>
    <include href="include/specificationsVolets/ANEST-CR-CPA_2022.01/Sections/S_AntecedentsFamiliauxNonCodee-CISIS.sch"/>
    <include href="include/specificationsVolets/ANEST-CR-CPA_2022.01/Sections/S_ProblemesActifs-CISIS.sch"/>
    <include href="include/specificationsVolets/ANEST-CR-CPA_2022.01/Sections/S_AntecedentsMedicaux-CISIS.sch"/>
    <include href="include/specificationsVolets/ANEST-CR-CPA_2022.01/Sections/S_HabitusModeDeVie-CISIS.sch"/>
    <include href="include/specificationsVolets/ANEST-CR-CPA_2022.01/Sections/S_FonctionsPhysiques-CISIS.sch"/>
    <include href="include/specificationsVolets/ANEST-CR-CPA_2022.01/Sections/S_AllergiesEtHypersensibilites-CISIS.sch"/>
    <include href="include/specificationsVolets/ANEST-CR-CPA_2022.01/Sections/S_Traitements-CISIS.sch"/>
    <include href="include/specificationsVolets/ANEST-CR-CPA_2022.01/Sections/S_AntecedentsTransfusionnelsNonCodee-CISIS.sch"/>
    <include href="include/specificationsVolets/ANEST-CR-CPA_2022.01/Sections/S_AntecedentsHemorragiquesNonCodee-CISIS.sch"/>
    
    <phase id="CI-SIS_ANEST-CR-CPA_2022.01">
        <active pattern="JDVvariables"/>
        
        <!-- JDV -->
        <active pattern="JDV_AideAuDeplacement-CISIS"/>
        <active pattern="JDV_FacteursDeRisqueSociaux-CISIS"/>
        <active pattern="JDV_FacteursDeRisqueProfessionnels-CISIS"/>
        <active pattern="JDV_GIR-CISIS"/>
        <active pattern="JDV_NiveauDependance-CISIS"/>
        <active pattern="JDV_ScoreDuke-CISIS"/>
        <active pattern="JDV_ScoreMallampati-CISIS"/>
        <active pattern="JDV_Sedentarite-CISIS"/>
        <active pattern="JDV_Severite-CISIS"/>
        <active pattern="JDV_SupportNutritionnel-CISIS"/>
        
        <!-- Entete -->
        <active pattern="Entete_Anest-CR-CPA"/>
        
       <!-- Sections spécifiques au volet ANEST-CR-CPA -->
        <active pattern="S_SignesVitaux-CISIS"/>
        <active pattern="S_ExamenPhysiqueDetaille-CISIS"/>
        <active pattern="S_AntecedentsChirurgicauxNonCodee-CISIS"/>
        <active pattern="S_AntecedentsFamiliauxNonCodee-CISIS"/>
        <active pattern="S_ProblemesActifs-CISIS"/>
        <active pattern="S_AntecedentsMedicaux-CISIS"/>
        <active pattern="S_HabitusModeDeVie-CISIS"/>
        <active pattern="S_FonctionsPhysiques-CISIS"/>
        <active pattern="S_AllergiesEtHypersensibilites-CISIS"/>
        <active pattern="S_Traitements-CISIS"/>
        <active pattern="S_AntecedentsTransfusionnelsNonCodee-CISIS"/>
        <active pattern="S_AntecedentsHemorragiquesNonCodee-CISIS"/>
    </phase>
    
    <pattern id="JDVvariables">
        <let name="jdv_ANEST-CR-CPA_AideAuDeplacement" value="'../jeuxDeValeurs/JDV_AideAuDeplacement_CISIS.xml'"/>
        <let name="jdv_ANEST-CR-CPA_FacteursDeRisqueSociaux" value="'../jeuxDeValeurs/JDV_FacteursDeRisqueSociaux_CISIS.xml'"/>
        <let name="jdv_ANEST-CR-CPA_FacteursDeRisqueProfessionnels" value="'../jeuxDeValeurs/JDV_FacteursDeRisqueProfessionnels_CISIS.xml'"/>
        <let name="jdv_ANEST-CR-CPA_GIR" value="'../jeuxDeValeurs/JDV_GIR_CISIS.xml'"/>
        <let name="jdv_ANEST-CR-CPA_NiveauDependance" value="'../jeuxDeValeurs/JDV_NiveauDependance_CISIS.xml'"/>
        <let name="jdv_ANEST-CR-CPA_ScoreDuke" value="'../jeuxDeValeurs/JDV_ScoreDuke_CISIS.xml'"/>
        <let name="jdv_ANEST-CR-CPA_ScoreMallampati" value="'../jeuxDeValeurs/JDV_ScoreMallampati_CISIS.xml'"/>
        <let name="jdv_ANEST-CR-CPA_Sedentarite" value="'../jeuxDeValeurs/JDV_Sedentarite_CISIS.xml'"/>
        <let name="jdv_ANEST-CR-CPA_Severite" value="'../jeuxDeValeurs/JDV_SeveriteObservation_CISIS.xml'"/>
        <let name="jdv_ANEST-CR-CPA_SupportNutritionnel" value="'../jeuxDeValeurs/JDV_SupportNutritionnel_CISIS.xml'"/>
        
        <!-- présence des sections obligatoires -->
        <rule context="cda:ClinicalDocument/cda:component/cda:structuredBody">
            
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2'])=1"> 
                [CI-SIS_ANEST-CR-CPA_2022.01] Erreur de conformité au modèle ANEST-CR-CPA : La section "FR-Signes-vitaux" (1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2)  doit être présente.
            </assert>
            
        </rule>
        
    </pattern>
</schema>