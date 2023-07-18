<?xml version="1.0" encoding="UTF-8"?>
<!--             
    
    E_isolatMicrobiologique_fr.sch :
    Contenu :
       Contrôle la conformité des éléments FR-Isolat-microbiologique conformément au volet Modèles de contenu CDA.
    Historique :
    04/07/2023 : HTR: Création 
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_isolatMicrobiologique_fr">
    <p>Contrôle d'un isolat microbiologie dans un élément organizer</p>
    <rule context="*[cda:templateId/@root ='1.2.250.1.213.1.1.3.79']">
        
        <!-- Test des templateId pour l'entrée "FR-Isolat-microbiologique" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.3.1.5']">
            [E_isolatMicrobiologique_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Isolat-microbiologique" doit avoir un 'templateId' avec l'attribut @root="1.3.6.1.4.1.19376.1.3.1.5"
        </assert>
        
        <!-- Verifier que le templateId est utilisé à bon escient -->        
        <assert test="../cda:organizer[@classCode = 'CLUSTER' and @moodCode = 'EVN']"> 
            [E_isolatMicrobiologique_fr.sch] Erreur de Conformité CI-SIS : 
            Le template d'image illustrative doit apparaître dans un élément organizer 
            de classCode 'CLUSTER' et de moodCode 'EVN'. </assert> 
        
        <!-- Vérifier la présence de l'élément statusCode et la cohérence de ses attributs --> 
        <assert test="cda:statusCode/@code='completed' or cda:statusCode/@code='active' or cda:statusCode/@code='aborted' ">
            [E_isolatMicrobiologique_fr.sch] Erreur de Conformité CI-SIS : Dans l'entrée FR-Isolat-microbiologique, le statusCode doit présent et fixé à la valeur @code='completed' ou  @code='active ou 'aborted'
            . </assert> 
        
        <!-- Vérifier la présence de l'élément specimen et la cohérence de ses attributs --> 
        <assert test="cda:specimen/cda:specimenRole">
            [E_isolatMicrobiologique_fr.sch] Erreur de Conformité CI-SIS : L'élément specimen doit contenir l'élément specimenRole
        </assert>
        <assert test="cda:specimen/cda:specimenRole/@classCode='SPEC'">
            [E_isolatMicrobiologique_fr.sch]Erreur de Conformité CI-SIS : L'élément specimenRole doit contenir l'attribut @classCode 'SPEC'
        </assert>
    </rule>
</pattern>
