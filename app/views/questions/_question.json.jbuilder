json.extract! question, :id, :max_score, :paper_id, :content, :tier, :strand, :summary, :MW_number, :MW_text, :created_at, :updated_at
json.url question_url(question, format: :json)
