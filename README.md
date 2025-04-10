# Markdown Viewer

A Streamlit-based web application that allows users to convert and preview Markdown text in real-time, with the ability to download the content in both Markdown and Word document formats.

## Features

- Real-time Markdown preview
- Text input with syntax highlighting
- Download options:
  - Markdown file (.md)
  - Word document (.docx)
- User-friendly interface with custom styling
- Markdown tips and guidance

## Tech Stack

- **Frontend**: Streamlit
- **Backend**: Python
- **Key Libraries**:
  - `streamlit`: Web application framework
  - `python-docx`: Word document creation and manipulation
  - `markdown`: Markdown to HTML conversion
  - `beautifulsoup4`: HTML parsing for document conversion

## Getting Started

1. Clone the repository
2. Install the required dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Run the application:
   ```bash
   streamlit run app.py
   ```

## Usage

1. Enter your Markdown text in the provided text area
2. View the real-time rendered output
3. Use the download buttons to save your content as:
   - Markdown file (.md)
   - Word document (.docx)

## Markdown Support

The application supports standard Markdown syntax including:
- Headers (#, ##, ###)
- Bold and italic text
- Lists (ordered and unordered)
- Links
- Inline code
- Line breaks
- Preserved whitespace

## License

This project is open source and available under the MIT License. 