## Voice & Tone

- **Second-person conversational**: address the reader as "you" throughout
- **First-person experience-driven**: open with "I have realized…", "I've got a few thoughts…", "Some time ago…"
- **Peer mentor**: sharing hard-won senior engineer wisdom, not lecturing
- **Energetic with drama**: use ellipsis for buildup (`...`), bold caps for impact (`BOOOM`), exclamation for emphasis
- **Rhetorical questions as transitions**: "Isn't it interesting?", "Do you think your problems are over?"
- **Non-native but fluent English**: slight informality is authentic — do not over-polish into corporate English
- **Direct with strong opinions**: state conclusions clearly, avoid hedging
- **Concrete numbers**: always give real figures (30% incidents, 200-500k LoC, "5th year of experience")
- **Named mental models**: reference Chesterton's Fence, Survivorship Bias, DDD, SRE, etc. - never explain what everyone knows
- **No em dashes**: never use — (em dash); always use - (hyphen) instead

## Post Front Matter Format

```yaml
---
title: "Title Here"
date: YYYY-MM-DD HH:MM:SS +/-0200
description: Short description for SEO, 1-2 sentences
categories: [ Category1, Category2 ]
tags: [ tag1, tag2 ]
image: /assets/images/descriptive-name.png
---
```

- `published: false` for drafts/unpublished posts
- Categories used: Software, Architecture, IT, Career, Kotlin
- Tags used: job, architecture, jdk, junit, testing, kotlin, coroutines, design-patterns, best-practices

## Standard Post Structure

1. Optional `## TL;DR` — bold bullets, only for longer technical posts
2. `## Motivation` — always the first real section; personal story hook that frames why this matters
3. Content sections with `##` headers, subsections `###`, sub-subsections `####`
4. Practical content: numbered lists for steps, bullet lists for benefits/comparisons
5. Comparison tables when contrasting two things side-by-side
6. `## Key Takeaways` — brief bullets recapping the main points
7. `## Conclusion` — wrap-up with conviction; often repeats a series tagline
8. **Bold closing statement** as the last line before References — a punchy one-liner
9. `## References` — organized into subsections (Books, Architectural Patterns, Methodologies, etc.)

## Signature Elements

- **Series cross-linking**: use `{% post_url YYYY-MM-DD-slug %}` syntax; add `#### Next chapter` section at end
- **Bold closing line**: always end with a memorable bold statement, e.g. `**The code you write today is tomorrow's legacy. Make it count.**`
- **Scenario framing**: introduce concrete scenarios ("Scenario 1 - Greenfield", "Scenario 2 - Legacy") when comparing two paths
- **Practical lists with `!`** in heading: "Remove dead code!" — the exclamation signals urgency
- **Direct address in warnings**: "Welcome to legacy world!", "Welcome to the real world of software development!"
- **Inline explanations for niche terms**: "(Vert.x is a reactive application framework)" — brief, not condescending
- **`{% include warn.html content="..." %}`** for inline callout boxes

## Topics & Domain

- JVM/Java/Kotlin engineering (Spring Boot, Vert.x, JUnit, coroutines)
- Software architecture (DDD, bounded contexts, C4, Event Storming)
- Legacy system modernization (ACL, Strangler Fig)
- Career development for senior engineers
- AI tools in software development
- Production operations (SRE, observability, monitoring)
- Design principles (DRY, SOLID, Chesterton's Fence)

## File Naming Convention

`_posts/YYYY-MM-DD-slug-words.md`  
Drafts go in `_drafts/` (no date in filename).
