#!/usr/bin/env python3
"""Extract one Dropzone Commander stat-card page for transcription.

Usage:
    python extract_card.py "<pdf path>" <page number, 1-indexed> "<output dir>"

Writes  <out>/page<N>.png   (rendered at 220 dpi for visual verification)
Prints  - the card text as coordinate-clustered visual rows
        - a raw  x0 / y / size / text  dump

The stat cards are laid out as absolutely-positioned grids; a plain text
extraction interleaves the columns and values. The coordinates are what let you
put each stat back with the right weapon/row. Always also open the PNG and check
every number by eye.
"""
import sys
import pdfplumber
import pymupdf


def main() -> int:
    if len(sys.argv) != 4:
        print(__doc__)
        return 2
    pdf_path, page_arg, out_dir = sys.argv[1], sys.argv[2], sys.argv[3].rstrip("\\/")
    page_no = int(page_arg)
    idx = page_no - 1

    doc = pymupdf.open(pdf_path)
    if not (0 <= idx < doc.page_count):
        print(f"page {page_no} out of range (pdf has {doc.page_count} pages)")
        return 1
    img = f"{out_dir}\\page{page_no}.png"
    doc[idx].get_pixmap(dpi=220).save(img)
    print(f"# rendered {img}  ({doc.page_count} pages total)\n")

    with pdfplumber.open(pdf_path) as plumb:
        pg = plumb.pages[idx]
        words = pg.extract_words(
            use_text_flow=False, keep_blank_chars=False, extra_attrs=["size"]
        )

    # cluster words into visual rows by their 'top' coordinate
    words.sort(key=lambda w: (w["top"], w["x0"]))
    rows, cur, cur_top = [], [], None
    for w in words:
        if cur_top is None or abs(w["top"] - cur_top) <= 4.5:
            cur.append(w)
            cur_top = w["top"] if cur_top is None else cur_top
        else:
            rows.append(cur)
            cur, cur_top = [w], w["top"]
    if cur:
        rows.append(cur)

    print("=" * 72)
    print(f"PAGE {page_no} — visual rows (left-to-right, ~4.5pt row tolerance)")
    print("=" * 72)
    for r in rows:
        r.sort(key=lambda w: w["x0"])
        top = min(w["top"] for w in r)
        print(f"[y={top:6.1f}]  " + "  ".join(w["text"] for w in r))

    print("\n" + "=" * 72)
    print(f"PAGE {page_no} — every word:  x0 / y / size / text")
    print("=" * 72)
    for w in sorted(words, key=lambda w: (round(w["top"], 1), w["x0"])):
        print(f"{w['x0']:6.1f} {w['top']:6.1f}  sz{w['size']:4.1f}  {w['text']}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
