<?xml version="1.0" encoding="UTF-8"?>

<!--             
        S_PlanDeSoinsBiologie_ANS.sch :
        Contenu :
        Contrôle la conformité des éléments FR-Plan-de-soins-biologie conformément au volet Modèles de contenu CDA.
        Historique :
        11/07/2022 : Création  
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_PlanDeSoinsBiologie_ANS">
    <title>Vérification de la conformité de la section FR-Plan-de-soins-biologie(1.2.250.1.213.1.1.2.158.2) créée par l'ANS</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.158.2"]'>
        
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test="../cda:section"> 
            [S_PlanDeSoinsBiologie_ANS.sch] Erreur de conformité CI-SIS : Cet élément ne peut être utilisé que comme section.
        </assert> 
        
        <assert test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.3.36'">
            [S_PlanDeSoinsBiologie_ANS.sch] Déclarations de conformité au template IHE Coded Care Plan Section (1.3.6.1.4.1.19376.1.5.3.1.3.36)
        </assert>
        <assert test="cda:templateId/@root='2.16.840.1.113883.10.20.1.10'"> 
            [S_PlanDeSoinsBiologie_ANS.sch] Déclarations de conformité au template Plan of care section (2.16.840.1.113883.10.20.1.10)
        </assert>
        <assert test="cda:templateId/@root='1.2.250.1.213.1.1.2.158'"> 
            [S_PlanDeSoinsBiologie_ANS.sch] Déclarations de conformité au template FR-Plan-de-soins (1.2.250.1.213.1.1.2.158)
        </assert>
        
        <!-- Présence unique de l'entrée "FR-Acte-biologie-prescrit" -->
        <assert test="count(cda:entry/cda:observation/cda:templateId[@root='1.2.250.1.213.1.1.3.27.2']]) = count(cda:entry[//cda:templateId[@root]])">
            [S_PlanDeSoinsBiologie_ANS.sch] Erreur de conformité : La section "FR-Plan-de-soins-biologie" ne peut contenir que des entrées "FR-Acte-biologie-prescrit" (1.2.250.1.213.1.1.3.27.2).
        </assert>
        
        <!-- Présence obligatoire de l'entrée "FR-Acte-biologie-prescrit" ([1..*]) -->
        <assert test="cda:entry/cda:observation/cda:templateId[@root='1.2.250.1.213.1.1.3.27.2']">
            [S_PlanDeSoinsBiologie_ANS.sch] Erreur de conformité : La section
            "FR-Plan-de-soins-biologie" doit contenir au moins une entrée "FR-Acte-biologie-prescrit" (1.2.250.1.213.1.1.3.27.2).
        </assert>
    </rule>
</pattern>
