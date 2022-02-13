# Testnamen

Tests erfüllen verschiedene Bedürfnisse in der Software Entwicklung [3]. Eines dieser Bedürfnisse ist die Dokumentation des Codes und das Darstellen seiner Absicht. Für eine Dokumentation sollten Tests einfach und schnell verständlich sein [2]. Um dies zu erreichen sollten Test nicht nur im Hinblick auf deren Durchlaufen geschrieben werden, sondern vor allem hinsichtlich der Menschen die den Code versuchen zu verstehen. Aussagekräftige Testnamen sind hierbei essenziell, sie dienen als Überschriften für die Testmethoden und geben den ersten Hinweis auf dessen Inhalt.

Testnamen, die Anforderungen in der Domainsprache beschreiben, verbessern den Wert und die Qualität von Tests. Dieser Artikel beschreibt wie Testnamen gefunden werden, um den Wert und die Qualität von Tests zu verbessern.

## Den Wert von Tests verbessern

Tests sind wertvoll, da sie Domainwissen in den Code einbringen, eine lebende Dokumentation des Codes darstellen und Regression identifizieren.

Die Nutzung der Domänensprache im Code wo immer möglich führt zu einer stärkeren Angleichung des Codes an die Anforderungen. Testnamen sind eine der wenigen Stellen, an denen dem Code ganze Sätze hinzugefügt werden können. Werden hier Anforderungen prägnant formuliert, sind diese direkt im Code vorhanden und trotzdem lesbar. Dies ein großer Vorteil für die Dokumentation und Verständlichkeit des Codes.

*Nutze Domänensprache in Testnamen*

Tests können als lebende Dokumentation des Produktionscodes fungieren, denn sie testen den Code, zeigen durch rote oder grüne Tests welche Anforderungen der Code erfüllt und bieten damit einen Überblick über - im besten Falle - alle Anforderungen an den Code. Testnamen können hier als Speisekarte für die Fähigkeiten des Codes dienen.

*Beschreibe alle Anforderungen an das zu testende Objekt in jeweils einem prägnanten Satz in der Domänensprache, bevor du mit dem Schreiben der Tests beginnst. Nutze diese Sätze als Testnamen. Diese bilden eine solide Grundlage für die Implementierung der Tests. Dieses Vorgehen eignet sich besonders gut für Test-Driven Development.*

Fehlschlagende Tests identifizieren Regression des Codes schnell und ohne die Notwendigkeit aufwendigen Debuggings. Prägnante Testnamen helfen dem Entwickler den Fehler zu verstehen, ohne einen Blick in die Testmethode werfen zu müssen. Einfach lesbare Testnamen verbessern das schnelle Verständnis. `aShuffledDeckIsInRandomOrder` ist weniger gut lesbar als `a shuffled deck is in random order`.

*Wenn möglich, nutze Strings als Testnamen (z.B. in Javascript oder Kotlin). Alternativ bietet wahrscheinlich snake_case die beste Lesbarkeit.*

## Die Qualität von Tests verbessern

Nur qualitativ hochwertige Tests können die zuvor beschriebenen Werte leisten. Wichtige Qualitäten sind kurze und prägnante Testmethoden, sowie das Testen der Intention anstatt der Implementation des Codes.

Kurze Tests spezifischer Anforderungen sind nicht nur einfacher verständlich, sie helfen auch erheblich Regression zu identifizieren. Testnamen in der Domänensprache, die Anforderungen wiederspiegeln, führen zu kurzen und prägnanten Test, denn die spezifische Formulierung im Namen begrenzt den Testinhalt. Test mit Namen wie `testShuffling` oder `testShufflingIsCorrect` sind nicht sehr spezifisch und laden dazu ein, mehrere Anforderungen in einer Testmethode zu prüfen. Spezifischere Anforderungen könnten hier z.B. `a shuffled deck includes the same cards as the original deck` oder `a shuffled deck is in random order` sein. Das vorausgehende Spezifizieren von Testnamen grenzt die Aufgabe eines bestimmten Tests ein und resultiert in einem prägnanten Testinhalt.

*Nutze nicht das Wort 'test' im Testnamen, denn es führt meist zu überladenen Tests. Es kann stattdessen hilfreich sein, mit den Wörtern 'must' oder 'should' zu starten und den Satz mit dem zu testenden Element als implizites Subjekt zu vollenden, in dem die Anforderung beschrieben wird.*

Um sicherzustellen, dass der Code die Anforderungen genau erfüllt, sollten Tests die Intention des Codes testen und nicht nicht spezifische Implementation. Testnamen, die Anforderungen beschreiben ohne Implementationsdetails preiszugeben, führen zum Testen der Intention. Namensregeln für Tests wie `methodName_expectedResult_whenInput`, z.B. bei `shuffle_deckContainsValidDeck_validDeck` leaken Implementierungsdetails wie Methodennamen oder Rückgabewerte von Methoden. Diese Informationen sind unnötig, dublizieren den Inhalt der Testmethode und schlecht lesbar. Namen wie `a shuffled deck includes the same cards as the original deck` beschreibt die Anforderung genau, ohne Implementationsdetails zu beinhalten.

*Testnamen sollten Anforderungen an die zu testende Einheit beschreiben, keine Implementationsdetails beinhalten und keiner fixen Namensregel unterliegen. Füllwörter wie 'given', 'when' oder 'then' können hilfreich bei der Erstellung des Testnamens sein, führen aber oft zu schlechter lesbaren Namen.*

## Fazit

Zusammenfassen verbessern Testnamen, die Anforderungen prägnant in der Domänensprache beschreiben, den Wert und die Qualität der Tests. Sie führen zu einfachen, verständlichen Tests, bieten eine Dokumentation des Codes und seiner Intention, reichern den Code mit Domänenwissen und -sprache an, sowie identifieren Regression schnell. Daher fürhen sie zu einem effektiveren Software Entwicklungsprozess.

--

[1] Steve Freeman & Nat Pryce - Growing Object-Oriented Software, Guided by Tests

[2] Gerard Meszaros - “Write Tests for People” in 97 Things Every Programmer Should Know

[3] Sarah Mei - “Five Factor Testing” - https://madeintandem.com/blog/five-factor-testing/ 

[4] Kevlin Henney - Programming with GUTs - Build Stuff 2016 - https://youtu.be/azoucC_fwzw

[5] Vladimir Khorikov - You are naming your tests wrong! - https://enterprisecraftsmanship.com/posts/you-naming-tests-wrong/

[6] Tomek Kaczanowski - Bad Tests, Good Tests - https://leanpub.com/badtestsgoodtests
