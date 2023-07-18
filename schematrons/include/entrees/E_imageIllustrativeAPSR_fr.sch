<?xml version="1.0" encoding="UTF-8"?>
<!--             
    
    E_imageIllustrativeAPSR_fr.sch :
    Contenu :
       Contrôle la conformité des éléments E_imageIllustrativeAPSR_fr.sch conformément au volet Modèles de contenu CDA.
    Historique :
    04/07/2023 : Création  
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_imageIllustrativeAPSR_fr">
    <p>Contrôle d'une image illustrative dans un élément observationMedia</p>
    <rule context="*[cda:templateId/@root ='1.3.6.1.4.1.19376.1.8.1.4.10']">
        
        <!-- Test des templateId pour l'entrée "FR-Image-illustrative-APSR" -->
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.3.103.1']">
            [E_imageIllustrativeAPSR_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Image-illustrative-APSR" doit avoir un 'templateId' avec l'attribut @root="1.2.250.1.213.1.1.3.103.1"
        </assert>
        <assert test="cda:templateId[@root='2.16.840.1.113883.10.12.304']">
            [E_imageIllustrativeAPSR_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Image-illustrative-APSR" doit avoir un 'templateId' avec l'attribut @root="2.16.840.1.113883.10.12.304"
        </assert>
        
        <!-- Verifier que le templateId est utilisé à bon escient -->        
        <assert test="../cda:observationMedia[@classCode = 'OBS' and @moodCode = 'EVN' and @ID]"> 
            [E_imageIllustrativeAPSR_fr] Erreur de Conformité CI-SIS : 
            Le template d'image illustrative doit apparaître dans un élément observationMedia 
            de classCode 'OBS' et de moodCode 'EVN', et identifié par un attribut ID. </assert> 
        
        <!-- Vérifier la présence de l'élément value et la cohérence de ses attributs --> 
        <assert test="cda:value[(@mediaType = 'image/gif' or @mediaType = 'image/jpeg' or @mediaType = 'image/png') and @representation = 'B64']"> 
            [E_imageIllustrativeAPSR_fr] Erreur de Conformité CI-SIS : 
            L'image doit être un gif, un png ou un jpeg, encodé en base 64 dans le sous-élément value. </assert> 
        
        <!-- Vérifier la présence de l'élément specimen et la cohérence de ses attributs --> 
        <assert test="cda:specimen">
            [E_imageIllustrativeAPSR_fr] Erreur de Conformité CI-SIS :  L'élément "specimen" doit être présent.
             </assert> 
        <assert test="cda:specimenRole/@classCode='SPEC'">
            [E_imageIllustrativeAPSR_fr] Erreur de conformité APSR : L'élément specimenRole doit contenir l'attribut @classCode 'SPEC'
        </assert>
        <assert test="cda:specimenRole/cda:id">
            [E_imageIllustrativeAPSR_fr] Erreur de conformité APSR : L'élément id doit être présent dans specimenRole [1..1].
        </assert>
       
        
    </rule>
</pattern>
