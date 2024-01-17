<?xml version="1.0" encoding="UTF-8"?>

<!-- E_statutDuDossier_ANS.sch 
    
    Teste la conformité d'une entrée utilisée dans le volet du CI-SIS aux spécifications de l'entrée 
    FR-Statut-du-dossier-presente-en-RCP (1.2.250.1.213.1.1.3.7)  
    
    Historique :
    04/01/2024 : SBM : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_statutDuDossier_ANS">
    
    <title>CI-SIS Statut du dossier</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.7"]'>
        
        <assert test='self::cda:organizer[@classCode="CLUSTER" and @moodCode="EVN"]'>
            [E_statutDuDossier_ANS] : Erreur de conformité CI-SIS : Une entrée "FR-Statut-du-dossier-presente-en-RCP" comporte obligatoirement un organizer avec les attributs @classCode="CLUSTER" et @moodCode="EVN".
        </assert>
        <assert test='count(cda:id)&lt;=1'>
            [E_statutDuDossier_ANS] : Erreur de conformité CI-SIS : Une entrée "FR-Statut-du-dossier-presente-en-RCP" comporte au maximum un seul identifiant "id" [0..1].
        </assert>
        <assert test="cda:templateId/@root='1.2.250.1.213.1.1.3.7'">
            [E_statutDuDossier_ANS] : Erreur de conformité CI-SIS : L'élément de templatId '1.2.250.1.213.1.1.3.7' doit être présent
        </assert>
      
        <assert test='cda:code/@code="GEN-099" and cda:code/@codeSystem="1.2.250.1.213.1.1.4.322"'>
            [E_statutDuDossier_ANS] Erreur de Conformité CI-SIS:
            L'élément 'code' doit être obligatoirement 'GEN-099' et l'élément codeSystem '1.2.250.1.213.1.1.4.322'.</assert>
        
        <assert test='cda:statusCode[@code = "completed"]'>
            [E_statutDuDossier_ANS] Erreur de conformité CI-SIS: L'élément "statusCode" sera présent et prendra la valeur "completed"</assert>
        
         </rule>
    
    <rule context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.7']//*[cda:templateId[@root='1.2.250.1.213.1.1.3.48']]">
        <assert test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'">
            [E_statutDuDossier_ANS] : Erreur de conformité CI-SIS : Dans l'entrée FR-Simple-Observation, l'élément de templatId '1.3.6.1.4.1.19376.1.5.3.1.4.13' doit être présent
        </assert>
        <assert test='count(cda:id)=1'>
            [E_statutDuDossier_ANS] : Erreur de conformité CI-SIS : L'entrée FR-Simple-Observation comporte obligatoirement un identifiant "id".
        </assert>
        <assert test='cda:code'>
            [E_statutDuDossier_ANS] Erreur de conformité CI-SIS: L'élément "code" doit être présent.</assert>
        <assert test='cda:text'>
            [E_statutDuDossier_ANS] Erreur de conformité CI-SIS: L'élément "text" doit être présent.</assert>
        <assert test='cda:text/cda:reference'>
            [E_statutDuDossier_ANS] Erreur de conformité CI-SIS: L'élément "text/reference" doit être présent.</assert>
        <assert test='cda:statusCode[@code = "completed"]'>
            [E_statutDuDossier_ANS] Erreur de conformité CI-SIS: L'élément "statusCode" sera présent et prendra la valeur "completed"</assert>
        
        <assert test='cda:effectiveTime'>
            [E_statutDuDossier_ANS] Erreur de conformité CI-SIS: L'élément "effectiveTime" doit être présent.</assert>
        <assert test='cda:value'>
            [E_statutDuDossier_ANS] Erreur de conformité CI-SIS: L'élément "value" doit être présent.</assert>
        
    </rule>
</pattern>
