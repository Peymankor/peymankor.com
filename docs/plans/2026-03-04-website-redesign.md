# Website Redesign Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Redesign peymankor.com with a clean minimal aesthetic — neutral colors, better typography, more whitespace — while keeping all existing sections and ensuring desktop/mobile responsiveness.

**Architecture:** CSS-only redesign within existing Quarto framework. Modify `styles.css`, `_variables.scss`, inline styles in `index.qmd`, and page-specific CSS. No structural changes to the Quarto project config.

**Tech Stack:** Quarto, SCSS (Bootswatch Sandstone), CSS, HTML

---

### Task 1: Update SCSS variables for new color palette and typography

**Files:**
- Modify: `_variables.scss`

**Step 1: Replace color and font variables**

Replace the full content of `_variables.scss` with updated values:
- Primary blue: `#2563eb`
- Body color: `#1a1a2e`
- Gray scale adjusted for lighter borders (`#e5e7eb`) and backgrounds (`#f8f9fb`)
- Font family: Inter as primary
- Root font size: 18px (down from 20px)
- Headings weight: 600

Key changes:
```scss
$blue:    #2563eb !default;
$body-color: #1a1a2e !default;
$gray-200: #f8f9fb !default;
$gray-300: #e5e7eb !default;
$font-family-sans-serif: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", "Helvetica Neue", Arial, sans-serif !default;
$headings-font-weight: 600 !default;
$font-size-root: 18px !default;
$link-color: $blue !default;
```

**Step 2: Render site to verify variables compile**

Run: `quarto render index.qmd`
Expected: No SCSS compilation errors, page renders

**Step 3: Commit**

```bash
git add _variables.scss
git commit -m "style: update SCSS variables for clean minimal palette"
```

---

### Task 2: Redesign the navbar in styles.css

**Files:**
- Modify: `styles.css` (navbar section, lines ~88-116)

**Step 1: Update navbar styles**

Replace the navbar CSS block with:
```css
.navbar {
    background-color: white !important;
    border-bottom: 1px solid #e5e7eb;
    box-shadow: none;
}

.navbar-nav .nav-link {
    font-size: 1rem !important;
    font-family: 'Inter', sans-serif;
    font-weight: 500;
    padding: 0.5rem 1rem !important;
    color: #1a1a2e !important;
    transition: color 0.2s ease;
    text-transform: none !important;
}

.navbar-nav .nav-link:hover {
    color: #2563eb !important;
    transform: none;
}
```

**Step 2: Update hamburger menu accent color**

Change all `#007bff` references in the hamburger/mobile section to `#2563eb`.

**Step 3: Render and verify**

Run: `quarto render index.qmd`
Expected: Navbar has subtle border instead of shadow, links are dark charcoal, hover is blue

**Step 4: Commit**

```bash
git add styles.css
git commit -m "style: simplify navbar — subtle border, smaller links, no shadow"
```

---

### Task 3: Redesign the homepage hero section

**Files:**
- Modify: `index.qmd` (inline `<style>` block, lines ~13-241)

**Step 1: Replace the inline style block**

Replace the entire `<style>...</style>` block in `index.qmd` with clean minimal styles:

