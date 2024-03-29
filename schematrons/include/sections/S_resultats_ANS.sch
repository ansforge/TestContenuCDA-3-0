<?xml version="1.0" encoding="UTF-8"?>

<!--  S_resultats_ANS.sch
    
     Vérification de la conformité de la section FR-Resultats (1.2.250.1.213.1.1.2.244) créée par l'ANS
    
    Historique :
    28/03/2024 : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_resultats_ANS">
    
    <title>Vérification de la conformité de la section FR-Resultats (1.2.250.1.213.1.1.2.244) créée par l'ANS</title>
    
    <rule context='*[cda:templateId/@root = "1.2.250.1.213.1.1.2.244"]'>
        
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test="../cda:section"> 
            [S_resultats_ANS.sch] Erreur de conformité CI-SIS : Cet élément ne peut être utilisé que comme section.
        </assert>
        
        <assert test="count(cda:id)=1">
            [S_resultats_ANS.sch] Erreur de conformité CI-SIS : La section doit contenir un élément 'id'.
        </assert>
        
        <assert test="cda:text">
            [S_resultats_ANS.sch] Erreur de conformité CI-SIS : La section doit contenir un élément 'text'
        </assert>        
        
        <!-- Vérifier le code de la section -->
        <assert test='cda:code[@code = "30954-2"]'>
            [S_resultats_ANS.sch] Erreur de conformité CI-SIS : Le 'code' de la section doit être '30954-2'.
        </assert>
        
        <!-- Vérification des entrées optionnelles -->
        <assert test="not(cda:entry) or cda:entry/cda:organizer/cda:templateId/@root='1.2.250.1.213.1.1.3.208'">
            [S_resultats_ANS.sch] Erreur de conformité CI-SIS : Les entrées optionnelles autorisées sont FR-Resultats (1.2.250.1.213.1.1.3.208).    
        </assert>
        
    </rule>
    
</pattern>
