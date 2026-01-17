---
title: "Greenfield vs Legacy Software: The Hidden Career Benefits of Legacy Code"
date: 2026-01-17 01:00:00 +/-0200
description: Greenfield vs legacy software projects. Why You Should Volunteer for the Legacy Project (And How to Survive It)
categories: [ Software, Architecture ]
tags: [ job, architecture ]
image: /assets/images/legacy-greenfield-img.png
---

## Motivation

Recently I have realized that during my career I constantly switched from legacy into greenfield projects and vice
versa. Each time I was facing different challenges and opportunities. Somewhere during my 5th year of experience I
thought that only greenfield projects are worth doing, as they allow you to use the latest technologies and best
practices but was I right? After reflecting on my experiences more deeply, I observed that greenfield projects are
forgiving - they allow you to experiment freely and recover from mistakes easily since there's no production traffic or
legacy constraints to worry about.

On the other hand, legacy projects are those which people don't want to touch
because of challenges. Looking closer, they have some unique benefits which are not obvious at first glance.
First, we must acknowledge Survivorship Bias. We often mock legacy code for being ugly, but we forget one crucial fact:
Legacy code is code that survived. It is ugly because it has weathered years of feature requests, market pivots, and
scale. The 'clean' code from failed startups didn't become legacy; it got deleted when the company went bust. Working on
legacy means working on software that is actually paying the bills.

I have decided to write down my thoughts on the differences between these two types of projects, the pros and cons of
each, and how to navigate them
effectively.

### Scenario 1 - Greenfield

You are starting a new greenfield project. You have the freedom to choose your modern tech stack, architecture, and
design patterns from scratch. This allows you to implement best practices and modern technologies without being
constrained by legacy systems. A domain expert is working closely with the team. And one very important thing, the
system is not on production yet!

### Scenario 2 - Legacy

You are joining a legacy project that has been running for several years. The codebase is large and complex written by
people who have moved into leadership or left the company, technology stack is outdated. There is no single domain
expert knowing
all features and assumptions. System is handling tons of users every day.

## Technology Stack: Freedom vs Constraints

#### Greenfield project

In greenfield projects, you can choose the latest technologies and frameworks that best suit your needs. There are a few
architectural drivers to consider, such as company technology stack, team skill set, industry direction, performance,
and maintainability. Of course, you can also play a bit with CV-driven development, which can be sometimes beneficial
for people but also can lead to overengineering.

#### Legacy project

In legacy projects, you are often limited to the existing technology stack. Upgrading or changing technologies is nearly
impossible, but it opens other opportunities like gaining unique skills. You don't believe? Try to find
engineers who are able to migrate production application from Vert.x (Vert.x is a reactive application framework) 3 to
Vert.x 4 and later to Spring Boot in system which is around 200-500k LoC. At the same time there is plenty of other
outdated libraries and frameworks which you need to deal with. What if company needs engineers who are able to maintain
both technologies? Some time ago, I was checking job offers and I found out that such skills were among the
requirements!
Isn't it interesting?

## Understanding System Architecture: Documentation vs Archaeology

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
to the real legacy world!

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
but ended up violating the boundaries.

This is where you must apply Chesterton’s Fence. If you see a fence (or a weird if statement) in the middle of a road,
do not tear it down until you know why it was put there. That ugly hack might be preventing a race condition that only
happens on Black Friday or handling a legacy integration with a bank that no one remembers. In legacy systems,
refactoring without understanding the history isn't cleanup—it's sabotage.

You may need to spend significant time analyzing the codebase and talking to team members to identify and understand
these boundaries and their evolution. If you are lucky there are tests, corresponding JIRA tickets or some doc which
help you figure out the reasons behind such changes. Refactoring the system to better align with bounded contexts can be
a complex and time-consuming process, especially when they require data migrations.

Beyond architectural challenges, the timing and nature of difficulties differs dramatically between these project types.

## When do you want to suffer?

### Greenfield: Delayed Suffering (Post-Production)

One of the most unexpected things in greenfield projects is that you will suffer a lot when system goes to production.
After a few quite smooth months you will face real production issues, bugs, and performance problems. System is growing
up, features are coming, and you are no longer in safe space. It's time to deal with real users. You are adding new
feature, smooth review, merge, deploy to production and... boom. Something is broken, users are complaining, but you
have no clue why.
Welcome to real world of software development! Now it's time to work harder on monitoring, logging, and alerting. Some
dashboards are not showing new path, logs are missing important traces. Time to fix it all, but what if you don't have
expertise in such things?

