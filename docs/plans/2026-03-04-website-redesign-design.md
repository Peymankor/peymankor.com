# Website Redesign — Clean Minimal

## Goal
Redesign peymankor.com to look more professional and minimal while keeping all existing sections. Must work on desktop and mobile.

## Approach
Refined Current (Approach A) — polish existing Quarto structure with better CSS, no structural changes to the Quarto project.

## Color & Typography

- Text: `#1a1a2e` body, `#4a4a5a` secondary
- Accent: `#2563eb` (flat blue, no gradients)
- Backgrounds: `#ffffff` primary, `#f8f9fb` alternating sections
- Borders: `#e5e7eb`
- Font: Inter, 1rem body, 400 weight body, 600 headings
- Name: 2.4em, weight 700, plain dark
- Headline: 1.2em, 400 weight, secondary color
- Navbar links: 1rem, 500 weight, charcoal with blue hover

## Homepage

- Keep Solana template side-by-side (photo right, text left)
- Profile image: 280px circle, subtle box-shadow
- Remove negative margin hacks, use proper spacing
- No "Summary" heading — text flows naturally
- Remove gradient text and thick underline from headline
- Experience/Education: thin 2px gray border-left, no blue dots, compact spacing
- Company bold, role in accent blue, dates muted
- Contact links: icon-only row, centered, no button styling

## Blog Listing

- 2-column card grid (desktop), 1 column (mobile)
- Card: thumbnail top, title, date, description
- Subtle border, 8px radius, hover shadow
- Category sidebar unchanged

## Projects Page

- 2-column card grid matching blog style
- Card: title, description, skill badges, GitHub link icon

## Publications Page

- Clean list grouped by year heading
- Simple line per publication: title, venue, link

## Awards Page

- Keep image + text layout, improve spacing with consistent card style

## Navbar

- White background, subtle bottom border (no box-shadow)
- Links: 1rem, dark charcoal, blue hover, no uppercase
- "Peyman Kor" on left: same size as nav links, weight 600

## Mobile

- Photo stacks above text (existing behavior)
- Cards go single-column
- Contact icons stay single row
- Less left padding on timeline items
- No horizontal overflow
