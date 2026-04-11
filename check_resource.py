import json
import os
import re

YPP_FILE = "duck-in-the-dark.yyp"  # change if needed


def clean_json(text):
    # Remove trailing commas before } or ]
    text = re.sub(r",\s*([}\]])", r"\1", text)
    return text


def main():
    base_dir = os.path.dirname(os.path.abspath(YPP_FILE))

    with open(YPP_FILE, "r", encoding="utf-8") as f:
        raw = f.read()

    cleaned = clean_json(raw)

    try:
        data = json.loads(cleaned)
    except json.JSONDecodeError as e:
        print("❌ Still invalid JSON after cleaning!")
        print(e)
        return

    resources = data.get("resources", [])

    missing = []
    existing = []

    for res in resources:
        try:
            path = res["id"]["path"]
            full_path = os.path.join(base_dir, path)

            if os.path.exists(full_path):
                existing.append(path)
            else:
                missing.append(path)

        except KeyError:
            print(f"⚠️ Skipping malformed resource entry: {res}")

    print("\n=== ✅ Existing Resources ===")
    for p in existing:
        print(f"[OK] {p}")

    print("\n=== ❌ Missing Resources ===")
    for p in missing:
        print(f"[MISSING] {p}")

    print("\n--- Summary ---")
    print(f"Total: {len(resources)}")
    print(f"Existing: {len(existing)}")
    print(f"Missing: {len(missing)}")


if __name__ == "__main__":
    main()