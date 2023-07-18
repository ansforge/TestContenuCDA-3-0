<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ S_pelvis.sch ]O@%#o>>=-
    
    - Teste la conformité de la section "Pelvis" (1.3.6.1.4.1.19376.1.5.3.1.1.21.2.10) aux spécifications d'IHE PCC 
    
    Historique :
    12/07/2023 : HTR : Création

-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_pelvis">
    <title>IHE PCC - Pelvis Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.21.2.10"]'> 
        
        <!-- Verifier que le templateId est utilisé à bon escient --> 
        <assert test='../cda:section'> 
            [S_pelvis.sch] Erreur de conformité PCC : "Pelvis" ne peut être utilisé que dans une section. 
        </assert>
        
        <!-- Vérifier la présence de l'identifiant de la section -->
        <assert test='count(cda:id)=1'>
            [S_pelvis.sch] Erreur de conformité PCC : La section doit avoir un identifiant unique.
        </assert>
        
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "10204-6"]'> 
            [S_pelvis.sch] Erreur de conformité PCC :  Le code de la section "Pelvis" doit être 10204-6 
        </assert>
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [S_pelvis.sch] Erreur de conformité PCC :  L'élément 'codeSystem' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert>
        
        <!-- Vérifier l'élément text de la section --> 
        <assert test='count(cda:text)=1'>
            [S_pelvis.sch] Erreur de conformité PCC : La section doit avoir un identifiant unique.
        </assert>
        
        
    </rule> 
</pattern>

