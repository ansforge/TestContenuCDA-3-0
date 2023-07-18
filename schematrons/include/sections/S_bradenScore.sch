<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ S_bradenScore.sch ]O@%#o>>=-

Teste la conformité de la section "Braden Score" (1.3.6.1.4.1.19376.1.5.3.1.1.12.2.3) aux spécifications d'IHE PCC

Historique :
11/07/2023 : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_bradenScore">
    
    <title>IHE PCC Braden Score Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.12.2.3"]'>
        
        <!-- Verifier que le templateId est utilisé pour une section --> 
        <assert test='../cda:section'> 
            [S_bradenScore.sch] Erreur de conformité PCC : le templateId de 'Braden Score Section' 
            ne peut être utilisé que pour une section.
        </assert>
        
        <assert test="count(cda:id)=1">
            [S_bradenScore] Erreur de conformité CI-SIS : Cette section doit contenir un élément 'id'.
        </assert>
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "38228-3"]'> 
            [S_bradenScore] : Le code de la section 'Braden Score' doit être '38228-3'.
        </assert>
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [S_bradenScore] : L'attribut 'codeSystem' de la section 'Braden Score' doit être codé dans la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert>
        
        <assert test="count(cda:text)=1">
            [S_bradenScore] Erreur de conformité CI-SIS : Cette section doit contenir un élément 'text'.
        </assert>
        
        <!-- Vérifier que l'entrée "Braden Score Section" est présente -->
        <assert test='count(.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.12.3.2"])&gt;1'>
            [S_bradenScore] : La section 'Braden Score Section'
            doit contenir au moins une entrée Braden Score Section.
        </assert>
        
    </rule>
</pattern>
