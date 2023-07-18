<?xml version="1.0" encoding="UTF-8"?>

<!--  S_DICOM-acteImagerie.sch
    
     Vérification de la conformité de la section FR-DICOM-Acte-imagerie (1.2.840.10008.9.3) aux spécifications DICOM
        
    Historique :
    17/07/2023 : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_DICOM-acteImagerie">
    <title>Vérification de la conformité de la section FR-DICOM-Acte-imagerie aux spécifications DICOM </title>
    
    <rule context='*[cda:templateId/@root = "1.2.840.10008.9.3"]'>
        
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test="../cda:section"> 
            [S_DICOM-acteImagerie.sch] Erreur de conformité CI-SIS : Cet élément ne peut être utilisé que comme section.
        </assert>
        
        <assert test="cda:id">
            [S_DICOM-acteImagerie.sch] Erreur de conformité CI-SIS : La section Références externes doit contenir un élément "id".
        </assert>
        
        <assert test='cda:code[@code = "55111-9"]'>
            [S_DICOM-acteImagerie.sch] Erreur de conformité CI-SIS : Le code de cette section doit être "55111-9"
        </assert>
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [S_DICOM-acteImagerie.sch] Erreur de conformité CI-SIS : Le code de la section doit être un code LOINC  
            system (2.16.840.1.113883.6.1). 
        </assert>
        <assert test="cda:title">
            [S_DICOM-acteImagerie.sch] Erreur de conformité CI-SIS : La section Références externes doit contenir un élément "title".
        </assert>
        <assert test="cda:text">
            [S_DICOM-acteImagerie.sch] Erreur de conformité CI-SIS : La section Références externes doit contenir un élément "text".
        </assert>
        <!-- Vérifier que la section contient l'entrée "FR-DICOM-Technique-imagerie"  -->
        <assert test='.//cda:procedure/cda:templateId[@root = "1.2.840.10008.9.14"]'> 
            [S_DICOM-acteImagerie.sch] Erreur de conformité CI-SIS : FR-DICOM-Technique-imagerie (1.2.840.10008.9.14) est obligatoirement présente dans cette section.
        </assert>
        
        <!-- Vérifier que la section contient la sous-section "FR-DICOM-Object-Catalog"  -->
        <assert test='.//cda:section/cda:templateId[@root = "2.16.840.1.113883.10.20.6.1.1"]'> 
            [S_DICOM-acteImagerie.sch] Erreur de conformité CI-SIS : FR-DICOM-Object-Catalog (2.16.840.1.113883.10.20.6.1.1) est obligatoirement présente dans cette section.
        </assert> 
    </rule>
    
</pattern>
