<?xml version="1.0" encoding="utf-8"?>
<!-- 
    CI-SIS_CARD-F-PRC-PPV_2022.01.sch
    Vérification de la conformité sémantique au volet Patients à Risques de Cardiologie du CI-SIS.
     
    06/01/2023 : Nouvelle version 2023.01 : Création d'un schématron différent pour chaqu'un des volets CARD-F-PRC
-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_CARD-F-PRC-PPV_2022.01.sch">
    <title>Rapport de conformité du document aux spécifications du volet Fiches Patient à risque en cardiologie :Porteur d'un Stimulateur Cardiaque (CARD-F-PRC-PPV_2022.01)</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!-- Abstract patterns -->
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>   
    
    <!--Patterns d'entete spécifiques au volet-->
    <include href="include/specificationsVolets/CARD-F-PRC-PPV_2022.01/Entete/Entete_CARD-F-PRC-PPV.sch"/>
    
    <!-- Patterns d'entrées spécifiques au volet -->
    <include href="include/specificationsVolets/CARD-F-PRC-PPV_2022.01/Entrees/E_ProtheseValvulaireOrg-CARD-F-PRC-PPV.sch"/>
    
    <!--Patterns des JDVs spécifiques au volet-->
    <include href="include/jeuxDeValeurs/CARD-F-PRC-PPV_2022.01/JDV_UFCV_ProtValv-CARD-F-PRC-PPV.sch"/>
    <include href="include/jeuxDeValeurs/CARD-F-PRC-PPV_2022.01/JDV_UFCV_CodEntree-CARD-F-PRC-PPV.sch"/>
    <include href="include/jeuxDeValeurs/CARD-F-PRC-PPV_2022.01/JDV_UFCV_MatImpl_CARD-F-PRC-PPV.sch"/>
    <include href="include/jeuxDeValeurs/CARD-F-PRC-PPV_2022.01/JDV_UFCV_TypVal-CARD-F-PRC-PPV.sch"/>
    <include href="include/jeuxDeValeurs/CARD-F-PRC-PPV_2022.01/JDV_UFCV_CompProt_CARD-F-PRC-PPV.sch"/>
 
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <phase id="CI-SIS_F-PRC-PPV_2022.01">
        <!-- Entete-->
        <active pattern="Entete_CARD-F-PRC-PPV"/>
        
        <!-- Entrées -->
        <active pattern="E_ProtheseValvulaireOrg-CARD-F-PRC-PPV"/>
        
        <!-- JDVs -->
        <active pattern="JDV_UFCV_CodEntree-CARD-F-PRC-PPV"/>
        <active pattern="JDV_UFCV_ProtValv-CARD-F-PRC-PPV"/>
        <active pattern="JDV_UFCV_MatImpl_CARD-F-PRC-PPV"/>
        <active pattern="JDV_UFCV_TypVal_CARD-F-PRC-PPV"/>
        <active pattern="JDV_UFCV_CompProt_CARD-F-PRC-PPV"/>
        
    </phase>
    
    <pattern id="variables">
        <let name="jdv_UFCV_ProtValv-CARD-F-PRC-PPV" value="'../jeuxDeValeurs/JDV_UFCV_ProtValv-CISIS.xml'"/>
        <let name="jdv_UFCV_CodEntree-CARD-F-PRC-PPV" value="'../jeuxDeValeurs/JDV_UFCV_CodEntree-CISIS.xml'"/>
        <let name="jdv_UFCV_MatImpl_CARD-F-PRC-PPV" value="'../jeuxDeValeurs/JDV_UFCV_MatImpl-CISIS.xml'"/>
        <let name="jdv_UFCV_TypVal_CARD-F-PRC-PPV" value="'../jeuxDeValeurs/JDV_UFCV_TypVal-CISIS.xml'"/>
        <let name="jdv_UFCV_CompProt_CARD-F-PRC-PPV" value="'../jeuxDeValeurs/JDV_UFCV_CompProt-CISIS.xml'"/>
        
        <!-- présence des sections obligatoires -->        
        <rule context="cda:ClinicalDocument/cda:component/cda:structuredBody">            
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.132'])=1"> 
                [CARD-F-PRC-PPV] Erreur de conformité au modèle : La section "FR-Problemes-actifs" (1.2.250.1.213.1.1.2.132) doit être présente.
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.136'])=1"> 
                [CARD-F-PRC-PPV] Erreur de conformité au modèle : La section "FR-Historique-des-actes" (1.2.250.1.213.1.1.2.136) doit être présente.
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.1'])=1"> 
                [CARD-F-PRC-PPV] Erreur de conformité au modèle : La section "FR-Dispositifs-medicaux" (1.2.250.1.213.1.1.2.1) doit être présente.
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.107'])=1"> 
                [CARD-F-PRC-PPV] Erreur de conformité au modèle : La section "FR-Education-du-patient" (1.2.250.1.213.1.1.2.107) doit être présente.
            </assert>
        </rule>
    </pattern>
    
</schema>
