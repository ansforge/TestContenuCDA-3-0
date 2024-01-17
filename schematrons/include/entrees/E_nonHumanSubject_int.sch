<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    E_nonHumanSubject_int.sch :
    Contenu :
        Contrôle d'un élément subject transportant un 'Non-Human Subject' dans un élément <Sujbect> selon template défini par le profil IHE-PALM 
    Paramètres d'appel :
        Néant
    Historique :
        28/12/2023 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_nonHumanSubject_int">
    <p>Contrôle d'un élément 'Non-Human Subject' dans un élément Sujbect</p>
    <rule context="*[cda:templateId/@root = '1.3.6.1.4.1.19376.1.3.3.1.2.1']">
        
        <!-- Verifier que le templateId est utilisé à bon escient -->        
        <assert test="../cda:subject[@typeCode='SBJ']"> 
            [E_nonHumanSubject_int] Erreur de Conformité IHE-PALM : 
            Le template du patient-avec-sujet-non-humain doit apparaître dans un élément subject
            de typeCode='SBJ'. </assert> 
        
        <!-- Vérifier la présence de l'élément relatedSubject et la cohérence de ses attributs --> 
        <assert test='cda:relatedSubject'> 
            [E_nonHumanSubject_int] Erreur de Conformité IHE-PALM : 
            Le patient-avec-sujet-non-humain doit avoir un élément relatedSubject. 
        </assert> 
        <assert test='cda:relatedSubject/cda:code'> 
            [E_nonHumanSubject_int] Erreur de Conformité IHE-PALM : 
            L'élément relatedSubject doit avoir le sous-élément 'code' pour indiquer le sujet (ex. poulet, poisson, œuf, salade, eau, terre, air, peinture, etc.)
        </assert> 
        
        <assert test='not(cda:relatedSubject/cda:code/cda:qualifer/cda:name) or (cda:relatedSubject/cda:code/cda:qualifer/cda:name[@code="105590001" and @codeSystemName="SNOMED CT"])'> 
            [E_nonHumanSubject_int] Erreur de Conformité IHE-PALM : 
            L'élément relatedSubject doit avoir le sous-élément 'code' pour indiquer le sujet avec les attributs fixé à  : @code="105590001" and @codeSystemName="SNOMED CT"
        </assert>
        <assert test='cda:relatedSubject/cda:Addr'> 
            [E_nonHumanSubject_int] Erreur de Conformité IHE-PALM : 
            L'élément relatedSubject doit avoir le sous-élément 'Addr' pour indiquer le lieu de provenance du sujet non humain
        </assert> 
    </rule>
</pattern>
