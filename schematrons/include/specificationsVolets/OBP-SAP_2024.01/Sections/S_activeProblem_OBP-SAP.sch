<?xml version="1.0" encoding="UTF-8"?>

<!-- S_activeProblem_OBP-SAP.sch
    
    Teste la conformité de la section FR-Problemes-actifs (1.2.250.1.213.1.1.2.132)
    aux spécifications d'IHE PCC v3.0 dans un document OBP-SAP    
    
    Historique :
    28/10/2013 : Création - OBP_activeProblemSectionEntries20131028.sch
    25/10/2017 : Renommage du schématron en S_activeProblem_OBP.sch
    24/10/2022 : version 2022.01
    11/05/2023 : Version 2023.01
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_activeProblem_OBP-SAP">

    <title>schématron S_activeProblem_OBP-SAP.sch</title>

    <rule context="*[cda:templateId/@root=&quot;1.3.6.1.4.1.19376.1.5.3.1.3.6&quot;]">

        <!--  Vérification de la présence des entrées obligatoires        -->

        <assert test=".//cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value/@code='O46'">
            [S_activeProblem_OBP-SAP] : La section FR-Problemes-actifs doit contenir une entrée FR-Probleme pour "Hémorragie précédant l'accouchement, non classée ailleurs"
        </assert>
        <assert test="//cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value/@code='O47.0'">
            [S_activeProblem_OBP-SAP] : La section FR-Problemes-actifs doit contenir une entrée FR-Probleme pour "Faux travail avant 37 semaines révolues de gestation"
        </assert>
        <assert test="//cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value/@code='O42'">
            [S_activeProblem_OBP-SAP] : La section FR-Problemes-actifs doit contenir une entrée FR-Probleme pour "Rupture prématurée des membranes"
        </assert>
        <assert test="//cda:act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value/@code='N39.0'">
            [S_activeProblem_OBP-SAP] : La section FR-Problemes-actifs doit contenir une entrée FR-Probleme pour "Infection des voies urinaires, siège non précisé"
        </assert>
        <assert test="//cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value/@code='O23'">
            [S_activeProblem_OBP-SAP] : La section FR-Problemes-actifs doit contenir une entrée FR-Probleme pour "Infections de l'appareil génito-urinaire au cours de la grossesse"
        </assert>
    </rule>
</pattern>
