<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    [E_nonHumanSubject_fr].sch :
    Contenu :
        Contrôle d'un élément subject transportant un 'Sujet-non-humain' dans un élément <Sujbect> selon les spécifications du CI-SIS.
    Paramètres d'appel :
        Néant
    Historique :
        28/12/2023 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_nonHumanSubject_fr">
    <p>Contrôle d'un élément FR-Sujet-non-humain dans un élément Sujbect</p>
    <rule context="*[cda:templateId/@root = '1.2.250.1.213.1.1.3.22']">
        <!-- Verifier la Conformité Non-Human Subject (IHE PALM) -->   
        <assert test='cda:templateId[@root="1.3.6.1.4.1.19376.1.3.3.1.2.1"]'>
            [E_nonHumanSubject_fr] Erreur de conformité CI-SIS : L'élément templateId fixé à @root="1.3.6.1.4.1.19376.1.3.3.1.3.1" est obligatoire
        </assert>
        <!-- Verifier que le templateId est utilisé à bon escient -->        
        <assert test="../cda:subject[@typeCode='SBJ']"> 
            [E_nonHumanSubject_fr] Erreur de Conformité CI-SIS : 
            Le template du patient-avec-sujet-non-humain doit apparaître dans un élément subject
            de typeCode='SBJ'. </assert> 
        
        <!-- Vérifier la présence de l'élément relatedSubject et la cohérence de ses attributs --> 
        <assert test='cda:relatedSubject'> 
            [E_nonHumanSubject_fr] Erreur de Conformité CI-SIS: 
            Le patient-avec-sujet-non-humain doit avoir un élément relatedSubject. 
        </assert> 
        <assert test='cda:relatedSubject/cda:code'> 
            [E_nonHumanSubject_fr] Erreur de Conformité CI-SIS : 
            L'élément relatedSubject doit avoir le sous-élément 'code' pour indiquer le sujet (ex. poulet, poisson, œuf, salade, eau, terre, air, peinture, etc.)
        </assert> 
        <assert test='not(cda:relatedSubject/cda:code/cda:qualifer/cda:name) or (cda:relatedSubject/cda:code/cda:qualifer/cda:name[@code="105590001" and @codeSystemName="SNOMED CT"])'> 
            [E_nonHumanSubject_fr]Erreur de Conformité CI-SIS : 
            L'élément relatedSubject doit avoir le sous-élément 'code' pour indiquer le sujet avec les attributs fixé à  : @code="105590001" and @codeSystemName="SNOMED CT"
        </assert>
        <assert test='cda:relatedSubject/cda:Addr'> 
            [E_nonHumanSubject_fr]Erreur de Conformité CI-SIS : 
            L'élément relatedSubject doit avoir le sous-élément 'Addr' pour indiquer le lieu de provenance du sujet non humain
        </assert> 
    </rule>
</pattern>
