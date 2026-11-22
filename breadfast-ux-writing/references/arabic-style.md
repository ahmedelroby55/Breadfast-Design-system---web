# Breadfast UX Writing — Arabic (العربية)

Full Arabic guidelines. Table of contents:
1. Register / formality mapping (which Arabic to use where)
2. Grammar & style (voice, pronouns, tashkeel, numerals, dates, money, punctuation)
3. Word choices (politeness, terminology, positive framing, words to avoid)
4. Component rules
5. Common typos & fixes
6. Plurals & number agreement

---

## 1. Register / formality mapping

Arabic copy uses **three registers** — pick by context. "Serious isn't the same as formal."

| Register | Use for | Character |
|---|---|---|
| **Egyptian (عامية)** | notifications, marketing, promos; most **delivery-associate / captain** app copy | friendly, close, conversational |
| **Hybrid MSA-Egyptian** | buttons, transactions, success messages, empty states | clear MSA verbs + natural everyday words; familiar but not stiff |
| **Modern Standard Arabic (فصحى)** | errors, legal content, policies | professional, credible, serious |

Quick table:
| Content | Register | Example |
|---|---|---|
| Payment button | Hybrid | ادفع دلوقتي |
| Promo button | Egyptian | اطلب دلوقتي |
| Error message | MSA | أدخل بريدًا صحيحًا. |
| Success message | Hybrid | تم الدفع بنجاح. |
| Delivery notification | Egyptian | طلبك في الطريق ليك! |
| Empty state | Hybrid | السلة فاضية. جاهز للتسوق؟ |
| Terms & conditions | MSA | باستخدامك للتطبيق، فإنك توافق على الشروط. |

Casual counterparts of formal phrases: المساعدة/المعاونة, يخلي/يسمح, لكن/بس, عشان/لـ, ياخد, يدي, محتاج, يصلح, عشان كده/فـ.

## 2. Grammar & style

### Active vs passive
Active for errors/warnings, success, pop-ups/notifications:
- ✅ أدخل بريدًا إلكترونيًا صحيحًا. ✅ تم الدفع بنجاح. ✅ طلبك في الطريق.
Passive to soften/avoid blame, unknown actor, or legal/policy:
- ✅ تم إيقاف حسابك مؤقتًا. ✅ تم إرسال رمز التحقق. ✅ سيتم معالجة المبالغ المستردة خلال ٥-٧ أيام عمل.

### Pronouns / address
Direct "أنت" / "ـك". **Avoid "حضرتك"** (too formal for a daily-life app). Default to the **masculine** form in impersonal cases (Egyptian-market standard) unless the system knows the user's gender.

### Tashkeel (diacritics)
**Don't use tashkeel in UX text** — it makes on-screen text heavier and harder to read (سلة التسوق, not سَلَّة التَّسَوُّق). **Exception:** when a bare word is genuinely ambiguous, keep the needed mark — e.g. حدّثه (update it, not "happened"), فعّل (activate, not "did"), سلّم (hand over). Educational content may use tashkeel.

### Numerals
Arabic-Indic (٠،١،٢…) is the guideline default in Arabic copy (٩٩٩، ١٬٠٠٠، ١٥٬٠٠٠). **But follow the user's/project's instruction** — many Breadfast screens keep Western digits, and IDs / reference numbers / codes stay exactly as shown regardless. Numbers over 3 digits get a thousands separator.

### Time / dates
12-hour with ص/م and a space (٢٠ ديسمبر ٢٠٢٤، ٠٧:٥٢ م). Day-month-year; abbreviate month ("٣١ ديسمبر ٢٠٢٥"). For English-digit projects: "25 أبريل 2025" (month name in Arabic, digits per convention).

### Percentages / money
`٪` symbol. Currency code **after** the amount in Arabic (٠٫٠٠ جنيه ; "ج.م" after the number).

### Punctuation
- **Arabic comma ،** — never the Latin "," (fix "اليوم , 24 مارس" → "اليوم، 24 مارس").
- **No space before** ؟ or : (fix "مشكلة ؟" → "مشكلة؟", "للعميل : " → "للعميل:").
- The waw و attaches to the next word with no space (واتأكد، وتحتفظ — not "و اتأكد").
- End instructional messages with a full stop; between two short sentences use a full stop, not a comma.
- `&` → spell out "و" in body text.

## 3. Word choices

### Politeness
- Skip **"من فضلك"** in routine instructions / errors / buttons. "اختر طريقة الدفع" not "من فضلك اختر…". ("من فضلك" is more common in Arabic than English — reserve it for sensitive requests like entering personal info, or legal/banking.)
- Avoid **"برجاء"** (please) the same way.
- Helpful, not apologetic: "رقم الهاتف مسجل بالفعل. جرب رقمًا آخر." not "عفواً، هذا الرقم مستخدم بالفعل".

