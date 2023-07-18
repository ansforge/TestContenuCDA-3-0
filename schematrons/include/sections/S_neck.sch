<?xml version="1.0" encoding="UTF-8"?>


<!--  S_neck.sch
    
     Vérification de la conformité de la section : Neck Section(1.3.6.1.4.1.19376.1.5.3.1.1.9.24) aux spécifications d'IHE PCC
    
    Historique :
    11/07/2023 : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_neck">
    <title>IHE-PCC - Neck Section</title>
    
    <rule context='*[cda:templateId/@root = "1.3.6.1.4.1.19376.1.5.3.1.1.9.24"]'>
        
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test="../cda:section"> 
            [S_neck.sch] Erreur de conformité CI-SIS : Cet élément ne peut être utilisé que comme section.
        </assert>
        
        <!-- Vérifier le code de la section -->
        <assert test='cda:code[@code = "11411-6"]'>
            [S_neck.sch] Erreur de conformité CI-SIS : Le code de cette section doit être '11411-6'
        </assert>
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'>
            [S_neck.sch] Erreur de conformité CI-SIS : L'élément 'codeSystem' doit être codé à partir de la nomenclature LOINC (2.16.840.1.113883.6.1).
        </assert>
        
        <assert test="count(cda:text)=1">
            [S_neck.sch] Erreur de conformité CI-SIS : Cette section doit contenir un élément 'text'.
        </assert>
        
    </rule>
</pattern>
