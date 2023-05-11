<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    CI-SIS_AVC-PAVC_2.2_2022.01_2022.01.sch
    ANS
   
    ......................................................................................................................................................    
    Historique :
       05/10/17 : Création
       14/03/18 : MAJ du pattern variables
       10/09/2021 :  Modification du nom du schematron
                            
 -->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_AVC-PAVC_2.2_2022.01_2022.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_AVC-PAVC_2.2_2022.01_2022.01.sch">
    <title>Vérification de la conformité au modèle AVC-PAVC</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
     
    <!--=<<o#%@O[ Abstract patterns ]O@%#o>>=-->
    
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>   
    
    
    <!--=<<o#%@O[ JDV ]O@%#o>>=-->
    <include href="include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_Appareillage_AVC.sch"/>
    <include href="include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_Activite_AVC.sch"/>
    <include href="include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_GIR_AVC.sch"/>
    <include href="include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_TraitementPreventif_AVC.sch"/>
    <include href="include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_TraitementSuivi_AVC.sch"/>
    <include href="include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_Juridique_AVC.sch"/>
    <include href="include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_SeverityObservation_AVC.sch"/>
    
    <!--Entete-->
    <include href="include/specificationsVolets/AVC-PAVC_2.2_2022.01/Entete/Entete_AVC-PAVC.sch"/>
    
    
    <phase id="CI-SIS_AVC-PAVC_2.2_2022.01_2022.01">
        <active pattern="variables"/>
        <active pattern="JDV_Appareillage_AVC"/>
        <active pattern="JDV_Activite_AVC"/>
        <active pattern="JDV_GIR_AVC"/>
        <active pattern="JDV_Juridique_AVC"/>
        <active pattern="JDV_TraitementSuivi_AVC"/>
        <active pattern="JDV_TraitementPreventif_AVC"/>
        <active pattern="JDV_SeverityObservation_AVC"/>
        <active pattern="Entete_AVC-PAVC"/>
        
    </phase>
     
    <pattern id="variables">
        
        <let name="jdv_AVC_Appareillage" value="'../jeuxDeValeurs/JDV_Taille-CISIS.xml'"/>
        <let name="jdv_AVC_Activite" value="'../jeuxDeValeurs/JDV_Activite-CISIS.xml'"/> 
        <let name="jdv_AVC_GIR" value="'../jeuxDeValeurs/JDV_GIR-CISIS.xml'"/> 
        <let name="jdv_AVC_Juridique" value="'../jeuxDeValeurs/JDV_Juridique-CISIS.xml'"/> 
        <let name="jdv_AVC_TraitementPreventif" value="'../jeuxDeValeurs/JDV_TraitementPreventif-CISIS.xml'"/> 
        <let name="jdv_AVC_TraitementSuivi" value="'../jeuxDeValeurs/JDV_TraitementSuivi-CISIS.xml'"/> 
        <let name="jdv_AVC_Severite" value="'../jeuxDeValeurs/JDV_SeveriteObservation-CISIS.xml'"/>
        
   </pattern>      
     
    
</schema>

