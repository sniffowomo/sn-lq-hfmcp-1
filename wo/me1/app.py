###########
# Main gradio app, tutorial mcp server
###########

import gradio as gr

MAIN_TEXT = """
# me1test1

> Liqo to sniffo where

1. Testing out markdown in the tab
2. Note this uses `gr.blocks`
"""

# Use Blocks to make a non-interactive markdown display
with gr.Blocks() as intro_page:
    gr.Markdown(MAIN_TEXT)

hello_world = gr.Interface(fn=lambda name: "Hello " + name, inputs="text", outputs="text")
bye_world = gr.Interface(fn=lambda name: "Bye " + name, inputs="text", outputs="text")
chat = gr.ChatInterface(fn=lambda *args: "Hello " + args[0])

demo = gr.TabbedInterface(
    [intro_page, hello_world, bye_world, chat],
    ["Intro Page", "Hello World", "Bye World", "Chat"],
)

if __name__ == "__main__":
    demo.launch()
