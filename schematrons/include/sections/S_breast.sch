<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ S_breast.sch ]O@%#o>>=-
    
    - Teste la conformité de la section "Breast" (1.3.6.1.4.1.19376.1.5.3.1.1.9.28) aux spécifications d'IHE PCC
    
    
    Historique :
    12/07/2023 : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_breast">
    <title>IHE PCC Breast Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.28"]'> 
        
        <!-- Verifier que le templateId est utilisé à bon escient --> 
        <assert test='../cda:section'> 
            [S_breast.sch] Erreur de conformité PCC : Breast ne peut être utilisé que dans une section. 
        </assert> 
        
        <!-- Vérifier la présence de l'élément "id" de la section -->
        <assert test='count(cda:id)=1'>
            [S_breast.sch] Erreur de conformité PCC : La section "Breast" doit avoir un élément "id".
        </assert>
        
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "10193-1"]'> 
            [S_breast.sch] Erreur de conformité PCC :  Le code de la section "Breast" doit être "10193-1".
        </assert> 
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [S_breast.sch] Erreur de conformité PCC :  L'élément 'codeSystem' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert>
        
        <!-- Vérifier la présence de l'élément "text" de la section -->
        <assert test='count(cda:text)=1'>
            [S_breast.sch] Erreur de conformité PCC : La section doit avoir un élément text"".
        </assert>
        
    </rule>
</pattern>

