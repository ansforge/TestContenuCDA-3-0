<!-- S_testDeLaVision.sch
    Vérification de la conformité de la section FR-Test-de-la-vision aux spécification IHE EYE CARE GEE (Vision Testing)
   
    11/07/2023 : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_testDeLaVision">
    
    <title>Vérification de la conformité de la section FR-Test-de-la-vision aux spécification IHE EYE CARE GEE (Vision Testing)</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.12.1.2.8"]'>
        
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test='../cda:section'> 
            [S_testDeLaVision.sch] Erreur de conformité IHE Eye Care GEE : Ce template ne peut être utilisé que pour une section. 
        </assert>
        
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "70936-0"]'> 
            [S_testDeLaVision.sch] Erreur de conformité IHE Eye Care GEE : Le code de la section FR-Test-de-la-vision doit être "70936-0".
        </assert> 
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [S_testDeLaVision.sch] Erreur de conformité IHE Eye Care GEE : L'élément 'codeSystem' de la section FR-Test-de-la-vision 
            doit être codé à partir de la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert>
        
        <!-- Entrée FR-Observation-oculaire-test-de-la-vision -->
        <assert test='count(./cda:entry/cda:observation/cda:templateId[@root ="1.3.6.1.4.1.19376.1.12.1.3.1"])&gt;=1'>
            [S_testDeLaVision.sch] Erreur de conformité IHE Eye Care GEE : La section 'FR-Test-de-la-vision' doit avoir au minimum une entrée FR-Observation-oculaire-test-de-la-vision.
        </assert>
    </rule>
    
</pattern>