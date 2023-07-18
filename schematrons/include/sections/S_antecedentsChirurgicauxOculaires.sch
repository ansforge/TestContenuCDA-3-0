<!-- S_antecedentsChirurgicauxOculaires.sch
    Vérification de la conformité de la section FR-Antecedents-chirurgicaux-oculaires aux spécification IHE EYE CARE GEE (Ocular History )
   
    11/07/2022 : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_antecedentsChirurgicauxOculaires">
    
    <title>Vérification de la conformité de la section FR-Antecedents-chirurgicaux-oculaires aux spécification IHE EYE CARE GEE (Ocular History )</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.12.1.2.3"]'>
        
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test='../cda:section'> 
            [S_antecedentsChirurgicauxOculaires.sch] Erreur de conformité IHE Eye Care GEE : Ce template ne peut être utilisé que pour une section. 
        </assert>
        
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "70934-5"]'> 
            [S_antecedentsChirurgicauxOculaires.sch] Erreur de conformité IHE Eye Care GEE : Le code de la section FR-Antecedents-chirurgicaux-oculaires doit être "70939-4".
        </assert> 
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [S_antecedentsChirurgicauxOculaires.sch] Erreur de conformité IHE Eye Care GEE : L'élément 'codeSystem' de la section FR-Antecedents-chirurgicaux-oculaires 
            doit être codé à partir de la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert>
        
        <assert test='cda:title'>
            [S_antecedentsChirurgicauxOculaires.sch] Erreur de conformité IHE Eye Care GEE : La section FR-Antecedents-chirurgicaux-oculaires doit avoir un élément "title".
        </assert>
        <assert test='cda:text'>
            [S_antecedentsChirurgicauxOculaires.sch] Erreur de conformité IHE Eye Care GEE : La section FR-Antecedents-chirurgicaux-oculaires doit avoir un élément "text".
        </assert>
    </rule>
    
</pattern>