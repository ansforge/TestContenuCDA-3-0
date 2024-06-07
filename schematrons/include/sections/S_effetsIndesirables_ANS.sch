<?xml version="1.0" encoding="UTF-8"?>

<!--  S_effetsIndesirables_ANS.sch
    
     Vérification de la conformité de la section FR-Effets-indesirables (1.2.250.1.213.1.1.2.247) créée par l'ANS
    
    Historique :
    06/06/2024 : HTR : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_effetsIndesirables_ANS">
    
    <title>Vérification de la conformité de la section FR-Effets-indesirables (1.2.250.1.213.1.1.2.247) créée par l'ANS</title>
    
    <rule context='*[cda:templateId/@root = "1.2.250.1.213.1.1.2.247"]'>
        
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test="../cda:section"> 
            [S_effetsIndesirables_ANS.sch] Erreur de conformité CI-SIS : Cet élément ne peut être utilisé que comme section.
        </assert>
        
        <assert test="count(cda:id)=1">
            [S_effetsIndesirables_ANS.sch] Erreur de conformité CI-SIS : La section doit contenir un élément 'id'.
        </assert>
        
        <assert test="cda:text">
            [S_effetsIndesirables_ANS.sch] Erreur de conformité CI-SIS : La section doit contenir un élément 'text'
        </assert>        
        
        <!-- Vérifier le code de la section -->
        <assert test='count(cda:code)=1 and cda:code/@code="44939-7" and cda:code/@codeSystem="2.16.840.1.113883.6.1"'>
            [E_graviteEffetIndesirable_ANS] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois et doit avoir l'attribut @code='44939-7' et
            le codeSystem='2.16.840.1.113883.6.1'.
        </assert>
        
        <!-- Vérification des entrées "FR-Effet-indesirable" -->
        <assert test=".//cda:templateId[@root='1.2.250.1.213.1.1.3.210']">
            [S_effetsIndesirables_ANS.sch] Erreur de conformité CI-SIS : Les entrées optionnelles autorisées sont FR-Effet-indesirable (1.2.250.1.213.1.1.3.210).    
        </assert>
        
    </rule>
    
</pattern>
