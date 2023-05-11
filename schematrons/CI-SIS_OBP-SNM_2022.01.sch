<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_OBP-SNM_2022.01.sch
    ANS   
    ......................................................................................................................................................    
    Historique :
        17/10/2013 : Création
        19/06/2015 : Maj des include telecom20110728.sch  -> telecom20150317.sch
        14/03/2018 : MAJ du pattern Variables 
        10/09/2021 : Modification du nom du schématron       
        13/09/2021 : Version 2021.01
        25/10/2022 : Version 2022.01        
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_OBP-SNM_2022.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_OBP-SNM_2022.01.sch">
    <title>Vérification de la conformité au modèle OBP-SNM_2022.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!-- Abstract patterns -->    
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>     
    
    <!--Entete-->    
    <include href="include/specificationsVolets/OBP-SNM_2022.01/Entete/Entete_OBP-SNM.sch"/>
    
    <!-- Sections -->          

    <!-- JDV -->    
    <!--<include href="include/jeuxDeValeurs/OBP-SNM_2022.01/JDV_ComplicationsAnesthesie_OBP-SNM.sch"/>--> 
    <!--<include href="include/jeuxDeValeurs/OBP-SNM_2022.01/JDV_EtatPerinee_OBP-SNM.sch"/>-->    
    <include href="include/jeuxDeValeurs/OBP-SNM_2022.01/JDV_MotifDeclenchementTravail_OBP-SNM.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SNM_2022.01/JDV_Acte_OBP-SNM.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SNM_2022.01/JDV_ModeDebutTravail_OBP-SNM.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SNM_2022.01/JDV_TypeActePostPartum_OBP-SNM.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SNM_2022.01/JDV_TypeAnesthesieApresNaissance_OBP-SNM.sch"/>    
    <include href="include/jeuxDeValeurs/OBP-SNM_2022.01/JDV_TypeAnesthesieAvantNaissance_OBP-SNM.sch"/>

    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <phase id="CI-SIS_OBP-SNM_2022.01">
        <active pattern="variables"/>
        <p>Vérification de la conformité au CI-SIS</p>
        
        <!-- Activation Entete-->
        <active pattern="Entete_OBP-SNM"/>        
        
        <!-- Activation JDV -->
        <!--<active pattern="JDV_ComplicationsAnesthesie_OBP-SNM"/>-->
        <!--<active pattern="JDV_EtatPerinee_OBP-SNM"/>-->
        <active pattern="JDV_MotifDeclenchementTravail_OBP-SNM"/>
        <active pattern="JDV_Acte_OBP-SNM"/>
        <active pattern="JDV_ModeDebutTravail_OBP-SNM"/>
        <active pattern="JDV_TypeActePostPartum_OBP-SNM"/>
        <active pattern="JDV_TypeAnesthesieApresNaissance_OBP-SNM"/>        
        <active pattern="JDV_TypeAnesthesieAvantNaissance_OBP-SNM"/>
        
    </phase>
    
    <pattern id="variables">

        <!-- chemins relatifs des fichiers jeux de valeurs -->
        <!--<let name="JDV_ComplicationsAnesthesie_OBP-SNM" value="'../jeuxDeValeurs/JDV_OBP_ComplicationsAnesthesie-CISIS.xml'"/>-->    
        <!--<let name="JDV_EtatPerinee_OBP-SNM" value="'../jeuxDeValeurs/JDV_EtatPerinee-CISIS.xml'"/>-->
        <let name="JDV_MotifDeclenchementTravail_OBP-SNM" value="'../jeuxDeValeurs/JDV_OBP_MotifDeclenchementTravail-CISIS.xml'"/>
        <let name="JDV_Acte_OBP-SNM" value="'../jeuxDeValeurs/JDV_OBP_Acte-CISIS.xml'"/>
        <let name="JDV_ModeDebutTravail_OBP-SNM" value="'../jeuxDeValeurs/JDV_OBP_ModeDebutTravail-CISIS.xml'"/>
        <let name="JDV_TypeActePostPartum_OBP-SNM" value="'../jeuxDeValeurs/JDV_OBP_TypeActePostPartum-CISIS.xml'"/>
        <let name="JDV_TypeAnesthesieApresNaissance_OBP-SNM" value="'../jeuxDeValeurs/JDV_OBP_TypeAnesthesieApresNaissance-CISIS.xml'"/>        
        <let name="JDV_TypeAnesthesieAvantNaissance_OBP-SNM" value="'../jeuxDeValeurs/JDV_OBP_TypeAnesthesieAvantNaissance-CISIS.xml'"/>
               
    </pattern>
</schema>
