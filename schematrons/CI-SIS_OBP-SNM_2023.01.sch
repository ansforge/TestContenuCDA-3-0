<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_OBP-SNM_2023.01.sch
    ANS   
    ......................................................................................................................................................    
    Historique :
        13/06/2023 : Création nouvelle version 2023.01
        17/08/2023 : Ajout du schématron du JDV_ModeSortie-OBP-SNM.sch 
              
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_OBP-SNM_2023.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_OBP-SNM_2023.01.sch">
    <title>Vérification de la conformité au modèle OBP-SNM_2023.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!-- Abstract patterns -->    
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>     
    
    <!--Entete-->    
    <include href="include/specificationsVolets/OBP-SNM_2023.01/Entete/Entete_OBP-SNM.sch"/>
    
    <!-- Sections -->          

    <!-- JDV -->    
     
    <!-- <include href="include/jeuxDeValeurs/OBP-SNM_2023.01/JDV_EtatPerinee_OBP-SNM.sch"/> -->   
    <include href="include/jeuxDeValeurs/OBP-SNM_2023.01/JDV_MotifDeclenchementTravail_OBP-SNM.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SNM_2023.01/JDV_Acte_OBP-SNM.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SNM_2023.01/JDV_ModeDebutTravail_OBP-SNM.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SNM_2023.01/JDV_TypeActePostPartum_OBP-SNM.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SNM_2023.01/JDV_TypeAnesthesieApresNaissance_OBP-SNM.sch"/>    
    <include href="include/jeuxDeValeurs/OBP-SNM_2023.01/JDV_TypeAnesthesieAvantNaissance_OBP-SNM.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SNM_2023.01/JDV_ModeSortie-OBP-SNM.sch"/>
    

    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <phase id="CI-SIS_OBP-SNM_2023.01">
        <active pattern="variables"/>
        <p>Vérification de la conformité au CI-SIS</p>
        
        <!-- Activation Entete-->
        <active pattern="Entete_OBP-SNM"/>        
        
        <!-- Activation JDV -->
        
        <!--<active pattern="JDV_EtatPerinee_OBP-SNM"/>-->
        <active pattern="JDV_MotifDeclenchementTravail_OBP-SNM"/>
        <active pattern="JDV_Acte_OBP-SNM"/>
        <active pattern="JDV_ModeDebutTravail_OBP-SNM"/>
        <active pattern="JDV_TypeActePostPartum_OBP-SNM"/>
        <active pattern="JDV_TypeAnesthesieApresNaissance_OBP-SNM"/>        
        <active pattern="JDV_TypeAnesthesieAvantNaissance_OBP-SNM"/>
        <active pattern="JDV_ModeSortie-OBP-SNM"/>
        
        
    </phase>
    
    <pattern id="variables">

        <!-- chemins relatifs des fichiers jeux de valeurs -->
           
        <!--<let name="JDV_EtatPerinee_OBP-SNM" value="'../jeuxDeValeurs/JDV_EtatPerinee_CISIS.xml'"/>-->
        <let name="JDV_MotifDeclenchementTravail_OBP-SNM" value="'../jeuxDeValeurs/JDV_MotifDeclenchementTravail_CISIS.xml'"/>
        <let name="JDV_Acte_OBP-SNM" value="'../jeuxDeValeurs/JDV_ActeOBP_CISIS.xml'"/>
        <let name="JDV_ModeDebutTravail_OBP-SNM" value="'../jeuxDeValeurs/JDV_ModeDebutTravail_CISIS.xml'"/>
        <let name="JDV_TypeActePostPartum_OBP-SNM" value="'../jeuxDeValeurs/JDV_TypeActePostPartum_CISIS.xml'"/>
        <let name="JDV_TypeAnesthesieApresNaissance_OBP-SNM" value="'../jeuxDeValeurs/JDV_TypeAnesthesieApresNaissance_CISIS.xml'"/>        
        <let name="JDV_TypeAnesthesieAvantNaissance_OBP-SNM" value="'../jeuxDeValeurs/JDV_TypeAnesthesieAvantNaissance_CISIS.xml'"/>
        <let name="JDV_ModeSortie-OBP-SNM" value="'../jeuxDeValeurs/JDV_ModeSortie_OBP_SNM_CISIS.xml'"/>
        
        
    </pattern>
</schema>
