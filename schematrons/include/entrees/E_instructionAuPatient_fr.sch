<?xml version="1.0" encoding="UTF-8"?>

<!-- E_instructionAuPatient_fr
     ......................................................................................................................................................
     Vérification de la conformité de l'entrée FR-Instruction-au-patient(1.2.250.1.213.1.1.3.48.35) à IHE PCC.
     Cette entryRelationship est incluse dans l'entrée FR-Instructions-au-patient (1.2.250.1.213.1.1.3.33)
     ......................................................................................................................................................
     Historique :
     - 28/12/2023 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_instructionAuPatient_fr">
    <title>IHE PCC Entrée FR-Instruction-au-patient</title>         
    
    <!-- Test des templateId pour l'entrée "FR-Instruction-au-patient" -->
    <rule context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.48.35']">
        
        <let name="count_code" value="count(//cda:entryRelationship/cda:observation[cda:templateId[@root='1.2.250.1.213.1.1.3.48.35']]/cda:code[@code='PINSTRUCT'][@codeSystem='1.3.6.1.4.1.19376.1.5.3.2'])"/>
        <let name="count_text" value="count(//cda:entryRelationship/cda:observation[cda:templateId[@root='1.2.250.1.213.1.1.3.48.35']]/cda:text)"/>
        <let name="count_reference" value="count(//cda:entryRelationship/cda:observation[cda:templateId[@root='1.2.250.1.213.1.1.3.48.35']]/cda:text/cda:reference)"/>
        <let name="count_statusCode" value="count(//cda:entryRelationship/cda:observation[cda:templateId[@root='1.2.250.1.213.1.1.3.48.35']]/cda:statusCode[@code='completed'])"/>
        
        <let name="count_ER_InstructPatient" value="count(//self::cda:entryRelationship[cda:observation[cda:templateId[@root='1.2.250.1.213.1.1.3.48.35']]])"/>
        
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13']">
            [1][E_instructionAuPatient_fr.sch] Erreur de conformité IHE PCC : 
            L'entrée FR-Instruction-au-patient doit avoir le 'templateId' @root="1.3.6.1.4.1.19376.1.5.3.1.4.13"
        </assert>
        
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="($count_code=$count_ER_InstructPatient)">
            [2] [E_instructionAuPatient_fr.sch] Erreur de conformité IHE PCC : 
            L'entrée FR-Instruction-au-patient doit comporter un élément 'code' avec les attribut @code="PINSTRUCT" et @codeSystem="1.3.6.1.4.1.19376.1.5.3.2".
        </assert>            
        
        <!-- Test de la présence de l'élément 'text' -->
        <assert test="(($count_text=$count_ER_InstructPatient) and ($count_reference=$count_ER_InstructPatient))">
            [3] [E_instructionAuPatient_fr.sch] Erreur de conformité IHE PCC : 
            L'entrée FR-Instruction-au-patient doit comporter un élément 'text/reference'.
        </assert>    
        
        <!-- Test de la présence de l'élément 'statusCode' -->
        <assert test="($count_statusCode=$count_ER_InstructPatient)">
            [4] [E_instructionAuPatient_fr.sch] Erreur de conformité IHE PCC :  
            L'entrée FR-Instruction-au-patient doit comporter un élément 'statusCode' et son attribut @code="completed". 
        </assert>
        
    </rule>
    
</pattern>
