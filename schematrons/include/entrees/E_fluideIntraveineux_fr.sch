<?xml version="1.0" encoding="UTF-8"?>
<!--  E_fluideIntraveineux_fr.sch
    
      Vérification de la conformité de l'entrée FR-Fluide-intraveineux (1.2.250.1.213.1.1.3.26) créée par l'ANS
    
    Historique : 
   03/07/2023 : ANS :  Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_fluideIntraveineux_fr">
    <title>Vérification de la conformité de l'entrée FR-Fluide-intraveineux (1.2.250.1.213.1.1.3.26) créée par l'ANS</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.26"]'>
        
        <assert
            test="self::cda:substanceAdministration[@classCode='SBADM' and (@moodCode='EVN' or @moodCode='INT')]">
            [E_fluideIntraveineux_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fluide-intraveineux, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'SBADM', 'EVN' ou 'INT' </assert>
        
        <assert test='count(cda:id)=1'>
            [E_fluideIntraveineux_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fluide-intraveineux, il doit y avoir un élément id (cardinalité [1..1])
        </assert>
        <assert test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.13.3.2' and cda:templateId/@root='2.16.840.1.113883.10.20.1.24' and cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.7'
            and cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.7.1'">
            [E_fluideIntraveineux_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fluide-intraveineux, il doit y avoir les templateIds suivants :
            - 1.3.6.1.4.1.19376.1.5.3.1.1.13.3.2
            - 2.16.840.1.113883.10.20.1.24
            - 1.3.6.1.4.1.19376.1.5.3.1.4.7
            - 1.3.6.1.4.1.19376.1.5.3.1.4.7.1
        </assert>
        
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="count(cda:code)=1">
            [E_fluideIntraveineux_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Fluide-intraveineux" doit comporter un élément 'code'
        </assert> 
        <assert test="cda:statusCode/@code='completed' or cda:statusCode/@code='active'">
            [E_fluideIntraveineux_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fluide-intraveineux, le statusCode doit présent et fixé à la valeur @code='completed' ou  @code='active'
        </assert>
        <assert test="cda:effectiveTime[not(@operator='A')]">
            [E_fluideIntraveineux_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fluide-intraveineux, un élément effectiveTime doit être présent 
        </assert>
        <assert test="count(cda:effectiveTime[@operator='A'])&lt;=1">
            [E_fluideIntraveineux_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fluide-intraveineux, un élément effectiveTime avec @operator='A' peut être présen.t une seule fois [0..1]
        </assert>
        <assert test="count(cda:consumable)=1">
            [E_fluideIntraveineux_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fluide-intraveineux, il doit y avoir un élément consumable (cardinalité [1..1])
        </assert>
    </rule>
    
</pattern>