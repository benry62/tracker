class PaperPdf < Prawn::Document
  def initialize(paper, assignment)
    super(top_margin: 70)
    @paper = paper
    @students = assignment.class_group.students
    @assignment = assignment
    @students.each do |student|
      strap
      paper_number(student)
      header_row
      line_items(student)
      start_new_page
    end

  end

  def paper_number(student)
    text @paper.test.name, size: 25, style: :bold
    text @paper.name, size: 20
    text student.first_name + " " + student.last_name, size: 15
    text @assignment.class_group.name, size: 15
  end

  def strap
    ["How you did", "What you need to do now"]
  end

  def header_row
    ["Number", "Max \nScore", "Your \nScore", "MW video", "MW \nnumber", "Date \nCompleted"]
  end


  def line_items(student)
    move_down 20
    #table([header_row], [header_row])
    table(  [strap ],:column_widths => [139, 395], :cell_style => {:background_color => "afafaf", :font_style => :bold} )
    table(  [header_row ],:column_widths => [55, 42, 42, 275, 50, 70], :cell_style => {:background_color => "cccccc"} )
    table(  line_item_rows(student), :column_widths => [55, 42, 42, 275, 50, 70] )

  end

  def line_item_rows(student)
    app = []
    student.results.each do |item|
      app<<[item.question.question_number, item.question.max_score, item.score, item.question.MW_text, item.question.MW_number, ""]
    end
    app
  end


end
