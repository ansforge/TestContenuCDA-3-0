<!--  S_acuiteVisuelle.sch
    Vérification de la conformité de la section FR-Acuite-visuelle aux spécification IHE EYE CARE GEE (Visual Acuity)
    
    11/07/2023 : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_acuiteVisuelle">
    
    <title>Vérification de la conformité de la section 'FR-Acuite-visuelle' aux spécification IHE EYE CARE GEE (Visual Acuity)</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.12.1.2.7"]'>
        
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test='../cda:section'> 
            [S_acuiteVisuelle.sch] Erreur de conformité IHE Eye Care GEE : Ce template ne peut être utilisé que pour une section. 
        </assert>
        
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "70937-8"]'> 
            [S_acuiteVisuelle.sch] Erreur de conformité IHE Eye Care GEE : Le code de la section 'FR-Acuite-visuelle' doit être "70937-8".
        </assert> 
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [S_acuiteVisuelle.sch] Erreur de conformité IHE Eye Care GEE : L'élément 'codeSystem' de la section 'FR-Acuite-visuelle' 
            doit être codé à partir de la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert>
        
        <!-- entrée FR-Liste-des-mesures-acuite-visuelle -->
        <assert test='count(.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.12.1.3.2"]&gt;=1'>
            [S_acuiteVisuelle.sch] Erreur de conformité IHE Eye Care GEE : La section 'FR-Acuite-visuelle' doit contenir une entrée 'FR-Liste-des-mesures-acuite-visuelle'.
        </assert>
    </rule>
    
</pattern>