No worries, you will learn it very fast. There are three excellent books which can help you to move
forward. [Site Reliability Engineering by Google](https://sre.google/books/) is an outstanding starting point. You can
find
there comprehensive guidelines how to structure production support, incident management, and monitoring.

### Legacy: Immediate Suffering (Day One)

You are joining a legacy project. First month is like being in big labyrinth, probably without any map. No knowledge
of where the deployment units are, databases, what metrics and alerts mean. After that time you have fallacious feeling
that you are starting to understand the system, and you are ready for effective work in it. But wait, there is always a
catch.
You took first business task, starting to work on it and suddenly BOOOM. Where to start, there are a few working
features
around, codebase is a mess, tests coverage is around 50%. You are lost again. Welcome to legacy world! That's the place
where you need to put your ego in your pocket and start asking for help. Talk to people, read code, set up pair
programming session.

When pull request is ready, ask for feedback from seasoned team members. Probably you will fix some things and you are
ready to go. Merge, deploy to test environment, first tests and... it's not working as expected. Oh no, what happened?
New feature is not working, some other features are broken. Time to investigate logs, metrics, and traces. After a few
hours you are able to figure out that there is some hidden dependency between modules which was not obvious at all. Fix
it,
test again, and finally you are able to deliver value to users. Congratulations, you survived first task in legacy
system!

Do you think your problems are over? No way! Next task is waiting for you. Repeat the same cycle again and again until
you figure out that system went into stabilization phase.

## Political savvy

In greenfield, you dictate the tech. In legacy, you have to negotiate. You will find yourself convincing stakeholders
that we need to pause feature development to pay down debt, or hunting down the one person in accounting who remembers
why this specific business rule exists. You learn empathy for the developers before you, realizing they didn't write bad
code on purpose—they made tradeoffs under pressure. This builds a political savvy that greenfield projects simply cannot
teach you.

Picture this: You've identified a critical piece of technical debt that's causing 30% of production incidents. In a
greenfield project, you'd just refactor it. In legacy, you need to:

- Build a business case with metrics showing the cost of incidents
- Negotiate with the product team to pause features for a few sprints
- Convince the original author (now a director) that refactoring is necessary

This negotiation muscle is what separates senior engineers from code writers.

## Quick Comparison

| Aspect             | Greenfield            | Legacy                  |
|--------------------|-----------------------|-------------------------| 
| Tech Stack         | Your choice           | Fixed/outdated          | 
| Documentation      | Created as you go     | Missing or outdated     | 
| Suffering Timeline | Post-production       | Day one                 | 
| Learning Curve     | Architecture & design | Political & operational | 
| Business Impact    | Unproven              | Revenue-generating      |

## Key Takeaways

- Legacy code survived for a reason - it's paying the bills and has proven market fit
- Greenfield projects let you experiment freely, but suffering comes post-production
- Legacy projects are immediate chaos, but teach you resilience and political skills
- The best engineers cycle between both types, using lessons from each
- Working on legacy builds the experience needed to create resilient greenfield systems

## Conclusion: The Cycle of Competence

So, was I right in my 5th year when I thought only greenfield projects were worth my time? Absolutely not.

The truth is, software engineering is a cycle. Greenfield projects feed your ego. They let you feel like an architect, a
creator, and a visionary. But legacy projects feed the payroll—they are the proven systems that have survived the
market, scaled with the user base, and are currently generating the revenue that funds your next greenfield experiment.

If you only work on greenfield, you become "architecture-naive." You never stick around long enough to see your
"perfect" design decisions turn into tomorrow's technical debt. You miss the humility that comes from asking, "Why did
they write it this way?" and realizing there was a valid reason you didn't foresee.

Conversely, if you only stay in legacy, you risk stagnation. You forget the joy of creation and the efficiency of modern
tooling.

The best engineers aren't those who escape legacy; they are the ones who can walk into a burning building of spaghetti
code, navigate the chaos without panic, and stabilize it. They use the scars from legacy "suffering" to build more
resilient greenfield systems.

So, when to suffer? Now. Embrace the legacy work. It is the gym where senior engineers are forged. And when you finally
get that next blank slate, you won't just build it fast—you'll build it to survive.

Soon I will publish a follow-up article about strategies and best practices for navigating both greenfield and legacy
projects
effectively. Stay tuned!

**The code you write today is tomorrow's legacy. Make it count.**

## References

- [Site Reliability Engineering: How Google Runs Production Systems](https://sre.google/books/) - Google, 2016  
  Comprehensive guide to production operations, incident management, and monitoring strategies.

- [C4 Model for Software Architecture](https://c4model.com/) - Simon Brown  
  A practical approach to software architecture diagramming.

- [Event Storming](https://www.eventstorming.com/) - Alberto Brandolini  
  Collaborative workshop technique for exploring complex business domains.

- [Domain-Driven Design Community](https://www.dddcommunity.org/)  
  Resources, patterns, and community discussions on DDD practices.

- [Chesterton's Fence: A Lesson in Second-Order Thinking](https://fs.blog/chestertons-fence/) - Farnam Street <br>
  An in-depth explanation of the principle that you should not remove a system component until you understand why it was
  built.

- [The Twelve-Factor App](https://12factor.net/)  
  Methodology for building modern, scalable applications.

