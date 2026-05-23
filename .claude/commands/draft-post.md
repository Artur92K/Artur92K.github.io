# draft-post

Draft a new blog post for patodev.pl in Artur's voice.

## Instructions

Read the writing style guide at `.claude/blog-writing-style.md` before doing anything else.

### What to ask (if not provided in the invocation args)

1. **Topic** — what is the post about? (required)
2. **Angle / thesis** — what's the main insight or opinion? (required)
3. **Series?** — is this part of a series? If yes, which post comes before/after?
4. **Target length** — short (~500 words), medium (~1000), or long (~2000)?
5. **Do you have an outline or key points to include?**

Ask all missing questions in a single message before writing. Do not start drafting until you have at least topic + angle.

### Output

Produce a complete `.md` file ready to save in `_posts/`. Include:

- Full front matter (`title`, `date` set to today's date, `description`, `categories`, `tags`, `image` placeholder, `published: false` — always set false for new drafts)
- All structural sections per the style guide (Motivation → content sections → Key Takeaways → Conclusion → bold closing line → References skeleton)
- Voice and tone matching Artur's style: second-person, experience-driven, direct, energetic, concrete examples with real numbers where possible
- Use rhetorical questions as section transitions
- End Conclusion with a bold one-liner closing statement
- For series posts: add `#### Next chapter` section and cross-link with `{% post_url %}` syntax

### Filename suggestion

Suggest a filename in the format `YYYY-MM-DD-slug.md` based on today's date.

After outputting the draft, ask: "Should I save this to `_posts/`?"  
Only save if the user confirms.
