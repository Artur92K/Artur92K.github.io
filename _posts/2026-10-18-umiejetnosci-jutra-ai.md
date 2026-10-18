---
title: "Umiejętności Jutra AI: Review of Google's Free AI Course"
date: 2026-10-18 09:00:00 +0200
description: "A developer's review of Google's free Umiejętności Jutra AI course: what each of the five weeks covers and who should take it."
categories: [ AI, Career ]
tags: [ ai, productivity, google, gemini, prompting, automation, business ]
image:
  path: /assets/images/umiejetnosci-jutra-ai-intro.png
  alt: "A presenter pointing at a glowing network diagram of connected AI nodes"
published: true
---

## TL;DR

- **Umiejętności Jutra AI** is a free [AI course from Google](https://rsvp.withgoogle.com/events/umiejetnoscijutra), taught in Polish. It runs for **5 weeks**, from prompting to agents and change management
- **Who it's for:** non-technical people, marketers, salespeople, and founders of startups and SaaS (Software as a Service) products, especially if you already work in Google's ecosystem
- **Developers** with solid foundations get more structure than new knowledge. Week 3 is the exception
- **The most useful part** isn't the tools. It's a question you can ask about your own work: where does AI save you real hours, and where does it just take your time?

## Motivation

I'm an experienced developer and I've been working with AI for a while. I didn't come for the basics. I wanted to learn something interesting and put what I already knew into one coherent picture.

Week one is the easy part to like. The useful material comes later, when the course stops talking about prompts and starts talking about money, processes and people. Everything is shown in Gemini and Google's tools, but the course says the same principles work in Claude, ChatGPT and Copilot.

## What the course is

Five weeks, each with video modules, PDF (Portable Document Format) promptbooks and AI LAB exercises. You can skip what you already know, and the course actually tells you to.

| Week | Topic | Most useful for... |
|------|-------|--------------------|
| 1 | Foundations of working with generative AI | everyone starting out |
| 2 | Content, sales, marketing, MVP (minimum viable product) | marketers, salespeople, founders |
| 3 | Automation and AI agents | technical people and no-code builders |
| 4 | Judgment, implementation strategy, data | managers and analysts |
| 5 | AI in the company and change management | leaders and business owners |

## Week 1: AI as a collaborator, not a search engine

The biggest change is in how you think about the tool. You stop asking questions and start handing over context, source material and the output you want. The AI does the heavy lifting, and you check the result. Five points from this week stuck with me.

1. **Prompts have levels.** The best one has a role, context, task, format and scope. Google's data quoted in the course says most people prompt with about two words, and results get noticeably better around 21
2. **Chain of thought beats one giant prompt.** Split the task into steps and give feedback after each one
3. **Gems save you from repeating yourself.** A Gem is a ready-made assistant with a role and rules already set. The course's math: ten Gems that each save you 12 hours a year add up to 120 hours
4. **Deep Research turns days of reading into a report in minutes.** Check every source, because the AI can misread a document
5. **Write the main assumptions yourself and let the AI help with editing.** The course warns about "AI slop", content dumped into circulation unchecked. According to KPMG (Klynveld Peat Marwick Goerdeler), quoted in the course, 66% of employees never verify what the model says

For marketing work, NotebookLM is the tool I'd try first. It answers only from your sources, so it makes things up much less than a regular chat.

The security module, led by Piotr Konieczny from Niebezpiecznik, was solid. It covers spotting AI-generated content, voice cloning in phone scams, and what happens when you connect a bot to Gmail and Drive. A legal block follows, with four questions to ask before rolling out AI in a company: about the vendor, the data, the content and the team rules.

## Week 2: content, sales and marketing

This is the week that gives the most to marketers, salespeople and anyone running a business.

The writing part turns classic frameworks into prompts. AIDA (Attract, Interest, Desire, Action) works for general copy, PAS (Problem, Agitate, Solution) for Google Ads, FAB (Features, Advantages, Benefits) for product descriptions, and SPICE (Sections, Prompt variables, Instructions, Context, Examples) for longer websites. The course is clear that "write like brand X" doesn't work. The model knows the stereotype of a brand, not its actual texts, so paste a real example.

Sales surprised me most. There's a lot of plain, good sales know-how here, and AI mainly speeds up the preparation. The sequence goes like this. Research the client with Deep Research. Qualify with BANT (Budget, Authority, Need, Timeline), or with MEDDIC (Metrics, Economic buyer, Decision criteria, Decision process, Identify pain, Champion) for bigger deals. Practice with a SPIN Selling (Situation, Problem, Implication, Need-payoff) simulation in AI Studio. Handle objections with the LAER model (Listen, Acknowledge, Explore, Respond), and run a 3x3 follow-up sequence. For negotiations, the course uses BATNA (Best Alternative to a Negotiated Agreement) and ZOPA (Zone of Possible Agreement).

Marketing, MVP and content get a lot of attention too. NotebookLM works as a "strategic director" for campaigns, while SEO (Search Engine Optimization), FAQ (Frequently Asked Questions) sections and GA4 (Google Analytics 4) with AI cover the rest. For SaaS founders, the most practical path is Miro, then [Lovable](https://lovable.dev/) and the **F.R.A.M.E.** framework (Formulate, Render, Attach, Mock, Enable). The example is an ROI (return on investment) calculator as a lead magnet, with a chatbot on a database as the MVP core, and no code. Images and video use Nano Banana and Veo 3.

## Week 3: automation and agents

This is the only week where I felt the course speaks to people who will actually build things.

The course separates three levels: a **workflow** (fixed sequence, autopilot), an **assistant** (waits for a request) and an **agent** (gets a goal, plans, calls tools, checks results and loops). [Anthropic](https://www.anthropic.com/research/building-effective-agents) draws the same line in *Building effective agents*. The practical takeaway is that you often don't need an agent. Many products sold as "AI agents" are good automations with a model inside.

**[Make.com](https://www.make.com/)** is no-code with a free plan of 1000 credits a month. Reactive triggers check at least every 15 minutes, so fast reactions need webhooks. Build from "Create a Draft", not from "Send".

**[n8n](https://n8n.io/)** is open source with over 1000 apps, and you can run it in the cloud or on your own server. One case handles 200 PDF invoices. Start with a manual trigger and test data, never a real mailbox.

The course also covers an [ElevenLabs](https://elevenlabs.io/) voice agent that answers calls and books appointments, plus Gmail, Calendar and Meet automations.

The agent security part hit me hardest:

- **Human in the loop** for irreversible actions: sending emails, purchases, database writes
- **Least privilege** for every agent
- **Denial of Wallet**: an attack that doesn't take the service down, it just runs up a token bill ([OWASP](https://owasp.org/www-project-top-10-for-large-language-model-applications/), the Open Worldwide Application Security Project, calls it Unbounded Consumption)
- **Indirect prompt injection**: a malicious instruction hidden in an email the agent reads

Developers get the most from this week: the [ReAct](https://arxiv.org/abs/2210.03629) (Reasoning and Acting) loop, [MCP](https://modelcontextprotocol.io/) (Model Context Protocol) and [A2A](https://a2a-protocol.org/latest/specification/) (Agent2Agent). It's an introduction, but a useful starting point.

## Week 4: judgment, strategy and data

This is where I stopped thinking about AI as a tool and started thinking about it as management. The key idea is **judgment**. The AI doesn't take responsibility for the result off your plate. Someone still has to decide whether the output makes sense for the business.

The course offers the **VISION** (WIZJA in Polish) framework:

1. **W - Set goals.** Use OKRs (Objectives and Key Results). The Objective gives the direction, and the Key Result is a KPI (Key Performance Indicator) plus the expected change. "First response time from 24 hours to 2 hours" works. "We want to be faster" doesn't
2. **I - Inspect the foundations.** Check your data before you hire AI. The instructors say over 90% of the largest companies have serious gaps in how they collect data. An AI will carry out a bad instruction, and nobody's gut feeling is there to stop it
3. **Z - Plan the rollout.** Start with quick wins, put one leader in charge of each area, and match the tool to the size of the problem: a chat, a dedicated agent, or Make/n8n
4. **J - Stay alert.** Define triggers, business events like a changed return policy or new pricing, that force a review of your AI system. The course's example is a bot that keeps promising free returns after the policy changed
5. **A - Activate creativity.** Put the time you win back into experiments. The course compares AI to a wheelbarrow: it moves more bricks, but you decide whether you're building a cathedral or a pile of rubble

Two terms stuck with me. The Magpie Syndrome is buying AI tools because you feel you have to keep up. Interface Manager is the role people drift into when AI is rolled out without a strategy: hours of clicking through workarounds. The data part covers SQL (Structured Query Language) in BigQuery with Gemini's help, and how to tell when you need a data warehouse and when you don't. For a developer it's the most business-oriented section, but the SQL skill is concrete.

## Week 5: the company, value and change

The last week has one optional module, and in my view it's the most important one for a business owner.

**Maturity levels.** The course draws on Gartner's AI maturity model. Gartner's [official toolkit](https://www.gartner.com/en/chief-information-officer/research/ai-maturity-model-toolkit) lists five stages, from Foundational to Transformational. The course describes its own levels with examples, from first weekend projects up to AI First, where the whole business is built around AI. A plain overview with different stage names is on [BMC Software's blog](https://www.bmc.com/blogs/ai-maturity-models/). The levels aren't linear, and different departments can sit at different levels at the same time. As a rule of thumb, a small effect multiplied by a large scale has to outweigh the cost of implementation.

The course calls the next idea the **Maslow trap**: once you have the tools, you start cutting costs and speeding everything up. Your competitors have the same tools, so faster clicking stops being an advantage. The best metaphor is a 5-star hotel that replaces its doorman with a motion sensor. On paper the ROI looks great. Months later, guest loyalty drops. [Porter](https://hbr.org/1996/11/what-is-strategy) argues that a company has to choose between cost leadership and differentiation. Being "a bit cheap and a bit good" is not a strategy.

The practical tool is the **Doorknob/Smile method** (Klamka/Uśmiech in the original). Break each job into tasks. Mechanical ones, the doorknob, go to AI. Relationships, empathy and decisions, the smile, stay with the human. In the course's example, a salesperson gets back 60-70% of their time.

Allegro's Cezary Kujik spent a year rolling out Gemini to several thousand employees, and his takeaway is that an AI rollout is a cultural project. Errors scale, so measure productivity before and after, not prompt counts. "AI takes over what frustrates you" builds trust. "AI will replace repetitive tasks" sounds like "it will replace me".

The course also covers the [ADKAR](https://www.prosci.com/methodology/adkar) model (Awareness, Desire, Knowledge, Ability, Reinforcement) and the three-stage model of change usually credited to Lewin: unfreeze, change, refreeze. Most rollouts only work on the change stage.

The strongest example is Eblink, a 20-person company known for personal service. The owners rolled out a chatbot overnight and didn't tell the consultants. The consultants quietly sabotaged the hard cases, customers felt the relationship was gone, and the advantage disappeared. In the course's words, the technology wasn't the problem. Change management was missing.

## Who this course is worth your time for

- **Non-technical people** (HR, meaning human resources, operations, admin): high value. Week 1, the Workspace part of Week 3 and Week 5
- **Marketing and sales**: the highest value. Week 2 in full
- **SaaS and startup founders**: high. Week 2 (MVP), Week 3, Week 4 (WIZJA), Week 5
- **Managers and owners of small companies**: very high for Weeks 4 and 5
- **Developers with solid foundations**: medium, mostly as a way to organize what you know. The new material is Week 3 and the BigQuery SQL in Week 4

## Key Takeaways

- A free, five-week Google course that is practical and well organized
- Treat AI like a collaborator that needs context and checking
- For marketing and sales you get ready-made frameworks and workflows, including an MVP without code
- Check your data, triggers and security rules before you automate
- The value comes from what you do with the time you win back
- Rolling out AI is about people. Without communication and reinforcement, the technology won't deliver

**Give AI the doorknob. Keep the smile.**

## References

### The course

- [Umiejętności Jutra AI - registration](https://rsvp.withgoogle.com/events/umiejetnoscijutra)

### Tools

- [Make.com](https://www.make.com/)
- [n8n](https://n8n.io/)
- [NotebookLM](https://notebooklm.google.com/)
- [ElevenLabs](https://elevenlabs.io/)
- [Lovable](https://lovable.dev/)

### Concepts and standards

- [Gartner - AI Maturity Assessment](https://www.gartner.com/en/chief-information-officer/research/ai-maturity-model-toolkit) - the AI maturity model behind the Week 5 levels
- BMC, [*Gartner's AI Maturity Model: Maximize Your Business Impact*](https://www.bmc.com/blogs/ai-maturity-models/) (January 30, 2025) - an overview of the model, with stage names that differ from Gartner's page
- Anthropic, [*Building effective agents*](https://www.anthropic.com/research/building-effective-agents) (December 19, 2024) - workflows versus agents (Week 3)
- Yao et al., [*ReAct: Synergizing Reasoning and Acting in Language Models*](https://arxiv.org/abs/2210.03629) (2022) - the Reasoning + Acting agent loop (Week 3)
- [Model Context Protocol](https://modelcontextprotocol.io/) - the standard for connecting models to tools (Week 3)
- [Agent2Agent (A2A) Protocol Specification](https://a2a-protocol.org/latest/specification/) - communication between agents (Week 3)
- [OWASP Top 10 for Large Language Model Applications](https://owasp.org/www-project-top-10-for-large-language-model-applications/) - including Unbounded Consumption (Denial of Wallet) and prompt injection (Week 3)
- [Prosci ADKAR Model](https://www.prosci.com/methodology/adkar) - change at the individual level (Week 5)
- Michael E. Porter, [*What Is Strategy?*](https://hbr.org/1996/11/what-is-strategy), *Harvard Business Review*, November-December 1996 - cost leadership versus differentiation (Week 5)
