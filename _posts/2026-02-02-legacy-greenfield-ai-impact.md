---
title: "Greenfield vs Legacy Projects: AI Changes the Tools, Not the Rules"
date: 2026-10-18 07:00:00
description: How AI tools change greenfield and legacy software work differently. Where they speed you up, where they add hidden debt, and how to use them on legacy code without breaking it.
categories: [ Software, Architecture ]
tags: [ job, architecture, ai ]
image:
  path: /assets/images/legacy-greenfield-img.png
published: true
---

## TL;DR

**Greenfield**: AI gives the biggest speed boost here, and it also produces technical debt fastest. Review harder than you think you need to.

**Legacy**: AI is most useful before you change anything. Use it to read, document, and write characterization tests. Then make small, verified changes.

**The rule that does not change**: AI does not replace understanding the system. It makes that understanding cheaper to get, and mistakes cheaper to make.

## Recap

In [part 1]({% post_url 2026-01-19-legacy-greenfield-unexpected-benefits %}) I argued that legacy projects are worth volunteering for. In [part 2]({% post_url 2026-01-31-legacy-greenfield-pain-is-temporary %}) I described how to climb out of the legacy pain cycle: remove dead code, improve observability, then refactor in small steps.

This post is about the newest variable in both paths: AI tools. The focus is on services written in Java or Kotlin, fairly modern but old or messy enough to hurt.

## AI in greenfield: speed with a debt meter

Greenfield work is where AI feels most magical. A working controller, DTOs, validation, and tests can appear in minutes. For structured, repetitive work, that is real.

The problem is that greenfield projects have no friction to stop bad decisions. Nothing is in production yet, so nothing breaks loudly. Generated code accumulates quietly: duplicated logic written three slightly different ways, abstractions nobody asked for, and tests that assert what the code does rather than what the business expects.

This is the CV-driven overengineering from part 1, now produced at machine speed. Treat the model as a fast junior developer. Review its output like any other pull request, and before accepting a design, ask what the simplest version would look like without it. If the answer is "a few functions and a table", the generated version is probably too big.

## AI in legacy: the map before the moves

Legacy work is where AI is most valuable, but only in the right order. The common mistake is asking for a refactoring before understanding the system. In a 200-500k line codebase with 50% test coverage, a confident-looking rewrite is a very effective way to break something nobody knew was connected.

The better order is: understand, protect, then change.

### Discovery: finding what nobody knows

This is where AI is strongest, and the part most people underuse. Reading a codebase you did not write is slow, and a model can scan it in minutes.

