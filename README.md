# MarketFlow — Supermarket Operations Studio
**A professional, interactive supermarket storefront + operations dashboard + analyst case study.**  
**Built for:** Chukwuemeka David Udezue (Crafttmeal) · Blossom Graphviz Concept  
**Status:** Functional browser-local demonstration; cloud/production implementation planned, not deployed.

## Read this first
This is a **fictional supermarket demonstration**. It does not document a commissioned supermarket engagement or actual supermarket sales. Illustrative historical metrics match selected aggregates from a separate coffee-shop analytics learning exercise and have been adapted solely for UI demonstration. The re-captioned product examples are synthetic and must not be presented as authentic source evidence.

## Site structure
- `index.html` — modern customer storefront, product browsing, local cart and checkout, demo receipt.
- `operations.html` — interactive baseline and local-activity analytics, store filtering, order management, stock controls and CSV exports.
- `case-study.html` — analyst's professional portfolio case study, 10-stage methodology, findings, downloadable synthetic assets and contact links.
- `architecture.html` — real-world operating model and production requirements.
- `assets/styles.css` — responsive design system, 3D/animated styling.
- `assets/app.js` — all browser interactions, UI rendering, charts and local persistence.
- `assets/data.js` — embedded synthetic sample catalog and aggregated numbers to support `file://` previews.
- `assets/img/*.svg` — original supermarket and product illustrations included in the download.
- `data/*.json`, `data/*.csv` and `data/*.xlsx` — auditable synthetic catalog, outlet summaries, prepared workbook and aggregate benchmark data.
- `docs/MarketFlow_Project_Methodology.pdf` — downloadable report.
- `docs/Implementation_Roadmap.md` — cloud deployment plan, privacy and operations considerations.
- `cloud/supabase_schema.sql` — safe starter SQL; not a production checkout implementation.
- `.nojekyll` — avoids unnecessary Jekyll processing on GitHub Pages.

## Test locally
1. Extract the ZIP and open `index.html` in Chrome or Edge. No Node build step is needed.
2. Browse products, search, filter and add items.
3. Open Basket → Continue to demo checkout. Enter a fictitious name and select an outlet.
4. Place demo order. Open printable receipt.
5. Open `operations.html`, switch to **Your demo activity** and see the local order.
6. Update status, replenish stock and export CSV.
7. Reset demo if needed. Data is saved to that browser's localStorage only.

If you prefer localhost: open CMD in the site folder and run `python -m http.server 8000`, then open http://localhost:8000.

## Publish to GitHub Pages
1. Create a **new public repo**, e.g. `marketflow-supermarket-demo`.
2. Upload everything **inside** this project's root, not the outer folder or ZIP.
3. GitHub repository Settings → Pages → Deploy from branch → main → /(root) → Save.
4. Check `https://YOUR-USERNAME.github.io/marketflow-supermarket-demo/` after deployment.
5. Test links, product images, checkout and chart controls on desktop and mobile.
6. Review demo integrity labels before publicly sharing. They are intentionally visible.

## Operational limitations
- **No actual card payments, email notifications or customer accounts**.
- No production Supabase connection; no shared cloud order records.
- Browser-local state is not shared with another user/device and can be lost when site data is cleared.
- No real customer personal data should be entered into the demonstration checkout.
- Operational controls are exposed in a **public prototype** and are not an authenticated admin environment.
- Synthetic historical benchmark revenue figures are **CU**, i.e. generic currency units, not NGN/USD.
- Static chart summaries do not update when new demo orders are created; switch to **Your demo activity** for dynamically generated local aggregates.
- Real deployment requires security/privacy review, backend APIs, data ownership and actual business data.

## Contact
- Analyst/developer: Chukwuemeka David Udezue
- Email: davidudezue@gmail.com
- WhatsApp/phone: +234 813 374 2166
- LinkedIn: https://www.linkedin.com/in/udezue-david-732843246
- Business: Blossom Graphviz Concept


## AI-generated supermarket photographic illustrations (November 2026)
Three original generative illustrative images were added to the storefront and operations pages.
- `assets/img/marketflow-shopping.jpg`: shopper and grocery aisle, homepage hero.
- `assets/img/marketflow-checkout.jpg`: cashier and shoppers, storefront feature section.
- `assets/img/marketflow-inventory.jpg`: inventory team member and stock shelves, operations and case-study pages.
These images depict fictional people and a fictional supermarket. They are not documentary evidence of a real supermarket client, customer, staff member, completed sale, or operating premises.
To update an existing GitHub Pages deployment, replace `index.html`, `operations.html`, `case-study.html`, `assets/styles.css`, and upload all three new images in `assets/img/`. All other files may remain unchanged.
