<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ S_nose.sch ]O@%#o>>=-
    
    - Teste la conformité de la section "Nose" (1.3.6.1.4.1.19376.1.5.3.1.1.9.22) aux spécifications d'IHE PCC
    
    Historique :
    11/07/2023 : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_nose">
    <title>IHE PCC Nose Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.22"]'> 
        
        <!-- Verifier que le templateId est utilisé à bon escient --> 
        <assert test='../cda:section'> 
            [S_nose.sch] Erreur de conformité PCC : "Nose" ne peut être utilisé que dans une section. 
        </assert> 
        
        <!-- Vérifier la présence de l'élément "id" de la section -->
        <assert test='count(cda:id)=1'>
            [S_nose.sch] Erreur de conformité PCC : La section "Nose" doit avoir un élément "id".
        </assert>
        
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "10203-8"]'> 
            [S_nose.sch] Erreur de conformité PCC :  Le code de la section "Nose" doit être "10203-8".
        </assert> 
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [S_nose.sch] Erreur de conformité PCC :  L'élément 'codeSystem' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert>
        
        <!-- Vérifier la présence de l'élément "text" de la section -->
        <assert test='count(cda:text)=1'>
            [S_nose.sch] Erreur de conformité PCC : La section doit avoir un élément "text".
        </assert>
        
    </rule>
</pattern>

