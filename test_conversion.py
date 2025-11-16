#!/usr/bin/env python3

from docx_utils import convert_md_to_docx, get_docx_bytes
import os

def test_conversion():
    # Read sample.md content
    try:
        with open('sample.md', 'r', encoding='utf-8') as f:
            md_content = f.read()

        print('Testing conversion of sample.md...')
        print(f'Markdown content length: {len(md_content)} characters')

        # Convert to docx
        doc = convert_md_to_docx(md_content)
        if doc:
            print('[PASS] Conversion to docx successful')

            # Get bytes
            docx_bytes = get_docx_bytes(doc)
            if docx_bytes:
                print(f'[PASS] Generated docx bytes: {len(docx_bytes)} bytes')

                # Save the docx for manual inspection
                with open('test_output.docx', 'wb') as f:
                    f.write(docx_bytes)
                print('[PASS] Saved test_output.docx for manual inspection')

                print('[PASS] All tests passed!')
                return True
            else:
                print('[FAIL] Failed to generate docx bytes')
        else:
            print('[FAIL] Failed to convert markdown to docx')
    except Exception as e:
        print(f'[ERROR] Error during testing: {str(e)}')
        import traceback
        traceback.print_exc()

    return False

if __name__ == "__main__":
    test_conversion()
