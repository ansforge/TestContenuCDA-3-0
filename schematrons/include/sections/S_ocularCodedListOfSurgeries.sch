<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ S_ocularCodedListOfSurgeries.sch ]O@%#o>>=-
    
    - Teste la conformité de la section "Ocular Coded List of Surgeries" (1.3.6.1.4.1.19376.1.12.1.2.2)aux spécificationsIHE EYE CARE GEE
    
    Historique :
    11/07/2023 : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_ocularCodedListOfSurgeries">
    <title>IHE EYE CARE GEE - Ocular Coded List of Surgeries Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.12.1.2.2"]'> 
        
        <!-- Verifier que le templateId est utilisé à bon escient --> 
        <assert test='../cda:section'> 
            [S_ocularCodedListOfSurgeries.sch] Erreur de conformité PCC : Ocular Coded List of Surgeries ne peut être utilisé que dans une section. 
        </assert>
        
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "47519-4"]'> 
            [S_ocularCodedListOfSurgeries.sch] Erreur de conformité PCC :  Le code de la section Coded List of Surgeries doit être 47519-4 
        </assert>
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [S_ocularCodedListOfSurgeries.sch] Erreur de conformité PCC :  L'élément 'codeSystem' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert>
        
        <!-- Vérifier la présence de l'élément "titre" de la section -->
        <assert test='count(cda:title)=1'>
            [S_ocularCodedListOfSurgeries.sch] Erreur de conformité PCC : La section doit avoir un élément "title".
        </assert>
        
        <!-- Vérifier la présence de l'élément "text" de la section -->
        <assert test='count(cda:text)=1'>
            [S_ocularCodedListOfSurgeries.sch] Erreur de conformité PCC : La section doit avoir un élément text"".
        </assert>
        
    </rule> 
</pattern>

