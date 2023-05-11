<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_AVC-EUNV_2.2_2022.01.sch
    ANS
   
    ......................................................................................................................................................    
    Historique :
       29/10/2013 : Création
       19/06/2015 : Maj des include telecom20110728.sch -> telecom20150317.sch
       14/03/2018 : MAJ du pattern variables
       10/09/2021 : Modification du nom du schematron
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_AVC-EUNV_2.2_2022.01.sch">
    <title>Vérification de la conformité au modèle AVC-EUNV_2.2_2022.04</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!--=<<o#%@O[ Abstract patterns ]O@%#o>>=-->
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>
    
    <!--JDV-->
    <include href="include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_ComplicationNeurologique-CISIS.sch"/>
   
    <!--Entete-->
    <include href="include/specificationsVolets/AVC-EUNV_2.2_2022.01/Entete/Entete_AVC-EUNV.sch"/>
    
    <phase id="CI-SIS_AVC-EUNV_2.2_2022.01">
        <active pattern="variables"/>
        <active pattern="JDV_ComplicationNeurologique-CISIS"/>
        <active pattern="Entete_AVC-EUNV"/>
    </phase>
    
       <!-- Variables globales -->
    <pattern id="variables">

        <!-- chemins relatifs des fichiers jeux de valeurs -->
        <let name="JDV_ComplicationNeurologique-CISIS" value="'../jeuxDeValeurs/JDV_ComplicationNeurologique-CISIS.xml'"/>
        
    </pattern>
</schema>