```css
/* Profile image */
.quarto-about-solana .about-image {
    margin-left: 1em;
    margin-right: 0;
}
.quarto-about-solana .about-image img {
    border-radius: 50% !important;
    width: 280px !important;
    object-fit: cover !important;
    box-shadow: 0 4px 20px rgba(0,0,0,0.08);
}

/* Hero container */
#hero-heading {
    font-size: 1rem;
    margin-top: -1em;
    max-width: 900px;
    padding: 0;
}

/* Name */
.name-title {
    font-size: 2.4em;
    font-weight: 700;
    color: #1a1a2e;
    margin-bottom: 0.2em;
}

/* Headline */
.headline {
    font-size: 1.2em;
    font-weight: 400;
    color: #4a4a5a;
    margin-bottom: 1.5em;
    line-height: 1.4;
    padding-bottom: 0;
    border-bottom: none;
}
.headline::after {
    display: none;
}

/* Research areas */
.research-areas {
    background: #f8f9fb;
    padding: 1.5em;
    border-radius: 8px;
    margin: 1.5em 0;
    border: 1px solid #e5e7eb;
    box-shadow: none;
}
.research-areas ol {
    list-style: none;
    counter-reset: item;
    padding-left: 0;
}
.research-areas li {
    counter-increment: item;
    margin-bottom: 0.7em;
    padding-left: 2.5em;
    position: relative;
}
.research-areas li::before {
    content: counter(item);
    position: absolute;
    left: 0;
    width: 1.8em;
    height: 1.8em;
    background: #2563eb;
    border-radius: 50%;
    color: white;
    text-align: center;
    line-height: 1.8em;
    font-weight: bold;
}

/* Contact links — icon only */
.contact-links {
    margin-top: 2em;
    padding-top: 1.5em;
    border-top: 1px solid #e5e7eb;
    display: flex;
    align-items: center;
    justify-content: flex-start;
    gap: 0.6em;
}
.contact-links a {
    text-decoration: none;
    color: #4a4a5a;
    font-size: 1.3em;
    padding: 0.4em;
    border-radius: 50%;
    transition: color 0.2s ease;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    background: none;
    border: none;
}
.contact-links a:hover {
    color: #2563eb;
    transform: none;
    box-shadow: none;
    background: none;
    border: none;
}
.contact-links i {
    color: inherit;
}

/* Links */
a {
    color: #2563eb;
    text-decoration: none;
    transition: color 0.2s ease;
    font-weight: 500;
}
a:hover {
    color: #1d4ed8;
}

/* Paragraphs */
p {
    line-height: 1.7;
    margin-bottom: 1.2em;
}

/* Experience section */
.experience-section {
    margin-top: 3em;
    padding-top: 2em;
    border-top: 1px solid #e5e7eb;
}
.experience-section h2 {
    font-size: 1.6em;
    font-weight: 600;
    margin-bottom: 1em;
    color: #1a1a2e;
}
.experience-item {
    margin-bottom: 1.5em;
    padding-left: 1.2em;
    border-left: 2px solid #e5e7eb;
    position: relative;
}
.experience-item h3 {
    font-size: 1.1em;
    font-weight: 600;
    color: #1a1a2e;
    margin-bottom: 0.1em;
}
.experience-item .year {
    color: #6b7280;
    font-size: 0.85em;
    margin-bottom: 0.1em;
}
.experience-item .role {
    color: #2563eb;
    font-size: 1em;
    font-weight: 600;
    margin-bottom: 0.3em;
    background: none;
    -webkit-text-fill-color: #2563eb;
}
.experience-item .description {
    color: #4a4a5a;
    font-size: 0.9em;
    margin-top: 0.3em;
    line-height: 1.5;
}
.experience-item::before {
    display: none;
}

/* Education section */
.education-section {
    margin-top: 3em;
    padding-top: 2em;
    border-top: 1px solid #e5e7eb;
}
.education-section h2 {
    font-size: 1.6em;
    font-weight: 600;
    margin-bottom: 1em;
    color: #1a1a2e;
}
.education-item {
    margin-bottom: 1.5em;
    padding-left: 1.2em;
    border-left: 2px solid #e5e7eb;
    position: relative;
}
.education-item h3 {
    font-size: 1.1em;
    font-weight: 600;
    color: #1a1a2e;
    margin-bottom: 0.1em;
}
.education-item .year {
    color: #6b7280;
    font-size: 0.85em;
    margin-bottom: 0.1em;
}
.education-item .degree {
    color: #1a1a2e;
    font-size: 1em;
    font-weight: 600;
    margin-bottom: 0.3em;
    background: none;
    -webkit-background-clip: unset;
    -webkit-text-fill-color: #1a1a2e;
}
.education-item .description {
    color: #4a4a5a;
    font-size: 0.9em;
}
.education-item::before {
    display: none;
}
```

**Step 2: Update contact links HTML to icon-only**

In `index.qmd`, replace the contact links div with icon-only links (remove text labels):
```html
<div class="contact-links">
<a href="https://www.linkedin.com/in/peyman-kor/" target="_blank" title="LinkedIn"><i class="bi bi-linkedin"></i></a>
<a href="https://twitter.com/peyman_kor" target="_blank" title="Twitter"><i class="bi bi-twitter"></i></a>
<a href="https://medium.com/@peymankor" target="_blank" title="Medium"><i class="bi bi-medium"></i></a>
<a href="https://github.com/peymankor" target="_blank" title="GitHub"><i class="bi bi-github"></i></a>
<a href="mailto:kor.peyman@gmail.com" title="Email"><i class="bi bi-envelope"></i></a>
</div>
```

**Step 3: Remove "Summary" heading from index.qmd content**

Remove the `<h2>Summary</h2>` line from the summary-section div so text flows naturally without a heading.

**Step 4: Render and verify**

Run: `quarto render index.qmd`
Expected: Clean hero with dark text name (no gradient), subtitle in gray, thin timeline borders, icon-only contacts

**Step 5: Commit**

```bash
git add index.qmd
git commit -m "style: redesign homepage hero — minimal colors, clean timeline, icon contacts"
```

---

### Task 4: Update global styles in styles.css

**Files:**
- Modify: `styles.css` (body, content, blog listing sections)

**Step 1: Update body and content font sizes**

Change body font-size references and content font-size from 1.2rem to 1rem.

**Step 2: Update blog listing to card grid**

