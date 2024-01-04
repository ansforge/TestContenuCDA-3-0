<?xml version="1.0" encoding="UTF-8"?>

<!--                 
    S_CodedDetailedPhysicalExamination_OPB-SEM.sch
    test la conformité de la section code detailed examination en fonction du volet obstétrique
    
    Historique :
    10/07/2017 : LBE : Création
    18/08/2023 : Nouvelle version
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_CodedDetailedPhysicalExamination_OPB-SEM">
    <title>IHE PCC Coded Detailed Physical Examination</title>

    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1"]'> 
      
        <assert test='not(cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.9.21"]) or cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.9.21"]/cda:code="10195-6" '> 
            [S_CodedDetailedPhysicalExamination_OPB-SEM.sch] : Cette section peut contenir une sous-section 'Systeme-auditif' si un dépistage autidif à été réalisé.
        </assert>
        <assert test='not(cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.9.16"])or cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.9.16"]/cda:code="10210-3"'> 
            [S_CodedDetailedPhysicalExamination_OPB-SEM.sch] : Cette section peut contenir une sous-section 'Etat général' si un autre dépistage a été réalisé.
        </assert>
    </rule>
    </pattern>