# polish-post

Polish an existing blog post draft to match Artur's voice and style for patodev.pl.

## Instructions

Read the writing style guide at `.claude/blog-writing-style.md` before doing anything else.

### Input

The user will either:
- Pass a filename as the argument (e.g. `/polish-post _drafts/my-post.md`) — read that file
- Paste the post content directly — use that

If neither, ask: "Which post should I polish? Provide a file path or paste the content."

### What to check and fix

**Structure**
- [ ] Front matter complete: title, date, description, categories, tags, image, `published: false`
- [ ] Starts with `## Motivation` (or `## TL;DR` + `## Motivation` for long posts)
- [ ] All `##` sections have clear, punchy headings
- [ ] Ends with `## Key Takeaways` → `## Conclusion` → bold closing line → `## References`
- [ ] Series posts have `#### Next chapter` with `{% post_url %}` links

**Voice & Tone**
- [ ] Second-person throughout ("you", "your") — not third-person or passive
- [ ] Personal experience hooks in Motivation ("I have realized…", "I've got…")
- [ ] Rhetorical questions used as transitions between sections
- [ ] Energy markers present where appropriate: `...`, `BOOOM`, `!` in list headings
- [ ] Direct statements — no hedging like "it might be possible that…"
- [ ] Concrete numbers and examples (not vague generalities)
- [ ] Named mental models properly referenced

**Language**
- [ ] Fix grammar errors and typos — but preserve Artur's natural slightly informal rhythm
- [ ] Do NOT over-formalize or add corporate language
- [ ] Inline explanations for niche terms "(X is a Y)" — present only where genuinely needed

**References**
- [ ] All linked resources are properly cited
- [ ] References grouped into subsections if there are 4+ entries

### Output format

1. List what you changed and why (brief, bullet form)
2. Output the full polished post as a code block
3. Ask: "Should I overwrite the file with these changes?"

Only write to the file if the user confirms.
