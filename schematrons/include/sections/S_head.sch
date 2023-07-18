<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ S_head.sch ]O@%#o>>=-
    
    - Teste la conformité de la section "Head" (1.3.6.1.4.1.19376.1.5.3.1.1.9.18) aux spécifications d'IHE PCC
    
    Historique :
    12/07/2023 : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_head">
    <title>IHE PCC Head Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.18"]'> 
        
        <!-- Verifier que le templateId est utilisé à bon escient --> 
        <assert test='../cda:section'> 
            [S_head.sch] Erreur de conformité PCC : Head ne peut être utilisé que dans une section. 
        </assert> 
        
        <!-- Vérifier la présence de l'élément "id" de la section -->
        <assert test='count(cda:id)=1'>
            [S_head.sch] Erreur de conformité PCC : La section "Head" doit avoir un élément "id".
        </assert>
        
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "10199-8"]'> 
            [S_head.sch] Erreur de conformité PCC :  Le code de la section "Head" doit être "10199-8".
        </assert> 
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [S_head.sch] Erreur de conformité PCC :  L'élément 'codeSystem' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert>
        
        <!-- Vérifier la présence de l'élément "text" de la section -->
        <assert test='count(cda:text)=1'>
            [S_head.sch] Erreur de conformité PCC : La section doit avoir un élément "text".
        </assert>
        
    </rule>
</pattern>

