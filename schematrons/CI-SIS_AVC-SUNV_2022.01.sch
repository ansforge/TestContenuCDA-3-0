<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    CI-SIS_AVC-SUNV_2.2_2022.01.sch
    ANS
   
    ......................................................................................................................................................    
    Historique :
       05/10/2017 : Création
       14/03/2018 : MAJ du pattern variables
       10/09/2021 : Modification du nom du schematron
       28/08/2023 : Migration des terminologies et JDV
                            
 -->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_AVC-SUNV_2.2_2022.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_AVC-SUNV_2.2_2022.01.sch">
    <title>Vérification de la conformité au modèle AVC-SUNV_2.2_2022.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
     
    <!--=<<o#%@O[ Abstract patterns ]O@%#o>>=-->
    
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>  
    
    <include href="include/jeuxDeValeurs/AVC-SUNV_2022.01/JDV_EtiologieInfarctus_AVC.sch"/>
    <include href="include/jeuxDeValeurs/AVC-SUNV_2022.01/JDV_EtiologieHemorragie_AVC.sch"/>
    <include href="include/jeuxDeValeurs/AVC-SUNV_2022.01/JDV_RaisonAbsenceEtiologie_AVC.sch"/>
    <include href="include/jeuxDeValeurs/AVC-SUNV_2022.01/JDV_AntecedantsMedicaux-CISIS.sch"/> 
    
    <!--Entete-->
    <include href="include/specificationsVolets/AVC-SUNV_2.2_2022.01/Entete/Entete_AVC-SUNV.sch"/>
    
    <phase id="CI-SIS_AVC-SUNV_2.2_2022.01">
        <active pattern="variables"/>
        <active pattern="JDV_EtiologieInfarctus_AVC"/>
        <active pattern="JDV_EtiologieHemorragie_AVC"/>
        <active pattern="JDV_RaisonAbsenceEtiologie_AVC"/>
        <active pattern="Entete_AVC-SUNV"/>
        <active pattern="JDV_AntecedantsMedicaux-CISIS"/>
    </phase>
    
     
    <pattern id="variables">
        
        <!-- chemins relatifs des fichiers jeux de valeurs -->
        <let name="jdv_AVC_EtiologieInfarctus" value="'../jeuxDeValeurs/JDV_EtiologieInfarctus_CISIS.xml'"/>
        <let name="jdv_AVC_EtiologieHemorragie" value="'../jeuxDeValeurs/JDV_EtiologieHemorragie_CISIS.xml'"/>
        <let name="jdv_AVC_RaisonAbsenceEtiologie" value="'../jeuxDeValeurs/JDV_RaisonAbsenceEtiologie_CISIS.xml'"/>
        <let name="JDV_AntecedantsMedicaux-CISIS" value="'../jeuxDeValeurs/JDV_AntecedantsMedicaux_CISIS.xml'"/>
        
    </pattern>
    
</schema>

