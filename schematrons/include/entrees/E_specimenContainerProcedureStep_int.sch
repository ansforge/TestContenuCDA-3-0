<?xml version="1.0" encoding="UTF-8"?>

<!--                   
     -=<<o#%@O[ E_specimenContainerProcedureStep.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée "E_specimenContainerProcedureStep_int" (1.3.6.1.4.1.19376.1.3.10.9.22)
    aux spécifications d'IHE PaLM Suppl.APSR 2.0 (Rev 2.1 – 2018-09-28)
    
    Historique :
    10/01/2024 : SBM : Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_specimenContainerProcedureStep_int">
    
    <title>Palm_Suppl_APSR V2.0 Specimen Container in Procedure Step Entry</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.3.10.9.22"]'>
        
        <let name="count_text" value="count(cda:text)"/>
        <let name="count_statusCode" value="count(cda:statusCode)"/>
        <let name="count_effectiveTime" value="count(cda:effectiveTime)"/>
        <let name="count_quantity" value="count(cda:quantity)"/>
        <let name="count_expectedUseTime" value="count(cda:expectedUseTime)"/>
        <let name="count_specimen" value="count(cda:specimen)"/>
        <let name="count_product" value="count(cda:product)"/>
        <let name="count_performer" value="count(cda:performer)"/>
        
        <assert test="self::cda:supply[@classCode='SPLY'] and self::cda:supply[@moodCode='EVN']">
            [E_specimenContainerProcedureStep_int.sch] Erreur de conformité APSR : L'élément "procedure" de l'entrée "Specimen Container in Procedure Step" doit avoir les attributs @classCode et @moodCode fixés respectivement aux valeurs suivante 'PROC' et 'EVN'
        </assert>
        
        <assert test='not(cda:code) or (cda:code/@code="74384-9" and cda:code/@codeSystem="2.16.840.1.113883.6.1")'>
            [E_specimenContainerProcedureStep_int.sch] Erreur de conformité APSR : L'entrée "Specimen Container in Procedure Step" peut contenir un élément "code"(cardinalité [0..1]) avec l'attribut @code="74384-9" .
        </assert>
        
        <assert test="$count_text &lt;=1">
            [E_specimenContainerProcedureStep_int.sch] Erreur de conformité APSR : L'élément "text" ne peut être présent qu'une seule fois (cardinalité [0..1])
        </assert>
        
        <assert test="$count_statusCode =1">
            [E_specimenContainerProcedureStep_int.sch] Erreur de conformité APSR : L'élément "statusCode" ne peut être présent qu'une seule fois (cardinalité [0..1])
        </assert>
        
        <assert test="$count_effectiveTime &lt;=1" >
            [E_specimenContainerProcedureStep_int.sch] Erreur de conformité APSR : L'élément "effectiveTime" ne peut être présent qu'une seule fois (cardinalité [0..1])
        </assert>
        
        <assert test="$count_quantity &lt;=1">
            [E_specimenContainerProcedureStep_int.sch] Erreur de conformité APSR : L'élément "quantity" ne peut être présent qu'une seule fois (cardinalité [0..1])
        </assert>
        
        <assert test="$count_expectedUseTime &lt;=1">
            [E_specimenContainerProcedureStep_int.sch] Erreur de conformité APSR : L'élément "expectedUseTime" ne peut être présent qu'une seule fois (cardinalité [0..1])
        </assert>
        
        <assert test="$count_specimen=0 or ($count_specimen=1 and cda:specimen[@typeCode='SPC']/cda:specimenRole[@classCode='SPEC'])">
            [E_specimenContainerProcedureStep_int.sch] Erreur de conformité APSR : Si l'élément "specimen" est présent, il doit avoir l'attribut @typeCode='SPC' et l'élément specimenRole dont l'attribut est @classCode='SPEC'.
        </assert>
        
        <assert test="$count_product =1">
            [E_specimenContainerProcedureStep_int.sch] Erreur de conformité APSR : L'élément "product" doit être présent une seule fois (cardinalité [1..1])
        </assert>
        
        <assert test="cda:product[@typeCode='PRD']">
            [E_specimenContainerProcedureStep_int.sch] Erreur de conformité APSR : L'élément "product" doit avoir l'attribut @typeCode='PRD'.
        </assert>
        
        <assert test="$count_performer &lt;=1">
            [E_specimenContainerProcedureStep_int.sch] Erreur de conformité APSR : L'élément "performer" ne peut pas présent qu'une seule fois (cardinalité [0..1]).
        </assert>
    </rule>
    
</pattern>