### Terminology (keep consistent)
- Breadfast product names stay in English where branded: بطاقة Breadfast, Brekkie by Breadfast, Breadfast Pay.
- QR code → الكود (short form) or كود QR. Counter/cashier → الكاشير. Barista → الباريستا. Branch → الفرع. Machine → ماكينة (not "مكن/مكنة").
- Avoid technical jargon (API→الخدمة, Bug→مشكلة). Don't use: خطأ (say المشكلة / be specific), أوبس, فشل (say "لم يتم"), غير صالح (say "غير صحيح" / "تحقق من…").

### Positive framing
Say what the user can do:
- "أضف عنوانًا للمتابعة" not "لا يمكنك الطلب بدون عنوان".
- "اختر طريقة دفع صحيحة" not "لا يمكن معالجة الطلب".

### Exclamation marks / emoji
Sparingly, for genuinely good news (launches, offers, delivery). Not for routine confirmations, errors, instructions. Emoji only in marketing/celebratory notifications.

## 4. Component rules

- **Titles:** sentence-style; start with a verb ("إلغاء الطلب"); specific not generic; avoid unnecessary particles; action first; **not a question.**
- **Buttons:** start with a strong verb (ادفع، أرسل، أكد); short (1-3 words — Arabic may be a touch longer than English); clear on its own; no first-person. Hybrid for primary/transaction buttons, Egyptian for promo buttons.
- **Placeholders:** brief; sentence style; **no full stop.**
- **Messages:** no jargon, no "من فضلك"; clear and concise; don't repeat; end with a full stop.
- **Error / success:** brief. Error → MSA; success → Hybrid. Prefer "تمت" over "تم" for brevity with feminine objects.
- **Bottom sheets / pop-ups:** scan order **العنوان → CTA → النص**. Primary action in headline + CTA; short subtitle; don't duplicate headline and CTA exactly; title not a question. Hybrid for transactional sheets, Egyptian for promo sheets.
- **Empty pages:** concise title ("لا توجد طلبات بعد"); brief message starting with a verb; add a CTA. Hybrid.
- **Tooltips:** short (~120 Arabic characters).
- **Notifications:** Egyptian; concise and direct; excitement OK ("طلبك في الطريق ليك!", "الخبز الطازج وصل!").
- **Length:** Arabic runs ~20-30% longer than English — buttons 1-3 words, tooltips ~120 chars; errors favor clarity over brevity.

## 5. Common typos & fixes (seen across Breadfast files)

Spelling / hamza:
- اجمالي → **إجمالي**
- الابلاغ / أبلاغ → **الإبلاغ**
- تاكيد → **تأكيد** · تاكد → **تأكد**
- مأكد → **مؤكد** · غير مأكد → **غير مؤكد**
- ايصال → **إيصال** · ايداع/ايداعه → **إيداع/إيداعه**
- ادخال → **إدخال** · اسناد → **إسناد**
- وسلية → **وسيلة**
- هياكد → **هيأكد**
- الرقم المشكلة → **رقم المشكلة** (fix the double article / إضافة)
- "علي" meaning *on* → **على** (careful: don't touch عليك)
- "او" → **أو** · "اي" → **أي**
- مكن / مكنة → **ماكينة**

Grammar / agreement:
- "لا يوجد منتجات" → **لا توجد منتجات** (feminine plural agreement)

Punctuation / format:
- "اليوم , 24 مارس" → **اليوم، 24 مارس** (Latin comma → Arabic)
- "للعميل : 50" → **للعميل: 50** (space before colon)
- trailing-minus amounts: "2000- ج.م" → **-2,000 ج.م**; add thousands comma ("2500 ج.م" → "2,500 ج.م").

## 6. Plurals & number agreement

Arabic changes the counted word by number — English has one form, Arabic needs several. Flag where one hardcoded form won't cover a range, and provide the variants:
- **1:** يوم واحد / ختم واحد / مشروب واحد
- **2:** يومان / مشروبان (dual)
- **3-10:** {n} أيام / أختام / مشروبات (plural)
- **11+:** {n} يومًا / ختمًا / مشروبًا (singular accusative — *tamyiz*)

A line like "{days} days left" may therefore need separate Arabic strings for the 3-10 and 11+ ranges. One common way to avoid the forms is to drop the counted noun entirely ("باقي {left} للحصول على قهوة مجانية") — a valid, consistent choice.
