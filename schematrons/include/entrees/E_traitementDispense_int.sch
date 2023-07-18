<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    E_traitementDispense_int 
    Vérifie la conformité par rapport au profil Modèle de Contenus CDA de l'entrée IHE PHARM DIS - DispenseItemEntry 1.3.6.1.4.1.19376.1.9.1.3.4
    05/07/2023 : SBM : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_traitementDispense_int">
    <title>CI-SIS IHE PHARM DIS - DispenseItemEntry</title>
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.4']">
        <let name="count_product" value="count(cda:product)"/>
        <let name="count_id" value="count(cda:id)"/>
        <let name="count_text" value="count(cda:text)"/>
        <let name="count_quantity" value="count(cda:quantity)"/>
        <assert test="$count_id=1">
            [E_traitementDispense_int.sch] Errreur de conformité CI-SIS: L'élément supply doit contenir un élément id (cardinalité [1..1])
        </assert>
        <!-- Test des templateId pour l'entrée "IHE PHARM DIS - DispenseItemEntry" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.4'] and cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.7.3'] and cda:templateId[@root='2.16.840.1.113883.10.20.1.34']">
            
            [1] [E_traitementDispense_int.sch] Erreur de conformité CI-SIS : 
            L'entrée "IHE PHARM DIS - DispenseItemEntry" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' France dont l'attribut @root="1.3.6.1.4.1.19376.1.9.1.3.4"
            - Un deuxième 'templateId' IHE PCC dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.7.3"
            - Un troisième 'templateId' CCD dont l'attribut @root="2.16.840.1.113883.10.20.1.34"
        </assert>
        <assert test="$count_text=1">
            [E_traitementDispense_int.sch] Errreur de conformité CI-SIS: L'élément supply doit contenir un élément 'text' (cardinalité [1..1])
        </assert>
        <assert test="$count_quantity=1">
            [E_traitementDispense_int.sch] Errreur de conformité CI-SIS: L'élément supply doit contenir un élément 'quantity' au maximum (cardinalité [1..1])
        </assert>
        <assert test="$count_product=1">
            [E_traitementDispense_int.sch] Errreur de conformité CI-SIS: L'élément supply doit contenir élément 'product' (cardinalité [1..1])
        </assert>
    </rule>
</pattern>
