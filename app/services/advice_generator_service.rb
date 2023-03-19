class AdviceGeneratorService
  def self.generate_absurd_advice(keywords)
    combined_keywords = combine_keywords(keywords)
    prompt = "Generate an absurd advice based on these keywords: #{combined_keywords}"
    response = call_openai_api(prompt)
    response.dig("choices", 0, "message", "content")
  end

  private

  def self.combine_keywords(keywords)
    keywords.join(", ")
  end

  def self.call_openai_api(prompt)
    client = OpenAI::Client.new
    client.chat(
      parameters: {
        model: "gpt-4",
        messages: [{role: "user", content: prompt}],
        max_tokens: 500,
        n: 1,
        stop: nil,
        temperature: 0.8
      }
    )
  end
end
