import streamlit as st

from docx_utils import convert_md_to_docx, get_docx_bytes

def set_page_config():
    st.set_page_config(
        page_title="Markdown Viewer",
        page_icon="favicon.ico",
        layout="wide",
        initial_sidebar_state="expanded"
    )

def add_custom_css():
    st.markdown("""
        <style>
        .main {
            background-color: #f5f5f5;
        }
        .stTextArea textarea {
            font-family: 'Courier New', monospace;
            font-size: 16px;
        }
        </style>
    """, unsafe_allow_html=True)

def display_header():
    col1, col2 = st.columns([1, 18])
    with col1:
        st.image("logo.png", width=100)
    with col2:
        st.title("MD Text Viewer & Converter")

def main():
    set_page_config()
    add_custom_css()
    display_header()
    
    # st.write("Enter MD text in the text area below. The app will render it as Markdown in real-time.")
    
    with st.expander("Markdown Tips", expanded=False):
        st.markdown("""
        **Markdown Tips:**
        - Use `#` for headers (e.g., `# Header 1`)
        - Use `*` or `_` for *italics* and `**` or `__` for **bold**
        - Use `-` or `*` for bullet lists
        - Use `1.`, `2.`, etc. for numbered lists
        - Use `[text](url)` for links
        - Use `` `code` `` for inline code
        - Add two spaces at the end of a line to create a line break  
        - Multiple spaces will be preserved in the output
        """)
    
    # Create a text area for user input
    user_text = st.text_area("Enter MD text here:", height=200)
    
    # Display the rendered markdown and add download button
    if user_text:
        with st.container(border=True):
            st.subheader("Markdown Output:")
            st.markdown(user_text)
        
        # Add download buttons directly
        # Convert to Word and offer download
        doc = convert_md_to_docx(user_text)
        if doc:
            docx_data = get_docx_bytes(doc)
            if docx_data:
                st.download_button(
                    label="Download as Word",
                    data=docx_data,
                    file_name="document.docx",
                    mime="application/vnd.openxmlformats-officedocument.wordprocessingml.document"
                )
            else:
                st.error("Unable to prepare Word document for download.")
        else:
            st.error("Unable to generate Word document.")

        st.download_button(
            label="Download as Markdown",
            data=user_text,
            file_name="document.md",
            mime="text/markdown"
        )
    
if __name__ == "__main__":
    main() 