# Aufgabenstellung

## Problem/Argumente

1. Es gibt spezifische OSes für spezifische Anwendungszenarien -> Die Formulierung ist "heavily tailored", aber da geh ich nicht ganz mit
2. Im Grunde geht es um safety vs speed und um Micro- vs Unikernel -> Gemeint ist security, nicht safety. Wir könnten mit Microkernels auch über Ausfallsicherheit sprechen aber das muss separat betrachtet werden (zB. ist es möglich mehrere Instanzen der OS services zu haben oder das Programm so zu bauen, dass Fehler in einer Komponente dazu führen dass die anderen sich trotzdem 'zivililsiert' verhalten, aber dann müssten wir bei der Compilierung so einen Fall-Back-Mechanismus auch implementieren. Das sehe ich gerade nicht.)
3. Aus der Perspektive der Programmierer ist Unikernel~Monolith~Shared Memory Access während Micro-kernel~ Model für verteilte Systeme ~ Dsitr. Memory + Inter Process Communication
4. Wichtiger Punkt an der Stelle ... Vielleicht brauchen wir eien andere Formulierung denn 'Microkernel' fokussiert eben auf den Kernel und 1. Haben wir mit der Implemntierung des Kernels nichts zu tun und 2. liegt auch dem Unikernel erstmal ein Microkernel zugrunde, der allerdings in der Compilierung mit seinen Services "verbacken" wird. 
5. Ohua zielt bislang darauf ab sequentielle, shared memory Programme zu parallelen Programmen zu kompileren die zumindest im Falle der Python Integration in unabhängigen Prozesssen ausgeführt werden. Anhand der grundliegenden Ähnlichkeiten der Programmiermodelle (unikernel <-> sequential+shared memory vs. microkernelservices<->parallel+ distr. memory) liegt es also nahe, Ohua Funktionsprinzip i.e. Isolation von unabhängigen Brechnugsschritten des Eingabeprogramms auf die Kompilierung von 'unikernel-tauglichen' Programmen zu 'microkernel-service' Programmen anzuwenden. 
6. Vorteil wäre, wie in der Ohua Argumentation üblich -> konkretes Deployment unabhängig(er) von der Applikationslogik, Testen/Typechecking/Schreiben/Verifizieren ohne Berücksichtigung des 'verteilte-systeme-rabbit-holes' möglich
7. Frage ist also: Geht das? Unter welchen Umständen? Welche Umformungen sind nötig? Was lernen wir über constraints des Programmiermodels? Was kann (theoretisch) durch den Compiler umgesetzt werden, was bleibt Aufgabe des Programmierers (Dazu: Viele Aspekte der 'Verteilung' sind Optimierungs- oder Designfragen bzw. können nicht statisch abgeleitet werden zB. Was sollten die Komponenten sein? Was sind geeignete Datentyoen für die Kommunikation? Error Handling/ Wie sollen Komponenten auf ausbleibende Nachrichten reagieren? ... )

## Aufgaben

1. Implement the cloud-unikernel using SmolTCP, a well-established networking library -> Also schlicht eine Beispielanwendung mit smoltcp, die Anfragen an einen Key-Value-Store handelt. Done
2. Rewrite the unikernel, such that Ohua can compile it 
3. Derive and implement transformations to make state usage local to a single program location to provide isolation.
4. Update existing M3 Backend 
5. Evaluate the approach in the (existing) setup of the YCSB key-value store benchmark along the performance-safety trade-off.

# Ziele für die Arbeit

## Must have

### 1. Coding

- [ ]  Beispielimplementierung zu Aufgabe 1.
- [ ]  Ohua Type Extraction & Propagation work for all regression tests
- [ ]  Beispielimplementierung compiliert mit Ohua
  - [ ] Input Code wird akzeptiert
  - [ ] Output Code ist valides Rust
  - [ ] Output Code läuft mit SharedMemory
  - [ ] Maybe move to Optional: Output läuft auf M3 simulation

### 2. Measuring/Running

- [ ] Möglichkeiten - Welche sind Zielstellung?:
  - [ ] Beispielanwendung: original vs. compilierbar, beide Linux
  - [ ] Beispielanwendung: original vs. state isolated, beide Linux
  - [ ] Beispielanwendung: original vs. compiliert für M3, beide auf M3 Simulation
  - [ ] Beispielanwendung: original vs. compilert für SharedMemory falls M3 nicht geht -> beide Linux  
