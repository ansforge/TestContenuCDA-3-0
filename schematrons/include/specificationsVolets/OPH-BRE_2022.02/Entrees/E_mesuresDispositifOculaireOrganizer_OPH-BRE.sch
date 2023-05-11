<?xml version="1.0" encoding="UTF-8"?>

<!--                 
    E_mesuresDispositifOculaireOrganizer_OPH-BRE
   Teste la conformité de l'entrée FR-Liste-des-mesures-de-dispositifs-oculaires aux spécifications OPH-BRE du CI-SIS
   
   21/12/2022 : Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_mesuresDispositifOculaireOrganizer_OPH-BRE">
    <title>Vérification de la conformité de l'entrée FR-Liste-des-mesures-de-dispositifs-oculaires aux
        spécifications OPH-BRE du CI-SIS</title>
    <rule context="*[cda:templateId/@root = '1.3.6.1.4.1.19376.1.12.1.3.5' and (cda:code/@code='MED-1069' or cda:code/@code='28866-2')]/cda:component/cda:observation[cda:templateId/@root = '1.3.6.1.4.1.19376.1.12.1.3.9']">
        <assert test="./cda:targetSiteCode[@nullFlavor or @code ='57368009']">
            [E_mesuresDispositifOculaireOrganizer_OPH-BRE] Erreur de Conformité IHE EYE CARE (GEE) :
            l'élément "mesures de dispositifs oculaires Observation" doit contenir un élement targetSiteCode avec l'attribut @nullFlavor ou @code '57368009' 
        </assert>
    </rule>
    
    <rule context="*[cda:templateId/@root = '1.3.6.1.4.1.19376.1.12.1.3.5' and (cda:code/@code='28821-7' or cda:code/@code='28818-3' or cda:code/@code='MED-1067' or cda:code/@code='MED-1068')]/cda:component/cda:observation[cda:templateId/@root = '1.3.6.1.4.1.19376.1.12.1.3.9']">
        <assert test="./cda:targetSiteCode[@nullFlavor or @code ='421591000']"> 
            [E_mesuresDispositifOculaireOrganizer_OPH-BRE] Erreur de Conformité IHE EYE CARE (GEE) :
            l'élément "mesures de dispositifs oculaires Observation" doit contenir un élement targetSiteCode avec l'attribut @nullFlavor ou @code '421591000' 
        </assert>
        
    </rule>
</pattern>
