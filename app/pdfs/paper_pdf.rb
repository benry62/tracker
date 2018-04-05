class PaperPdf < Prawn::Document
  def initialize(paper)
    super(top_margin: 70)
    @paper = paper
    #@view = view
    paper_number
    line_items
  end

  def paper_number
    text @paper.test.name, size: 25, style: :bold
    text @paper.name, size: 20
  end

  def line_items
    move_down 20
    table line_item_rows do
      row(0).font_style = :bold
      columns(1..3).align = :center
      self.header = true
    end
  end

  def line_item_rows
    [["Number", "Max Score", "MW video", "MW number"]] +
    @paper.questions.map do |item|
      [item.question_number, item.max_score, item.MW_text, item.MW_number]
    end
  end


end
