---
title: "Greenfield vs Legacy Projects: AI Tools changes everything"
date: 2026-03-02 13:00:00 +/-0200
description: Greenfield vs legacy software projects. Learn when to suffer, how to refactor effectively, and why alternating between both makes you a better engineer. Includes AI tools guide.
categories: [ Software, Architecture ]
tags: [ job, architecture ]
image: /assets/images/legacy-greenfield-img.png
---

## TL;DR

**Greenfield**: Fun at first, painful when hitting production. You learn modern practices but miss constraint-driven
creativity.

**Legacy**: Painful at first, rewarding when you start improving it. You develop rare skills and deep system
understanding.

**Best approach**: Alternate between both throughout your career. Use AI tools to accelerate both. Focus on continuous
improvement, not perfection.

## Motivation

Recently I have realized that during my career I constantly switched from legacy into greenfield projects and vice
versa. Each time I was facing different challenges and opportunities. Somewhere during my 5th year of experience I
thought that only greenfield projects are worth doing, as they allow you to use the latest technologies and best
practices but was I right? After reflecting on my experiences more deeply, I observed that IT projects like these are
forgiving. On the other hand, legacy projects are those which people don't want to touch because of challenges.
Looking closer, they have some unique benefits which are not obvious at first glance. I have decided to write down my
thoughts on the differences between these two types of projects, the pros and cons of each, and how to navigate them
effectively.

### Scenario 1 - Greenfield

You are starting a new greenfield project. You have the freedom to choose your modern tech stack, architecture, and
design patterns from scratch. This allows you to implement best practices and modern technologies without being
constrained by legacy systems. A domain expert is working closely with the team. And one very important thing, the
system is not on production yet!

### Scenario 2 - Legacy

You are joining a legacy project that has been running for several years. The codebase is large and complex written by
people who are now directors or no longer exist, technology stack is outdated. There is no single domain expert knowing
all features and assumptions. System is handling tons of users every day.

## Technology stack

#### Greenfield project

In greenfield projects, you can choose the latest technologies and frameworks that best suit your needs. There are a few
architectural drivers to consider, such as company technology stack, team skill set, industry direction, performance,
and
maintainability. Of course, you can also play a bit with CV-driven development, which can be sometimes beneficial for
people but also can lead to overengineering.

#### Legacy project

In legacy projects, you are often limited to the existing technology stack. Upgrading or changing technologies is nearly
impossible, but it opens other opportunities like gaining unique skills. You don't believe? Try to find
engineers who are able to migrate production application from VertX (VertX is a reactive application framework) 3 to
VertX 4 and later to Spring Boot in system which is around 200-500k LoC. At the same time there is plenty of other
outdated libraries and frameworks which you need to deal with. What if company needs engineers who are able to maintain
both technologies? Some time ago I was checking job offers and I found out that such skills were among the requirements!
Isn't it interesting?

## Discover what is going on

