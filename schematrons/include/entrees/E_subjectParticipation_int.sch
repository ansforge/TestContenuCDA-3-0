<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    E_subjectParticipation_int.sch :
    Contenu :
        Contrôle d'un élément subject transportant un 'Subject Participation' 
        dans un élément <Sujbect> selon template défini par le profil IHE-PCC 
    Paramètres d'appel :
        Néant
    Historique :
        29/12/2023 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_subjectParticipation_int">
    <p>Contrôle d'un élément 'Subject Participation' dans un élément Sujbect</p>
    <rule context="*[cda:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.15.2']">
        
        <!-- Verifier que le templateId est utilisé à bon escient -->        
        <assert test="../cda:subject[@typeCode='SBJ']"> 
            [E_subjectParticipation_int] Erreur de Conformité IHE-PCC : 
            Le template du patient-avec-sujet-non-humain doit apparaître dans un élément subject
            de typeCode='SBJ'. </assert> 
        
        <!-- Vérifier la présence de l'élément relatedSubject et la cohérence de ses attributs --> 
        <assert test='cda:relatedSubject[@classCode="PRS"]'> 
            [E_subjectParticipation_int] Erreur de Conformité IHE-PCC : 
            L'ément FR-Sujet doit avoir un élément relatedSubject. 
        </assert> 
        <assert test='cda:relatedSubject/cda:code'> 
            [E_subjectParticipation_int]Erreur de Conformité IHE-PCC : 
            L'élément relatedSubject doit avoir le sous-élément 'code' pour indiquer le lien avec le patient.
        </assert> 
    </rule>
</pattern>
