<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    CI-SIS_CANCER-PPS_2022.01.sch
    ......................................................................................................................................................
    Auteur : ANS
    Vérification de la conformité au modèle du document CANCER-PPS_2022.01
    ......................................................................................................................................................    
    03/09/2020 : Création
    22/02/2021 : Renommage
    07/04/2022:  Migration des terminologies et JDV en SNOMED-CT
    ......................................................................................................................................................    
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_CANCER-PPS_2022.01"
        xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_CANCER-PPS_2022.01.sch">
 
        <title>Vérification de la conformité du document au modèle CANCER-PPS_2022.01 du CI-SIS</title>
        <ns prefix="cda" uri="urn:hl7-org:v3"/>
        <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
        <ns prefix="jdv" uri="http://esante.gouv.fr"/>
        <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>

        <!--  Abstract patterns  -->
        <include href="abstract/dansJeuDeValeurs.sch"/>
        <include href="abstract/IVL_TS.sch"/>
        
        <!-- Entete -->
        <include href="include/specificationsVolets/CANCER-PPS_2022.01/Entete/Entete_Cancer-PPS.sch"/>
        
        <!--JDV-->
        <include href="include/jeuxDeValeurs/CANCER-PPS_2022.01/JDV_GestionEffetsSecondaires-CISIS.sch"/>
        <include href="include/jeuxDeValeurs/CANCER-PPS_2022.01/JDV_MesuresAssociees-CISIS.sch"/>
        <include href="include/jeuxDeValeurs/CANCER-PPS_2022.01/JDV_MotifMiseAJour-CISIS.sch"/>
        <include href="include/jeuxDeValeurs/CANCER-PPS_2022.01/JDV_SoinsOncoDeSupport-CISIS.sch"/>
        <include href="include/jeuxDeValeurs/CANCER-PPS_2022.01/JDV_TypeAccompagnementSocioPro-CISIS.sch"/>
        <include href="include/jeuxDeValeurs/CANCER-PPS_2022.01/JDV_TypeDeSuivi-CISIS.sch"/>
        <include href="include/jeuxDeValeurs/CANCER-PPS_2022.01/JDV_TypeTraitementPPS-CISIS.sch"/>
        
        <!-- ::::::::::::::::::::::::::::::::::::: -->
        <!--           Phase en vigueur            -->
        <!-- ::::::::::::::::::::::::::::::::::::: -->
        
        <phase id="CI-SIS_CANCER-PPS_2022.01">
                <active pattern="variables"/>
                <p>Vérification de la conformité au modèle du document CANCER-PPS du CI-SIS</p>
                
                <!-- Entete -->
                <active pattern="Entete_Cancer-PPS"/>

                <!-- JDV -->
                <active pattern="JDV_GestionEffetsSecondaires-CISIS"/>
                <active pattern="JDV_MesuresAssociees-CISIS"/>
                <active pattern="JDV_MotifMiseAJour-CISIS"/>
                <active pattern="JDV_SoinsOncoDeSupport-CISIS"/>
                <active pattern="JDV_TypeAccompagnementSocioPro-CISIS"/>
                <active pattern="JDV_TypeDeSuivi-CISIS"/>
                <active pattern="JDV_TypeTraitementPPS-CISIS"/>

        </phase>
        
        <!-- ::::::::::::::::::::::::::::::::::::: -->
        <!--           Variables globales          -->
        <!-- ::::::::::::::::::::::::::::::::::::: -->
        
        <pattern id="variables">
                
                <let name="JDV_GestionEffetsSecondaires-CISIS" value="'../jeuxDeValeurs/JDV_GestionEffetsSecondaires-CISIS.xml'"/>
                <let name="JDV_MesuresAssociees-CISIS" value="'../jeuxDeValeurs/JDV_MesuresAssociees-CISIS.xml'"/>
                <let name="JDV_MotifMiseAJour-CISIS" value="'../jeuxDeValeurs/JDV_MotifMiseAJour-CISIS.xml'"/>
                <let name="JDV_SoinsOncoDeSupport-CISIS" value="'../jeuxDeValeurs/JDV_SoinsOncoDeSupport-CISIS.xml'"/>
                <let name="JDV_TypeAccompagnementSocioPro-CISIS" value="'../jeuxDeValeurs/JDV_TypeAccompagnementSocioPro-CISIS.xml'"/>
                <let name="JDV_TypeDeSuivi-CISIS" value="'../jeuxDeValeurs/JDV_TypeDeSuivi-CISIS.xml'"/>
                <let name="JDV_TypeTraitementPPS-CISIS" value="'../jeuxDeValeurs/JDV_TypeTraitementPPS-CISIS.xml'"/>
                
        </pattern>
</schema>
