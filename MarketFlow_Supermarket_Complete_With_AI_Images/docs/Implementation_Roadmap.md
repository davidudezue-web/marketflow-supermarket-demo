# MarketFlow — Implementation Roadmap
**Prepared by:** Chukwuemeka David Udezue | Blossom Graphviz Concept  
**System:** Fictional supermarket sales and operations concept  
**Current stage:** Responsive static website and browser-local demonstration only

## Evidence boundary
MarketFlow is a synthetic supermarket concept inspired by an earlier coffee-shop analytics assessment. Its illustrative sales and waste benchmark values are reused only for interface testing. **No real supermarket data, client contract, commercial outcome, cloud backend, payment processing or production operations have been established.** Do not present the synthetic analytics or generated illustrations as real business records or documentary proof.

## Completed in the supplied package
1. Mobile-responsive supermarket storefront with 24 fictional products, 9 original SVG illustrations and 3 fictional outlets.
2. Search, department filtering and price/name sorting.
3. Shopping cart with quantity validation against browser-local stock.
4. Demonstration checkout with fictitious customer names, pickup choice, receipt and print-to-PDF support.
5. Browser-local order management: received / ready / completed statuses, +10 stock adjustment, reset, CSV export.
6. Interactive SVG analytics explorer: category, outlets, time-of-day, weekday and perishable waste benchmarking.
7. Reproducible project case study with 10-stage workflow and downloadable synthetic catalog, store summaries and analytical aggregates.
8. Source-controlled, GitHub Pages-ready HTML/CSS/JavaScript and downloadable documentation.

## What GitHub Pages cannot do alone
A static deployment cannot securely store shared customer orders, charge credit cards, authenticate staff, prevent concurrent overselling, process payment webhooks or send reliable order notifications. Browser-local order data is isolated to each device/browser and is not a real commercial transaction.

## Production roadmap
### Phase 1 — Confirm real business requirements
- Obtain an actual business agreement and permission to use real product and transaction data.
- Document legal entity, outlets, service regions, taxes, acceptable payments, order fulfilment, cancellation, returns, invoice requirements and data-protection policies.
- Define customer workflows, staff roles, service-level goals and success KPIs.

### Phase 2 — Cloud backend and secure identities
- Provision a separate Supabase project (or Azure-managed PostgreSQL + API).
- Execute and review the `cloud/supabase_schema.sql` starter. It intentionally does **not** permit anonymous writes.
- Configure RLS policies, identity providers, staff roles, environment separation, backups, rate limiting and audit logging.
- Store private credentials in server environment variables, never on a public GitHub Pages frontend.

### Phase 3 — Transactional checkout
- Replace localStorage checkout with a secure backend endpoint.
- Recalculate total price on the server and enforce per-item validation and available stock under a database transaction.
- Reserve quantities, generate order and items atomically, and return an order reference.
- Use hosted payment provider with signed webhook validation, idempotency and refund flows.
- Test negative inventory, duplicate payments, failed network calls and concurrent purchases.

### Phase 4 — Fulfilment and inventory
- Protected roles: owner, manager, cashier, stock officer.
- Receive, pick, pack, dispatch/pickup and complete orders with timestamps.
- Track purchases, receiving, transfers, returns, sales, damage, waste, expiry and adjustments.
- Reconcile inventory daily, review anomalies and record audit events.

### Phase 5 — Analytics and automation
- Ingest validated order-level facts, date dimensions, product/outlet dimensions and inventory movement events.
- Publish role-appropriate Power BI dashboards using incremental refresh where needed.
- Monitor revenue, average basket value, transactions/hour, returns, gross margin, sell-through and weighted waste.
- Use AI only with explicit validation, privacy controls and human oversight of recommendations.

### Phase 6 — Security, compliance and launch
- Data privacy notices, consent where appropriate, least-privilege role access and retention schedules.
- Accessibility, mobile, browser and device testing.
- Performance monitoring, backups, incident response and customer support.
- Signed acceptance and live operations training.

## Deployment on GitHub Pages
1. Create a new public repository, e.g. `marketflow-supermarket-demo`.
2. Upload **contents** of the ZIP root: `index.html`, `operations.html`, `case-study.html`, `architecture.html`, `assets/`, `data/`, `docs/`, `cloud/`, `README.md`, `.nojekyll`.
3. Settings → Pages → Deploy from branch → `main` → `/ (root)` → Save.
4. Test the published URL on desktop and mobile. Use a different repository from your coffee-shop project if you wish to keep both.
5. Test order creation and local dashboard in the **same browser**. Orders are not synchronised across devices.

## Portfolio integrity
- Distinguish synthetic demonstration data from verified real-client projects.
- Do not modify actual coffee-shop screenshots and relabel them as authentic supermarket screenshots.
- Use the included original supermarket UI and illustration assets for public portfolio images.
- Replace fictional brand with a real client's brand only with their permission.