- [ ] Test bauen - Möglichkeiten 
  - [ ] YSBC
  - [ ] Does it run on M3?
  - [ ] Implement database interface layer [doku](https://github.com/brianfrankcooper/YCSB/wiki/Adding-a-Database), [felix' version](https://github.com/Feliix42/YCSB/tree/master/ohua)
  - [ ] setup & run tests
  - [ ] Andere? 
- [ ] Beispielanwendung läuft auf M3
  - [ ] M3 Simulation läuft 
  - [ ] unsere M3 Abstraktion ist an den neuen Stand von M3 angepasst
  - [ ] wie Beispielanwendung läuft  in der Simulation unter Linux


### 3. Writing

- [ ] Background
  - [ ] Ohua - Funktion/Übersicht
  - [ ] smoltcp
  - [ ] Uni-/Microkernels
  - [ ] Rust im Hinblick auf Verteilte Systeme?
  - [ ] M3
- [ ] Benchmarks:
  - [ ] Describe YSBC (or used Alternative)
  - [ ] Describe scenarios and setup
  - [ ] Plot and explain results
  - [ ] Conclude performance impact
- [ ] Related Work - Literaturrecherche
  - [ ] compilers for microservices/micorkernels (maybe similar priciples)
  - [ ] distributed Rust
  - [ ] maybe automated distributing C++?/rust? anything?
- [ ] Implementierung beschreiben
  - [ ] discribe Implementation 'unikernel Version of Store appl.' 
  - [ ] discribe rewrites to structually fit programmign model/ fit Local States 
  - [ ] describe rewrites to handle unsupported Rust features
  - [ ] describe Ohua fixed/adaptations (Type Extraction, Type Propagation, SSA?)
  - [ ] describe "transformations/Patterns" we can abstract from rewrites -> can we automatise?
- [ ] Intro 
  - [ ] Setting -> Was ist der eigentliche Fokus hier? -> Verteilte Systeme einfacher bauen/verifizieren? -> Security einfacher bauen/verifizieren? Flexibilität?
  - [ ] Was ist das Problem
  - [ ] Wie passt Ohua da rein
  - [ ] Was haben wir also in dieser Arbeit gemacht und was ist dabai raus gekommen
- [ ] Conclusion: 
  - [ ] Summary
  - [ ] Comparison with previous state (Advances, Contributions, Learnings)
  - [ ] New Questions from here (problems are only thorny chances)
  - [ ] Outlook

## Optional

- [ ] Ohua Fixes
  -[ ] fix SSA to check for recursion before deciding the renaming strategy for let expressions
  -[ ] fix DFLang to have constructors for all control nodes
- [ ] Transformations from valid IR to isolation IR
  - [ ] at which representation level do we have to do this ?
  - [ ] is it general for all Programming languages ? 
  - [ ] implement


# Plan

## Grobe Zielsetzung -> Diese Jahr fertig werden

## Grobe Zeiteinteilung

1. Coding ca 4 Weeks -> 24 Nov.
2. Benchmarks+ Plotting ca 2,5 Weeks -> 10. Dec.
3. Arbeit fertig schreiben ~ 4 Week (including hollidays)-> End Dec./Start Jan.

## Details

| Task  | Subtask | Req. Time Estimate\|Taken | Status | Target Deadline |
| ------| --------| ------------- | ------ | ----------- |
| Implement k-v-store  | -  |  \|~ 2w | Done | - |
| Rewrite smoltcp  | switch to new version to get message passing solved |   \| ~ 2w| Done | |
|  |  | | |
|  |  | | |
|  |  | | |
|  |  | | |
| Fix Ohua | Type Extraction |   \| ~ 2w| Done | - |
|          | Type Propagation |    \| ~ 2w| Done | - |
|          | SSA for shaddowing |  - | defered | - |
|          | implement loop/while support |  - | defered | - |
|Extract Transf. Patterns| egress| | in Progress||
| | ingress|| in Progress||
| | merge loops ||open ||
| | others (types/traits/lifetimes/method -> fktn) ?  || in Progress ||
| Writing | Intro | 1d \|  | in Progress | |
|  | Background | 2-3d \| |in Progress (~ 50%)||
|  | Implementation | 4-5d \| |in Progress||
|  | Benchmarks (excl. plots) | 2d \|  | open ||
|  | Literature search/update | 3d | in Progress||
|  | Related work | 4d \| |~ 5%||
|  | Conclusion | 1d \| | open | |
| |Sum =|  ~ 19d + Proof Reading |
| Benchmark | Select BM scenario(s) | |||
|  | get Infrastructure up & running | |||
|  | run & record ||||
|  | plot |4 d| open | |