<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ S_ocularListOfSurgeries.sch ]O@%#o>>=-
    
    - Teste la conformité de la section "Ocular List of Surgeries" (1.3.6.1.4.1.19376.1.12.1.2.1) aux spécifications IHE EYE CARE GEE
    
    
    Historique :
    11/07/2023 : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_ocularListOfSurgeries">
    <title>IHE EYE CARE GEE - Ocular List of Surgeries Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.12.1.2.1"]'> 
        
        <!-- Verifier que le templateId est utilisé à bon escient --> 
        <assert test='../cda:section'> 
            [S_ocularListOfSurgeries.sch] Erreur de conformité PCC : Ocular List of Surgeries ne peut être utilisé que dans une section. 
        </assert> 
        
        <!-- Vérifier la présence des templateId parents. -->
        <assert test="cda:templateId[@root='2.16.840.1.113883.10.20.22.2.7']"> 
            [S_ocularListOfSurgeries.sch] Erreur de conformité PCC : Le templateId parent de la section 'Ocular List of Surgeries' (2.16.840.1.113883.10.20.22.2.7) doit être présent
        </assert>
        
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "47519-4"]'> 
            [S_ocularListOfSurgeries.sch] Erreur de conformité PCC :  Le code de la section Ocular List of Surgeries doit être 47519-4 
        </assert> 
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [S_ocularListOfSurgeries.sch] Erreur de conformité PCC :  L'élément 'codeSystem' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert>
        
        <!-- Vérifier la présence de l'élément "titre" de la section -->
        <assert test='count(cda:title)=1'>
            [S_ocularListOfSurgeries.sch] Erreur de conformité PCC : La section doit avoir un élément "title".
        </assert>
        
        <!-- Vérifier la présence de l'élément "text" de la section -->
        <assert test='count(cda:text)=1'>
            [S_ocularListOfSurgeries.sch] Erreur de conformité PCC : La section doit avoir un élément text"".
        </assert>
        
    </rule>
</pattern>

