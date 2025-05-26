1. [wo](#wo)
2. [Dirz](#dirz)
3. [Regarding Gradio Frmatting](#regarding-gradio-frmatting)

# wo

> Actual work to be done here

# Dirz

|      `Dirz`       |                                                                                      `What`                                                                                      |
| :---------------: | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
|   [`g1`](./g1/)   |                                           Actual example gradio server being written, this also works but unable to call it with curl                                            |
| [`faa1`](./faa1/) | Testing [`Fast-Agent`](https://fast-agent.ai/mcp/state_transfer/#step-3-connect-and-chat-with-agent-one) - this one abandoned since it has to be run locally and asking for keys |
| [`app1`](./app1/) |                                                                      Testing radio mcp server from tutorial                                                                      |
| [`hfu1`](./hfu1/) |                                                                               HuggingFace Uploader                                                                               |
|  [`me1`](./me1/)  |                               Gradio Generael Tests - Main goals of the test is to check UL + DL + Delete with python. And general setup of gradio                               |

# Regarding Gradio Frmatting

1. Use `gr.blocks` which gives flexible layouts
   1. Using `gr.blocks` it is possible to have a mixed layout.
2. Recommended to use thsi over , others which are used in the code such as - `gr.interface`
3. When talking about MCP servers, we have to have a client that communicates with it. To do that, you will take a detour from, the main course and then, look into using nextjs and vercel , which is being used for making general website. Since yo have excuse to smell panty
