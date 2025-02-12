from llama_cpp import Llama
from langchain.prompts import PromptTemplate

template = """<s>[INST] <<SYS>>
Maintain context of the conversation.
<</SYS>>
{chat_history}
Human: {human_input}
AI: [/INST]"""

prompt = PromptTemplate(input_variables=["chat_history", "human_input"], template=template)

chat_history = ""
model = Llama(model_path="gguf")

while True:
    human_input = input("Human: ")
    full_prompt = prompt.format(chat_history=chat_history, human_input=human_input)
    response = model(full_prompt, max_tokens=100, stop=["Human:", "\n"])
    print("AI:", response['choices'][0]['text'])
    chat_history += f"Human: {human_input}\nAI: {response['choices'][0]['text']}\n"