Replace the blog listing CSS (lines ~119-218) with a card grid layout:
```css
/* Blog listing — card grid */
.quarto-listing-default {
    max-width: 1000px;
    margin: 0;
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 1.5rem;
}

@media (max-width: 768px) {
    .quarto-listing-default {
        grid-template-columns: 1fr;
    }
}

.quarto-listing-default > div {
    display: flex;
    flex-direction: column;
    border: 1px solid #e5e7eb;
    border-radius: 8px;
    overflow: hidden;
    transition: box-shadow 0.2s ease;
    padding: 0;
    margin-bottom: 0;
    background: white;
}

.quarto-listing-default > div:hover {
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
}

.listing-image {
    float: none;
    width: 100%;
    height: 160px;
    margin: 0;
    border-radius: 0;
    overflow: hidden;
}

.listing-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.listing-title {
    order: 1;
    margin: 0;
    padding: 1rem 1rem 0;
}

.listing-title a {
    font-size: 1.1rem !important;
    text-decoration: none;
    font-weight: 600;
    color: #1a1a2e !important;
    line-height: 1.3;
    transition: color 0.2s ease;
}

.listing-title a:hover {
    color: #2563eb !important;
    text-decoration: none;
}

.listing-date {
    order: 2;
    font-size: 0.8rem;
    color: #6b7280;
    padding: 0.3rem 1rem 0;
    display: block;
}

.listing-description {
    order: 3;
    font-size: 0.9rem;
    line-height: 1.5;
    padding: 0.5rem 1rem 1rem;
    margin: 0;
    color: #4a4a5a;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
}
```

**Step 3: Update link colors throughout**

Replace all `#007bff` with `#2563eb` and `#0056b3` / `#2c5282` hover colors with `#1d4ed8`.

**Step 4: Update mobile breakpoint styles**

Update the `@media (max-width: 600px)` section — keep the existing responsive fixes but update colors to match new palette.

**Step 5: Render and verify**

Run: `quarto render`
Expected: Blog listing shows as 2-column card grid on desktop, 1 column on mobile

**Step 6: Commit**

```bash
git add styles.css
git commit -m "style: card grid blog listing, updated colors and font sizes"
```

---

### Task 5: Update publications page styles

**Files:**
- Modify: `publications.css`

**Step 1: Update colors to match new palette**

Update the publications CSS to use new colors:
- `#2d3748` → `#1a1a2e`
- `#4a5568` → `#4a4a5a`
- `#3182ce` → `#2563eb`
- `#2c5282` → `#1d4ed8`
- `#e2e8f0` → `#e5e7eb`
- `#f7fafc` → `#f8f9fb`

**Step 2: Render and verify**

Run: `quarto render publications.qmd`
Expected: Publications page uses consistent colors

**Step 3: Commit**

```bash
git add publications.css
git commit -m "style: update publications page colors to match new palette"
```

---

### Task 6: Update awards page styles

**Files:**
- Modify: `awards.qmd` (inline `<style>` block)

**Step 1: Update inline styles**

Update the awards page inline CSS:
- `#2d3748` → `#1a1a2e`
- `#4a5568` → `#4a4a5a`
- `#4299e1` → `#2563eb`
- Remove gradient text styles
- Award images: keep border-radius and shadow, consistent with design

**Step 2: Render and verify**

Run: `quarto render awards.qmd`
Expected: Awards page uses consistent colors, no gradients

**Step 3: Commit**

```bash
git add awards.qmd
git commit -m "style: update awards page colors to match new palette"
```

---

### Task 7: Update projects page to card grid

**Files:**
- Modify: `projects.qmd`

**Step 1: Add inline CSS for project cards**

Add a `<style>` block at the end of `projects.qmd` that styles project sections as cards:
```css
/* Project cards */
h4 {
    font-size: 1.2em;
    font-weight: 600;
    color: #1a1a2e;
    margin-top: 0;
}

hr {
    border: none;
    border-top: 1px solid #e5e7eb;
    margin: 2em 0;
}

.skills img {
    margin: 0 !important;
    padding: 0 !important;
    box-shadow: none !important;
}
```

Note: The projects page uses Quarto markdown with `####` headings and `---` separators. Converting to a true card grid would require significant HTML restructuring. Instead, keep the current list layout but ensure colors and spacing are consistent with the new palette.

**Step 2: Render and verify**

Run: `quarto render projects.qmd`
Expected: Projects page has consistent colors and clean spacing

**Step 3: Commit**

```bash
git add projects.qmd
git commit -m "style: update projects page styling for consistency"
```

---

### Task 8: Final verification — full site render and mobile check

**Files:**
- All modified files

**Step 1: Full site render**

Run: `quarto render`
Expected: No errors, all pages render successfully

**Step 2: Check rendered output**

Run: `ls _site/` to verify all expected pages exist.

**Step 3: Commit all remaining changes**

```bash
git add -A
git commit -m "style: complete website redesign — clean minimal theme"
```
