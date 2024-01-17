<?xml version="1.0" encoding="UTF-8"?>
<!--             
    
    E_ActeBiologiePrescrit_ANS.sch :
    Contenu :
       Contrôle la conformité des éléments FR-Acte-biologie-prescrit conformément au volet Modèles de contenu CDA.
    Historique :
    11/07/2022 : Création  
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_ActeBiologiePrescrit_ANS">
    <title>Vérification de la conformité de l'entrée FR-Acte-biologie-prescrit(1.2.250.1.213.1.1.3.27.2) créée par l'ANS</title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.27.2"]'>
        
        <!-- Test des templateId pour l'entrée "FR-Acte-biologie-prescrit" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1'] and cda:templateId[@root='2.16.840.1.113883.10.20.1.25']">
            
            [1] [E_ActeBiologiePrescrit_ANS.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Acte-biologie-prescrit" doit comporter deux 'templateId' :
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1"
            - Un deuxième 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.25"
        </assert>
        
        <!-- Test des templateId pour l'entrée "FR-Acte-biologie-prescrit" -->
        <assert test="count(cda:templateId[@root='1.2.250.1.213.1.1.3.27']) &lt;2">
            [1] [E_ActeBiologiePrescrit_ANS.sch] Erreur de conformité CI-SIS : L'entrée "FR-Acte-biologie-prescrit" peut comporter [0..1] 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.27".
        </assert>
        
        <!-- Test des templateId pour l'entrée "FR-Acte-biologie-prescrit" -->
        <assert test="count(cda:templateId[@root='1.2.250.1.213.1.1.3.27.2']) &lt;2">
            [1] [E_ActeBiologiePrescrit_ANS.sch] Erreur de conformité CI-SIS : L'entrée "FR-Acte-biologie-prescrit" peut comporter [0..1] 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.27.2".
        </assert>
        
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="count(cda:code)=1">
            [E_ActeBiologiePrescrit_ANS.sch] Erreur de conformité CI-SIS : L'entrée "FR-Acte-biologie-prescrit" doit comporter un élément 'code'.
        </assert>
        
        <assert test="cda:effectiveTime[@nullFlavor='UNK']" > 
            [E_ObservationRequest_int] : Erreur de Conformité PCC: 
            Dans une entrée "FR-Acte-biologie-prescrit", l'élément "effectiveTime" est obligatoire et doit être fixée à nullFlavor="UNK".
         </assert>
        
        <assert test="count(cda:interpretationCode)&lt;2" > 
            [E_ObservationRequest_fr] : Erreur de Conformité CI-SIS: 
            Dans une entrée "FR-Acte-biologie-prescrit", l'élément "interpretationCode" peut être présent maximum une fois [0..1]. </assert>
        
        <assert test="count(cda:methodCode)&lt;2" > 
            [E_ObservationRequest_fr] : Erreur de Conformité CI-SIS: 
            Dans une entrée "FR-Acte-biologie-prescrit", l'élément "methodCode" peut être présent maximum une fois [0..1]. </assert>
        
        <assert test="count(cda:targetSiteCode)&lt;2" > 
            [E_ObservationRequest_fr] : Erreur de Conformité CI-SIS: 
            Dans une entrée "FR-Acte-biologie-prescrit", l'élément "targetSiteCode" peut être présent maximum une fois [0..1]. </assert>
        
        <assert test="not(cda:priorityCode) or cda:priorityCode[@code='UR']">
            [E_ActeBiologiePrescrit_ANS.sch] Erreur de conformité CI-SIS : Si l'élément priorityCode est renseigné au niveau d'un acte de biologie prescrit alors le code doit être "UR" 
        </assert>
        
        <assert test="not(cda:priorityCode) or cda:priorityCode/cda:originalText/cda:reference">
            [E_ActeBiologiePrescrit_ANS.sch] Erreur de conformité CI-SIS : Si l'élément priorityCode est renseigné au niveau d'un acte de biologie prescrit alors l'élément priorityCode/originalText/reference doit être renseigné.
        </assert>
        
        <assert test="count(cda:entryRelationship[@typeCode='COMP']/cda:procedure[cda:templateId/@root='1.2.250.1.213.1.1.3.77'])&gt;=1 and cda:entryRelationship/cda:procedure[cda:templateId/@root='1.2.250.1.213.1.1.3.77']/cda:participant/cda:participantRole/cda:playingEntity/cda:code">
            [E_ActeBiologiePrescrit_ANS.sch] Erreur de conformité CI-SIS : L'entrée FR-Prelevement doit être présente et doit avoir l'élément procedure/participant/participantRole/playingEntity/code afin de représenter la nature du prélèvement.
        </assert>
        
        <assert test="cda:entryRelationship[@typeCode='COMP']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48.14']">
            [E_ActeBiologiePrescrit_ANS.sch] Erreur de conformité CI-SIS : L'entrée FR-En-rapport-avec-accident-travail doit être présente et doit avoir l'élément templateId '1.2.250.1.213.1.1.3.48.14'.
        </assert>
        
        <assert test="cda:entryRelationship[@typeCode='COMP']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48.34']">
            [E_ActeBiologiePrescrit_ANS.sch] Erreur de conformité CI-SIS : L'entrée FR-En-rapport-avec-la-prevention doit être présente et doit avoir l'élément templateId '1.2.250.1.213.1.1.3.48.34'.
        </assert>
        
        <assert test="cda:entryRelationship[@typeCode='COMP']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48.15']">
            [E_ActeBiologiePrescrit_ANS.sch] Erreur de conformité CI-SIS : L'entrée FR-Non-remboursable doit être présente et doit avoir l'élément templateId '1.2.250.1.213.1.1.3.48.15'.
        </assert>
        
        <assert test="cda:entryRelationship[@typeCode='COMP']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48.33']">
            [E_ActeBiologiePrescrit_ANS.sch] Erreur de conformité CI-SIS : L'entrée FR-Hors-nomenclature doit être présente et doit avoir l'élément templateId '1.2.250.1.213.1.1.3.48.33'.
        </assert>
        
    </rule>
    
</pattern>