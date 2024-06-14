<?xml version="1.0" encoding="UTF-8"?>


<!--  S_dispense.sch
    
     Vérification de la conformité de la section - Dispense (1.3.6.1.4.1.19376.1.9.1.2.3) aux spécifications d'IHE PHARM DIS
    
    Historique :
    11/07/2023 : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_dispense">
    <title>IHE PHARM DIS - Dispense Section </title>
    
    <rule context='*[cda:templateId/@root = "1.3.6.1.4.1.19376.1.9.1.2.3"]'>
        
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test="../cda:section"> 
            [S_dispense.sch] Erreur de conformité CI-SIS : Cet élément ne peut être utilisé que comme section.
        </assert>
        
        <assert test="count(cda:id)=1">
            [S_dispense.sch] Erreur de conformité CI-SIS : Cette section doit contenir un élément 'id'.
        </assert>
        
        <!-- Vérifier le code de la section -->
        <assert test='cda:code[@code = "60590-7"]'>
            [S_dispense.sch] Erreur de conformité CI-SIS : Le code de cette section doit être '60590-7'
        </assert>
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'>
            [S_dispense.sch] Erreur de conformité CI-SIS : L'élément 'codeSystem' doit être codé à partir de la nomenclature LOINC (2.16.840.1.113883.6.1).
        </assert>
        
        <assert test="count(cda:text)=1">
            [S_dispense.sch] Erreur de conformité CI-SIS : Cette section doit contenir un élément 'text'.
        </assert>
        
        <!-- Vérifier que l'entrée supply est présente -->
        <assert test='count(.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.9.1.3.4"])&gt;=1'>
            [S_dispense.sch] : La section Dispense
            doit contenir une entrée Dispense Item.
        </assert>
        
    </rule>
</pattern>
