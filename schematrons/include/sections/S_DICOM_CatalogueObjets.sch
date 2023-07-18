<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
  S_DICOM_CatalogueObjets.sh
   Schématron de vérification de la conformité au modèle du CI-SIS de la sous section FR-DICOM-Object-Catalog(1.2.250.1.213.1.1.2.217)
   
   ......................................................................................................................................................    
    Historique :
    17/07/2023 : SBM : Création
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_DICOM_CatalogueObjets">
    <title>CI-SIS Section Catalogue d'objets DICOM</title>
    
    <rule context='*[cda:templateId/@root="2.16.840.1.113883.10.20.6.1.1"]'>
        
        <!-- Vérifier le templateId de la section 'FR-DICOM-Object-Catalog' -->
        <assert test="cda:templateId[@root='2.16.840.1.113883.10.20.6.1.1'] and cda:templateId[@root='1.2.250.1.213.1.1.2.217']">
            [S_DICOM_CatalogueObjets] Erreur de conformité : La section FR-DICOM-Object-Catalog (1.2.250.1.213.1.1.2.217) doit obligatoirement avoir les templateIds : "2.16.840.1.113883.10.20.6.1.1" et "1.2.250.1.213.1.1.2.217". 
        </assert>
        
        <!-- Vérifier l'identifiant de la section 'FR-DICOM-Object-Catalog' -->
        <assert test="count(cda:id)&gt;=1">
            [S_DICOM_CatalogueObjets] Erreur de conformité : une section FR-DICOM-Object-Catalog (1.2.250.1.213.1.1.2.217) doit obligatoirement contenir un ou plusieurs élément id.
        </assert>
        
        <!-- Vérifier le code de la section 'FR-DICOM-Object-Catalog' -->
        <assert test="cda:code[@code='121181' and @codeSystem='1.2.840.10008.2.16.4']">
            [S_DICOM_CatalogueObjets] Erreur de conformité: la section FR-DICOM-Object-Catalog (1.2.250.1.213.1.1.2.217) doit obligatoirement avoir comme code : @code='121181' et @codeSystem='1.2.840.10008.2.16.4'
        </assert>
        
        <!-- Vérifier le titre de la section 'FR-DICOM-Object-Catalog' -->
        <assert test="cda:title">
            [S_DICOM_CatalogueObjets] Erreur de conformité: la section FR-DICOM-Object-Catalog (1.2.250.1.213.1.1.2.217) doit obligatoirement contenir l'élément title
        </assert>
        
        <!-- Vérifier le texte de la section 'FR-DICOM-Object-Catalog' -->
        <assert test="cda:text">
            [S_DICOM_CatalogueObjets] Erreur de conformité: la section FR-DICOM-Object-Catalog (1.2.250.1.213.1.1.2.217) doit obligatoirement contenir l'élément texte
        </assert>
        
    </rule>
    
</pattern>