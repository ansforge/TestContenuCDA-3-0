<?xml version="1.0" encoding="UTF-8"?>

<!--                  
   E_dispositifMedicalPrescrit.sch
    Teste la conformité du contenu des entrées dispositif medical prescrit( 2.16.840.1.113883.10.20.1.34 ) sépcifiées dans le volet eP-MED-DM
    
    Historique :
    01/09/2021 : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_dispositifMedicalPrescrit">
    
    <rule context="*[cda:templateId/@root='1.2.250.1.213.1.1.2.222']/cda:entry/cda:supply[cda:templateId/@root='2.16.840.1.113883.10.20.1.34']">
        
        <!-- [1..1] Entrée FR-En-rapport-avec-ALD -->
        <assert test="count(cda:entryRelationship/cda:observation/cda:templateId[@root='1.2.250.1.213.1.1.3.48.13'])=1">
            [E_dispositifMedicalPrescrit.sch] Erreur de conformité CI-SIS : l'entrée FR-En-rapport-avec-ALD (1.2.250.1.213.1.1.3.48.13) est obligatoire.
        </assert>
        <!-- [1..1] Entrée FR-En-rapport-avec-accident-travail -->
        <assert test="count(cda:entryRelationship/cda:observation/cda:templateId[@root='1.2.250.1.213.1.1.3.48.14'])=1">
            [E_dispositifMedicalPrescrit.sch] Erreur de conformité CI-SIS : l'entrée FR-En-rapport-avec-accident-travail (1.2.250.1.213.1.1.3.48.14) est obligatoire.
        </assert>
        <!-- [1..1] Entrée FR-Non-remboursable -->
        <assert test="count(cda:entryRelationship/cda:observation/cda:templateId[@root='1.2.250.1.213.1.1.3.48.15'])=1">
            [E_dispositifMedicalPrescrit.sch] Erreur de conformité CI-SIS : l'entrée FR-Non-remboursable (1.2.250.1.213.1.1.3.48.15) est obligatoire.
        </assert>
        <!-- [1..1] Entrée FR-En-rapport-avec-la-prevention -->
        <assert test="count(cda:entryRelationship/cda:observation/cda:templateId[@root='1.2.250.1.213.1.1.3.48.34'])=1">
            [E_dispositifMedicalPrescrit.sch] Erreur de conformité CI-SIS : l'entrée FR-En-rapport-avec-la-prevention (1.2.250.1.213.1.1.3.48.34) est obligatoire.
        </assert>
        
        
        <assert test="count(cda:repeatNumber)=1">
            [E_dispositifMedicalPrescrit.sch] Erreur de conformité CI-SIS : le nombre de renouvellement (repeatNumber) est obligatoire.
            L’absence de renouvellement est indiquée par la valeur "0" (zéro).
        </assert>
        
        <!--<assert test="cda:entryRelationship/cda:observation/cda:code[@code='MED-574' and @displayName='En rapport avec une ALD']">
            [E_dispositifMedicalPrescrit.sch] Erreur de conformité CI-SIS : un entryRelationship contenant une observation de code="MED-574" (En rapport avec une ALD) est obligatoire.
        </assert>
        
        <assert test="cda:entryRelationship/cda:observation/cda:code[@code='GEN-180' and @displayName='En rapport avec un accident du travail ou une maladie professionnelle']">
            [E_dispositifMedicalPrescrit.sch] Erreur de conformité CI-SIS : un entryRelationship contenant une observation de code="GEN-180" (En rapport avec un accident du travail ou une maladie professionnelle) est obligatoire.
        </assert>
        
        <assert test="cda:entryRelationship/cda:observation/cda:code[@code='GEN-295' and @displayName='En rapport avec la prevention']">
            [E_dispositifMedicalPrescrit.sch] Erreur de conformité CI-SIS : un entryRelationship contenant une observation de code="GEN-295" (En rapport avec la prevention) est obligatoire.
        </assert>
        
        <assert test="cda:entryRelationship/cda:observation/cda:code[@code='GEN-181' and @displayName='Non remboursable']">
            [E_dispositifMedicalPrescrit.sch] Erreur de conformité CI-SIS : un entryRelationship contenant une observation de code=="GEN-181" (Non remboursable) est obligatoire.
        </assert>-->
        
    </rule>
</pattern>