* **Mapping the unknown.** A consultancy team used LLMs across more than 40 repositories to map user journeys and visualize the architecture in days [[1]](#ref-1). A Spyro-soft project produced documentation, dependency graphs, and UML diagrams from a legacy codebase [[2]](#ref-2).
* **Building diagrams.** Models can draft sequence diagrams from call chains and dependency graphs between modules. Those drafts make it easier to spot the module nobody mentioned in the meeting. Check them anyway, because a diagram is a claim about the system.
* **Finding logic holes.** Ask the model to look for inconsistent validation, unreachable branches, statuses no code path sets, or exceptions that are caught and ignored. Each finding is a question to answer, not a verdict. Many will be the fences from Chesterton's Fence.
* **Spotting bugs.** In an industrial study at Tencent, hybrid LLM and static-analysis techniques eliminated 94-98% of false positives on 433 alarms while keeping high recall [[3]](#ref-3). Whole-project LLM scans still produce many false warnings [[4]](#ref-4). Expect noise; the value is in the candidates you verify.

### 1. Documentation as a draft

AI can read a module and draft its entry points, data flows, external calls, and visible business rules. That is a good start for a C4 diagram or an onboarding page. Treat it as a hypothesis: a model describes what the code says, not what happens in production. Check every claim against logs, traces, and a real request.

### 2. Characterization tests first

This is the most practical AI use I know in legacy work. Michael Feathers' idea from [Working Effectively with Legacy Code](https://www.oreilly.com/library/view/working-effectively-with/0131177052/) is to write tests that describe current behavior, whether or not it is correct. You are asking "what does it do today?", not "is this right?"

AI generates many input combinations quickly: boundary values, nulls, empty collections, unusual status codes. Keep the tests that describe real behavior. Research is heading the same way; UnitTenX uses a multi-agent setup to generate unit tests for legacy C code [[5]](#ref-5).

Be careful with the expected values. If the model derives them from the implementation, the test only confirms the code against itself. Where the value matters to the business, take it from a ticket, a production example, or a domain expert.

### 3. Small refactorings and Chesterton's Fence

With a safety net in place, AI is good at mechanical refactoring: renames, extracting methods, moving code between modules, replacing deprecated APIs. The tests catch its mistakes.

The danger is the weird code. A model has no access to the history behind a strange `if` statement. It sees dead-looking code and proposes to delete it, with a confident explanation that is really a guess. Before accepting a removal, check the file's history and related tickets, and ask the people who worked on the system. That "cleanup" may be the reason the system works.

### 4. Migrations and boundaries

AI can save weeks on migrations, translating patterns between APIs and listing replacements for deprecated calls. It is weaker at deciding boundaries, so combine it with the patterns from part 2: the **Anti-Corruption Layer** for translation code you write against a target model you define, the **Strangler Fig** to move one use case at a time with side-by-side comparison tests, and **Event Storming** with domain experts to decide which dependencies are business rules and which are accidents.

### Black box: when the code is an enigma

Sometimes the code is not a readable asset at all. The source is lost, written in a language nobody on the team knows, or the service is a vendor binary you can only call. Old mainframe batch jobs are a classic example, but the same situation shows up with a 15-year-old Java service whose real logic lives in stored procedures and cron scripts.

Here AI works better as a hypothesis generator than as a reader. Reported migrations of old mainframe code show LLMs can translate and summarize, but functional correctness was not verified in practice, and the results depended on heavy manual preparation and prompt engineering [[6]](#ref-6). Subject-matter experts still had to validate the output [[7]](#ref-7).

The approach I would take:

* **Observe before you guess.** Record real requests and responses, batch inputs and outputs, and the database changes they cause. Captured behavior beats any model's reading of the code.
* **Let AI propose rules, then check them with people.** Give the model examples and ask for the rule that explains them, plus open questions.
* **Use the old system as the oracle.** Turn recorded inputs and outputs into characterization tests for the new code, even if you cannot read the old one.
* **Replace one capability at a time.** Compare old and new results side by side, as in the Strangler Fig, before switching traffic.

The model can tell you that amounts above 500 need a second approval. It cannot tell you whether that number came from a regulator, a fraud case in 2014, or someone's guess that became policy. Git history and old tickets get you part of the way. The rest is in people's heads, and you have to ask for it.

## Where AI is limited, and where it still helps

Some decisions stay human. When an alert fires at night, the model can read logs quickly, but deciding whether to roll back, degrade a feature, or wait is yours. The model also does not know what the business intends; it knows what the code does, which may have been wrong for years.

Around those decisions, AI is useful for the non-technical side of legacy work:

* **Collecting data.** Pull incident history from tickets and logs, and find which component causes 30% of the incidents. That is the evidence a business case needs.
* **Showing value.** Turn raw numbers into a simple chart: the cost of incidents, hours lost per sprint, time to onboard.
* **Building arguments.** Ask the model to play a skeptical product owner and list their objections, then prepare answers.
* **Preparing for the conversation.** Summarize the context, draft questions for the person who remembers why a rule exists, and rehearse the pitch.

The negotiation, the trust, and the follow-up still happen between people. And verify every number the model gives you against source data before you show it. A confident figure that was never measured is the fastest way to lose the argument.

## Risks and rules of engagement

AI makes the easy part faster and moves the hard part elsewhere: into review, verification, and the decisions nobody wrote down. In Sonar's 2026 developer survey, 38% of respondents said reviewing AI-written code takes more effort than reviewing a colleague's code, and most do not fully trust what the tools produce [[8]](#ref-8).
Security deserves its own warning. Veracode tested over 100 models on 80 coding tasks and found a security flaw in 45% of the generated results. Java had the highest failure rate, above 70% [[9]](#ref-9). If you work on Java or Kotlin services, that is probably your language. Security checks belong in the pipeline, not in someone's memory.

Some habits I consider basic:

1. **Review generated code as if a careless stranger wrote it.** Fluent code is easy to trust. Check the error path, and check that the change uses the transaction, logging, and security patterns already in the codebase.
2. **Never accept a test generated from the implementation as proof of correctness.** It only proves the code agrees with itself. Check expected values against a ticket, a production example, or a spec written before the change.
3. **Keep changes small.** A model can produce a 2 000-line diff in a minute, and reviewing it takes far longer. Split the work into steps a reviewer can hold in their head.
4. **Know your data policy before you paste anything.** Legacy systems hide customer data in fixtures, log lines, and comments. Redact first, or use an approved option.
5. **Put guardrails in the pipeline.** Static analysis, dependency checks, coverage thresholds, and secret scanning should run on every change, whoever wrote it.
6. **Measure the effect, including review cost.** Track cycle time, change failure rate, incidents, and time spent in review. "It feels faster" is not enough, because review cost often lands on someone else.
7. **Protect the skills legacy work needs.** Keep some tasks manual on purpose: debugging a hard incident, tracing a flow through unfamiliar code, writing the first test for a module you do not understand.

## What changes for your career

If AI makes writing code cheaper, what becomes more valuable? A 2026 arXiv preprint describes junior developers swinging between over-reliance on AI and cautious avoidance of it [[10]](#ref-10). Entry-level hiring is the sharpest worry.

My working view, consistent with the series so far:

* **Judgment about what to build.** Choosing bounded-context boundaries, deciding what the business needs, and saying no to features that make the system harder to change.
* **Reading unfamiliar systems.** Understanding a large codebase with little documentation matters more, because AI output has to be checked against it.
* **Verification as a skill.** Designing tests that would catch a wrong answer, and knowing where models are weak. Cross-site scripting was among the weakest categories in Veracode's testing [[9]](#ref-9).
* **Operational skills and communication.** Observability, incident response, and explaining trade-offs to people who do not read code.

The pipeline matters too. Juniors who only receive generated code do not learn the codebase, and the seniors of the next decade come from them. If you lead a team, give people legacy work on purpose, and let some of it be done by hand.

Typing code quickly is becoming less of a differentiator. Knowing which code should exist, and how you would know it is wrong, is not.

## Conclusion

AI does not change the core difference between greenfield and legacy projects. Greenfield lets you design from scratch and learn when the design meets production. Legacy forces you to understand what already survived in production and to change it carefully.

What AI changes is the cost of each step. In greenfield, building gets faster, so poor decisions arrive sooner and in larger amounts. In legacy, reading and protecting code gets cheaper, but only if you resist rewriting before you understand.

So use AI to draft documentation, generate characterization tests, and propose small refactorings. Keep the judgment, the context, and the final decision yourself.

**The code you write today is tomorrow's legacy. Make it count.**

## References

### Books

- [Working Effectively with Legacy Code](https://www.oreilly.com/library/view/working-effectively-with/0131177052/) -
  Michael Feathers, 2004  
  Characterization tests and strategies for changing code safely without full test coverage.

- [Refactoring: Improving the Design of Existing Code](https://refactoring.com/) - Martin Fowler, 2018  
  Small, behavior-preserving steps.

- [Site Reliability Engineering: How Google Runs Production Systems](https://sre.google/books/) - Google, 2016  
  Production operations, incident management, and monitoring.

### Architectural Patterns

- [Anti-Corruption Layer Pattern](https://learn.microsoft.com/en-us/azure/architecture/patterns/anti-corruption-layer) -
  Microsoft Azure Architecture Center  
  Isolating legacy systems and preventing architectural contamination.

- [Strangler Fig Pattern](https://learn.microsoft.com/en-us/azure/architecture/patterns/strangler-fig) - Microsoft Azure
  Architecture Center  
  Incremental migration strategy for replacing legacy systems.

- [Chesterton's Fence: A Lesson in Second-Order Thinking](https://fs.blog/chestertons-fence/) - Farnam Street  
  Why you should not remove a component until you understand why it was built.

### Research and Case Studies

1. <a id="ref-1"></a>[AI-assisted discovery in legacy systems](https://www.equalexperts.com/blog/ai/ai-accelerated-discovery-legacy-systems/) - Equal Experts, 2025
2. <a id="ref-2"></a>[Transforming legacy code documentation with GenAI](https://spyro-soft.com/case/transforming-legacy-code-documentation-with-genai) - Spyro-soft
3. <a id="ref-3"></a>[Reducing False Positives in Static Bug Detection with LLMs: An Empirical Study in Industry](https://arxiv.org/html/2601.18844v1) - ICSE 2026
4. <a id="ref-4"></a>[LLM-based Vulnerability Detection at Project Scale: An Empirical Study](https://arxiv.org/html/2601.19239v1) - arXiv, 2026
5. <a id="ref-5"></a>[UnitTenX](https://arxiv.org/abs/2510.05441) - Charalambous, Coelho, Lamb, Cordeiro, arXiv, 2025
6. <a id="ref-6"></a>[GenAI-Driven Migration of Legacy COBOL Applications to Clean Java Code](https://publications.hnu.de/5973/) - Hochschule Neu-Ulm
7. <a id="ref-7"></a>[Mainframe reverse engineering using advanced LLM techniques](https://coforge.com/what-we-know/blog/mainframe-reverse-engineering-using-advanced-llm-techniques) - Coforge (vendor)
8. <a id="ref-8"></a>[State of Code Developer Survey Report 2026](https://www.sonarsource.com/blog/state-of-code-developer-survey-report-the-current-reality-of-ai-coding/) - Sonar (vendor)
9. <a id="ref-9"></a>[AI-Generated Code Poses Major Security Risks in Nearly Half of All Development Tasks](https://www.veracode.com/press-release/ai-generated-code-poses-major-security-risks-in-nearly-half-of-all-development-tasks-veracode-research-reveals/) - Veracode, 2025 (vendor)
10. <a id="ref-10"></a>[Who Will Become the Next Senior? How Generative AI Erodes the Development Pathway in Software Engineering](https://arxiv.org/pdf/2607.17067) - arXiv, 2026

### Methodologies and Practices

- [Event Storming](https://www.eventstorming.com/) - Alberto Brandolini  
  Collaborative workshop technique for exploring complex business domains.
