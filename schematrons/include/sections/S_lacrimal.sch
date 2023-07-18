<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ S_lacrimal.sch ]O@%#o>>=-
    
    - Teste la conformité de la section "Lacrimal" (1.3.6.1.4.1.19376.1.12.1.2.14) aux spécifications d'IHE PCC
    
    Historique :
    12/07/2023 : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_lacrimal">
    <title>IHE PCC Lacrimal Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.12.1.2.14"]'> 
        
        <!-- Verifier que le templateId est utilisé à bon escient --> 
        <assert test='../cda:section'> 
            [S_lacrimal.sch] Erreur de conformité PCC : Lacrimal ne peut être utilisé que dans une section. 
        </assert>
        
        <!-- Vérifier la présence de l'identifiant de la section -->
        <assert test='cda:id'>
            [S_lacrimal.sch] Erreur de conformité PCC : La section doit avoir un identifiant unique.
        </assert>
        
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "70945-1"]'> 
            [S_lacrimal.sch] Erreur de conformité PCC :  Le code de la section "Lacrimal" doit être 70945-1 
        </assert>
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [S_lacrimal.sch] Erreur de conformité PCC :  L'élément 'codeSystem' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert>
        
        <!-- Vérifie que les entrées sont de type ocular observation Entry -->
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.12.1.10.14"]'> 
            [S_lacrimal.sch] Erreur de conformité PCC : Lacrimal doit contenir des éléments Observation Entry.
        </assert>
        
    </rule> 
</pattern>

