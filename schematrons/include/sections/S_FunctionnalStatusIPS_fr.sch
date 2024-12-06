<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ S_FunctionnalStatusIPS_fr.sch ]O@%#o>>=-
    
    Teste la conformité de la section "IPS Functionnal Status" (2.16.840.1.113883.10.22.3.8)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    08/04/2024 : SBM : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_FunctionnalStatusIPS_fr">
    <title>IHE PCC v3.0 Functionnal Status Section - errors validation phase</title>
    <rule context='*[cda:templateId/@root="2.16.840.1.113883.10.22.3.8"]'>
        
        <!-- Verifier que le templateId est utilisépour une section -->
        <assert test='../cda:section'> 
            [S_FunctionnalStatusIPS_fr] Erreur de Conformité PCC : Ce template ne peut être utilisé que comme section.
        </assert>
        
        <assert test="count(cda:templateId)&gt;1">
            [S_FunctionnalStatusIPS_fr] Erreur de Conformité PCC : un templateId au moins doit être présent pour cette section '2.16.840.1.113883.10.22.3.8'
        </assert>
        
        <assert test="count(cda:templateId/@root='2.16.840.1.113883.10.22.3.8')=1">
            [S_FunctionnalStatusIPS_fr] Erreur de Conformité PCC : le templateId '2.16.840.1.113883.10.22.3.8' doit être présent pour cette section.
        </assert>
        
        
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "47420-5"]'> 
            [S_FunctionnalStatusIPS_fr] Erreur de Conformité PCC : Le code de la section Functionnal Status doit être 47420-5
        </assert> 
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [S_FunctionnalStatusIPS_fr] Erreur de Conformité PCC : L'élément 'codeSystem' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert>
        
        <!--<!-\- Verifier que le templateId parent est présent. -\-> 
        <assert test='cda:templateId[@root="2.16.840.1.113883.10.20.1.5"]'> 
            [S_FunctionnalStatusIPS_fr] Erreur de Conformité PCC : L'identifiant du template de conformité CCD est absent. 
        </assert>-->
        
        <assert test='count(cda:entry/cda:organizer[cda:templateId/@root = "1.3.6.1.4.1.19376.1.5.3.1.1.12.3.7"])&gt;=0'> 
            [S_FunctionnalStatusIPS_fr] Erreur de Conformité PCC : L'élément 'codeSystem' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert>
    </rule>
</pattern>
