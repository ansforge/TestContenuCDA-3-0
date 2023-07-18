<?xml version="1.0" encoding="UTF-8"?>

<!-- Schématron Section Dispositif medical implante
    
   Teste la conformité de la section "Dispositif medical implante" (1.3.6.1.4.1.19376.1.5.3.1.1.9.48) aux spécifications d'IHE PCC
    
    
   Historique :
   17/07/2023 : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_visibleImplantedMedicalDevices">
    
    <title>IHE PCC -  Section Visible Implanted Medical Devices</title>
    
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.9.48']">
        
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test="../cda:section">
            [S_visibleImplantedMedicalDevices.sch] Erreur de Conformité IHE PCC : Cet élément ne peut être utilisé que comme section.
        </assert>
        
        <assert test="count(cda:id)=1">
            [S_visibleImplantedMedicalDevices.sch] Erreur de Conformité IHE PCC : La section doit contenir un id (cardinalité [1..1])
        </assert>
        
        <!-- Vérifier le code de la section -->
        <assert test='cda:code[@code = "XX-VisibleImplantedDevices"]'>
            [S_visibleImplantedMedicalDevices.sch] Erreur de Conformité IHE PCC : Le code de la section "Visible Implanted Medical Devices" doit être "XX-VisibleImplantedDevices"
        </assert>
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'>
            [S_visibleImplantedMedicalDevices.sch] Erreur de Conformité IHE PCC : L'élément 'codeSystem' correspond à la nomenclature LOINC (2.16.840.1.113883.6.1).
        </assert>
        
        <assert test="cda:text">
            [S_visibleImplantedMedicalDevices.sch] Erreur de Conformité IHE PCC : La section doit contenir un élément text
        </assert>
        
    </rule>
</pattern>
