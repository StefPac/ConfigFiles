# zhs 
# model: gpt-4 is in private beta (have to get from waitlist)
# model: gpt-3.5-turbo (if you don't have access)

#define a function in zsh
[[ ! -f $HOME/.ssh/openai_api.key ]] || source $HOME/.ssh/openai_api.key

hey_gpt() {
  if [[ ! $+commands[curl] ]]; then echo "Curl must be installed."; return 1; fi
  if [[ ! $+commands[jq] ]]; then echo "Jq must be installed."; return 1; fi
  if [[ ! -v OPENAI_API_KEY ]]; then echo "Must set OPENAI_API_KEY to your API key"; return 1; fi

  curl https://api.openai.com/v1/chat/completions -s \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d '{
    "model": "gpt-4",
    "messages": [{"role": "system", "content": "you''re an in-line zsh assistant running on linux. Your task is to answer the questions without any commentation at all, providing only the code to run on terminal. You can assume that the user understands that they need to fill in placeholders like <PORT>. You''re not allowed to explain anything and you''re not a chatbot. You only provide shell commands or code. Keep the responses to one-liner answers as much as possible. Do not decorate the answer with tickmarks"}, {"role": "user", "content": "'"$*"'"}]
  }' | jq -r '.choices[0].message.content'
}

alias ,h=hey_gpt