In greenfield projects, you have the opportunity to define clear requirements and design the system from a user
perspective from the beginning. You've got a domain expert, no existing features, flows can be designed from scratch.
There are brilliant means to achieve it like [Event Storming sessions](https://www.eventstorming.com/), user story
mapping, and prototyping. All conclusions can be visualized in [C4 models](https://c4model.com/).

In legacy projects, understanding the existing system can be challenging. The documentation may be outdated or
missing, and the codebase may be complex and difficult to navigate. You may need to spend significant time reverse
engineering the system to understand its architecture, design patterns, and business logic. Talking to long-term team
members (if they still exist) and domain experts can be invaluable in this process. Also, having good monitoring and
logging in place can help you understand how the system behaves in production. But what if there is no one who knows the
system well? In such cases you need to rely on tests (if they exist) and code analysis tools to get better
understanding.
Probably monitoring is a mess, there are plenty of production incidents and no one knows why they are happening. Welcome
to
the real legacy world!

## Where are boundaries of bounded contexts?

New projects give you the chance to define clear bounded contexts from the start. You can work closely with domain
experts to identify the different subdomains and their boundaries. This allows you to design the system in a way that
aligns with the business needs and promotes maintainability. You can use techniques like domain-driven design (DDD) to
help identify and define bounded contexts.
Unfortunately, business will change requirements on this stage of project very often. As long as you used clean
architectural design, codebase is small and engineers are eager to make things the right way you are safe. Each such
change is quite easy to implement, database schema can be dropped and created from scratch. You are free to experiment
and find the best solution. The situation will change when production data will appear in your system.

In legacy projects, bounded contexts may not be clearly defined or may have evolved over time, I'm pretty sure that
there are a lot of domain leaks. Here and there, there are hacks or 'hotfixes' which were done to quickly solve problems
but ended up violating the boundaries. You may need to spend significant time analyzing the codebase and talking to
team members to identify and understand. If you are lucky there are tests, corresponding JIRA tickets or some doc which
help you figure out the reasons behind such changes. Refactoring the system to better align with bounded contexts can be
a
complex and time-consuming process, especially when they require data migrations.

## When do you want to suffer?

One of the most unexpected things in greenfield projects is that you will suffer a lot when system goes to production.
After a few quite smooth months you will face real production issues, bugs, and performance problems. System is growing
up, features are coming, and you are no longer in safe space. It's time to deal with real users. You are adding new
feature, smooth review, merge, deploy to production and... boom. Something is broken, users are complaining, but you
have no clue why. Welcome to real world of software development! Now it's time to work harder on monitoring, logging,
and alerting. Some dashboards are not showing new path, logs are missing important traces. Time to fix it all, but what
if you don't have expertise in such things?

No worries, you will learn it very fast. There are three excellent books which can help you to move
forward. [Site Reliability Engineering by Google](https://sre.google/books/) is an outstanding starting point. You can
find
there comprehensive guidelines how to structure production support, incident management, and monitoring.

You are joining a legacy project. First month is like being in big labyrinth, probably without any map. No knowledge
of where the deployment units are, databases, what metrics and alerts mean. After that time you have fallacious feeling
that you are starting to understand the system, and you are ready for effective work in it. But wait, there is always a
catch.
You took first business task, starting to work on it and suddenly BOOOM. Where to start, there are a few working
features
around, codebase is a mess, tests coverage is around 50%. You are lost again. Welcome to legacy world! That's the place
where you need to put your ego in your pocket and start asking for help. Talk to people, read code, set up pair
programming
session.
When merge request is ready, ask for feedback from seasoned team members. Probably you will fix some things and you are
ready to go. Merge, deploy to test environment, first tests and... it's not working as expected. Oh no, what happened?
New feature is not working, some other features are broken. Time to investigate logs, metrics, and traces. After a few
hours you are able to figure out that there is some hidden dependency between modules which was not obvious at all. Fix
it,
test again, and finally you are able to deliver value to users. Congratulations, you survived first task in legacy
system!

Do you think your problems are over? No way! Next task is waiting for you. Repeat the same cycle again and again until
you figure out that...

## Refactoring is the key

I've got a few thoughts about team morale in the cycle which I visualized in the diagram below. It's just my
opinion—your observations may differ.

The diagram illustrates the emotional journey in both project types. Notice how greenfield excitement peaks early but
drops at production, while legacy pain peaks initially but improves as you gain mastery and implement improvements.

![Pain diagram](/assets/images/legacy-greenfield-pain-progress.png)

Let's look at working on the system from a different angle. What if work is not about adding only new features but
making things better overall. Happy users make the business happy, a happy business puts less pressure on engineers.
Engineers
gain trust and space for improvement so freedom and capacity have appeared.
That's the point where work is not about fixing bugs or adding new features only, but about change.

Let's start from the beginning. When a new greenfield project is starting, the team is excited about new technology,
architecture,
no legacy codebase and delivering new experience for users. On the other hand there are things to do which are boring
like
setting up new service, gluing all frameworks, configuring CI/CD pipelines, adding monitoring, logging and alerting. If
you are lucky, most of the things are automated by DevOps team or there are some templates which can be used out of the
box. After that phase, the team is able to focus on delivering new features till system goes to production. After that
moment, things are changing. Users are using the system, reporting bugs, engineers are woken up during night because
unexpected things happen or alerting setup needs some tweaks. After a while project is stable but from other hand it is
becoming more and more complex. That means work is no longer so exciting as before.

On the opposite site of spectrum, joining a legacy project is like hitting the wall. Luckily I've got some insights
how instead of breaking it you can jump over it. How do you jump over that wall instead of breaking against it? The
answer lies in two phases: cleaning and redesign. Let's start with the cleaning phase, which provides quick wins and
builds momentum.

### Cleaning phase

#### 1. Remove dead code!

1. Use your IDE to find unused (gray) code.
2. Ask team members about dead code paths, unused features or endpoints.
3. Check imported dependencies, are they really needed?
4. Use IDE or AI agent to look for unreachable statements.

This is a very important step and relatively easy to execute. It will improve experience with working for all
engineers. Other benefits are less obvious:

* There is less code to read and maintain.
* IDE indexing and code navigation are faster.
* The production package is smaller.
* CI/CD pipelines run faster.
* Application startup is faster.
* You may see some memory savings and GC behavior improvements.
* JIT (if you are in JVM world) will have less code to optimize.

#### 2. Improve logging and monitoring!

Before diving into architectural changes, you need visibility into what's actually happening in your system. Legacy
systems often suffer from poor observability - logs that tell you nothing useful, metrics that don't align with business
flows, and alerts that wake you up for false alarms.

Start by auditing your current observability setup:

**Structured Logging**: Are your logs machine-readable with consistent formats (JSON is ideal), or are they free-form
text that requires regex gymnastics to parse? Each log entry should include essential context like request IDs, user
IDs, and timestamps. Replace meaningless messages like "Error in process" with meaningful ones like "Failed to process
payment for order 12345: insufficient funds".

**Business Metrics**: Your monitoring should reflect what actually matters to users and the business. Track key flows
like user registration completion rates, payment processing success rates, or API response times for critical endpoints.
Don't just monitor CPU and memory - those are symptoms, not causes. When something breaks, you want to know "checkout is
failing for 30% of users" not "pod memory is at 85%".

**Actionable Alerts**: Review your alert rules. Can you take immediate action when an alert fires, or does it just
create noise? Alerts should be tied to real user impact and include enough context to begin troubleshooting. If your
team is ignoring alerts or treating them as background noise, that's a sign they need refinement.

**Distributed Tracing**: In modern systems, a single user request often touches dozens of services. Can you follow a
request from entry point to database and back? Tools like OpenTelemetry make it possible to trace requests end-to-end,
identifying bottlenecks and failures across service boundaries.

**Incident Tracking**: Are you learning from failures? Track incidents in a structured way - categorize them by type,
measure time to resolution, and conduct blameless post-mortems. Patterns will emerge showing which parts of the system
need the most attention.

Good observability isn't just about fixing problems faster - it builds confidence. When you can see what your system is
doing, refactoring becomes less scary. You'll know immediately if a change breaks something, and you'll have the data to
prove improvements are working.

Once you've cleaned up the obvious issues and established better observability, you're ready to tackle deeper
architectural problems. The redesign phase requires more effort and patience, but it's where the real transformation
happens.

### Redesign phase

This phase is about improving architecture and design of the system. It will take more time and effort but will bring a
lot of value. Think about it as refactoring code, but at a higher architectural level.. Unfortunately, there is no
silver bullet
here, it will be many cycles, each will be probably painful, each will require testing and validation, you will feel
that there is no light in the tunnel. But trust me, there is one!
There are two main design patterns which can help you to improve system
architecture: [ACL (Anti-Corruption Layer)](https://learn.microsoft.com/en-us/azure/architecture/patterns/anti-corruption-layer)
and [Strangler Fig Pattern](https://learn.microsoft.com/en-us/azure/architecture/patterns/strangler-fig). Both are well
described in literature, but I am leaving links here.

#### 1. Discover and refactor supporting domains

There's a good chance your system has some supporting domains which are not core to the business but are necessary for
operation. Examples include authentication, audit, logging, and notification services. You can start by extracting such
domains into separate modules. This brings multiple benefits:

* Reused across the whole application
* Easier to maintain and test
* Smaller, more focused business domains

#### 2. Improve bounded contexts

Here real refactoring work is starting. You need to identify bounded contexts in the system, understand their
boundaries, and how they interact with each other. You can use techniques like domain-driven design (DDD) — an approach
that structures code around business domains—to help identify and define bounded contexts. After that you can start
refactoring the system to better align with bounded
contexts. This can involve moving code between modules, creating new modules, and changing the way that modules interact
with each other. This process can be complex and time-consuming, but it will bring significant benefits in terms of
maintainability and scalability.Again, here you can use above-mentioned design patterns like ACL and Strangler Fig
Pattern or Event Storming sessions to help with that. One of the hardest parts will be database schema changes and data
migration. You need to plan it carefully, test it thoroughly, and ensure that there is no data loss or corruption.

## AI Arrived!

We are living in changing times. AI is everywhere, and software development is not an exception. Some time ago it was
impossible to make things in the way that AI is doing it now. All things had to be done manually, by engineers. Now AI
is able to help in many areas. From code generation, testing, documentation, and even architecture design. It's not a
silver bullet, but it can significantly speed up the process and improve quality. Here are a few examples how AI can
help you in both greenfield and legacy projects.

#### Documentation

In greenfield projects, AI can quickly draft PlantUML/C4-style diagrams and initial docs, helping align the team early.
In legacy systems, it’s most useful for generating high-level documentation from code to reduce “tribal knowledge” risk.
Treat outputs as drafts and validate against the real code and runtime behavior.

#### Knowledge gain

For greenfield, AI helps explain planned features, refine acceptance criteria, and speed up onboarding. For legacy, it’s
valuable for flow/code explanations and spotting unclear dependencies or coupling points. Always verify with code
navigation, logs/traces, and tests to avoid false confidence.

#### Development

In greenfield work, AI accelerates structured, repetitive implementation (scaffolding, DTOs, validation, standard
patterns). In legacy work, it helps propose safer edits, highlight hotspots, and suggest performance-related
improvements within existing constraints. Measure impact with profiling/benchmarks and keep changes small.

#### Testing

In greenfield projects, AI can propose edge cases and generate test scaffolding so coverage starts early. In legacy
projects, it can generate missing tests and conditions to build a safety net before refactoring. Review generated tests
carefully so they don’t encode wrong assumptions.

#### Refactoring

In greenfield, AI speeds up broad structural refactors (renames, extraction, consistent patterns) while the architecture
is still flexible. In legacy, it’s better for incremental refactoring and syntax cleanup backed by tests and reviews.
Avoid “big bang” rewrites; prefer small verified steps.

#### Technology

For greenfield, AI helps adopt up-to-date practices and quickly learn unfamiliar platform features. For legacy, it
supports technology upgrades by suggesting migration steps and API replacements, plus highlighting likely breakpoints.
Validate against official docs, release notes, and the test suite.

| Area           | Greenfield projects                                                         | Legacy projects                                                              |
|----------------|-----------------------------------------------------------------------------|------------------------------------------------------------------------------|
| Documentation  | Generate PlantUML / C4 diagrams and baseline docs early.                    | Produce high-level docs from code and existing behavior.                     |
| Knowledge gain | Explain planned features and translate requirements into technical tasks.   | Explain flows, business rules, and uncover hidden dependencies.              |
| Development    | Generate structured boilerplate (scaffolding, DTOs, validators, endpoints). | Assist with safe changes, performance reviews, and constrained improvements. |
| Testing        | Suggest edge cases and generate initial test scaffolding.                   | Generate missing/characterization tests before refactoring.                  |
| Refactoring    | Apply fast structural changes (renames, extractions, consistency).          | Propose incremental refactors and syntax improvements with guardrails.       |
| Technology     | Recommend modern patterns and show examples of new platform features.       | Support upgrades (APIs/dependencies) and propose migration steps.            |

## Conclusion

The choice between greenfield and legacy projects isn't about which is "better"—it's about understanding what each path
offers for your growth as an engineer and the impact you can make.

**Greenfield projects** teach you to make architectural decisions from scratch, choose appropriate technologies, and
design systems with foresight. You'll experience the thrill of creation and learn hard lessons when your design meets
production reality. You'll build expertise in modern tooling and practices. However, you'll miss the invaluable
experience of working with constraints, understanding long-term system evolution, and developing the patience required
for meaningful refactoring.

**Legacy projects** force you to become a more complete engineer. You'll develop debugging skills that greenfield
developers rarely need, learn to work creatively within constraints, and understand how systems evolve over years. The
satisfaction of transforming a chaotic codebase into something maintainable is unmatched. You'll also gain rare skills
that make you highly valuable—engineers who can successfully navigate and modernize legacy systems are always in demand.

The best career path? **Alternate between both.** Each greenfield project will make you more thoughtful about long-term
consequences. Each legacy project will make you more pragmatic about trade-offs and more appreciative of good design
decisions.

With the arrival of AI tools, both paths have become more accessible. AI accelerates documentation, code understanding,
and routine refactoring—but it doesn't replace the judgment and experience you'll build by working in both environments.

Whether you're starting fresh or diving into decades-old code, remember: your goal isn't perfection—it's **continuous
improvement**. Every refactoring, every cleaned-up module, every improved test brings value. Small, consistent
improvements compound over time into transformational change.

So the next time you face a daunting legacy system, don't despair. See it as an opportunity to develop skills that will
set you apart. And when you start that exciting greenfield project, remember the lessons from legacy codebases and build
something that won't become the nightmare you once inherited.

**The code you write today is tomorrow's legacy. Make it count.**

## References

### Books

- [Site Reliability Engineering: How Google Runs Production Systems](https://sre.google/books/) - Google, 2016  
  Comprehensive guide to production operations, incident management, and monitoring strategies.

- [Working Effectively with Legacy Code](https://www.oreilly.com/library/view/working-effectively-with/0131177052/) -
  Michael Feathers, 2004  
  Essential reading for anyone working with existing codebases. Covers refactoring strategies and test creation.

- [Refactoring: Improving the Design of Existing Code](https://refactoring.com/) - Martin Fowler, 2018  
  The definitive guide to code refactoring techniques and patterns.

### Architectural Patterns

- [Anti-Corruption Layer Pattern](https://learn.microsoft.com/en-us/azure/architecture/patterns/anti-corruption-layer) -
  Microsoft Azure Architecture Center  
  Pattern for isolating legacy systems and preventing architectural contamination.

- [Strangler Fig Pattern](https://learn.microsoft.com/en-us/azure/architecture/patterns/strangler-fig) - Microsoft Azure
  Architecture Center  
  Incremental migration strategy for replacing legacy systems.

- [C4 Model for Software Architecture](https://c4model.com/) - Simon Brown  
  A practical approach to software architecture diagramming.

### Methodologies and Practices

- [Event Storming](https://www.eventstorming.com/) - Alberto Brandolini  
  Collaborative workshop technique for exploring complex business domains.

- [Domain-Driven Design Community](https://www.dddcommunity.org/)  
  Resources, patterns, and community discussions on DDD practices.

- [The Twelve-Factor App](https://12factor.net/)  
  Methodology for building modern, scalable applications.

