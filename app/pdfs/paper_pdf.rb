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
    table(  [strap ],:column_widths => [139, 395], :cell_style => {:background_color => "ccddff", :font_style => :bold} )
    table(  [header_row ],:column_widths => [55, 42, 42, 275, 50, 70], :cell_style => {:background_color => "80aaff"} )
    table(  line_item_rows(student), :column_widths => [55, 42, 42, 275, 50, 70] )
  end

  def set_bg_colour(result)
    max_score = result.question.max_score
    student_score = result.score
    bg_color = "ff99dd"
    if student_score == max_score
      bg_color = "33cc33"

    elsif student_score == 0
      bg_color = "ff0000"

    elsif student_score.between?(student_score, max_score)
      bg_color = "ffff00"

    end
    bg_color
  end


  def line_item_rows(student)
    app = []
    student.results.each do |item|
      cell_1 = make_cell(:content => item.question.question_number)
      cell_2 = make_cell(:content => item.question.max_score.to_s, :align => :center)
      cell_3 = make_cell(:content => item.score.to_s, :align => :center, :background_color => set_bg_colour(item))
      cell_4 = make_cell(:content => item.question.MW_text)
      cell_5 = make_cell(:content => item.question.MW_number)
      cell_6 = make_cell(:content => "")
      app << [cell_1, cell_2, cell_3, cell_4, cell_5, cell_6]
    end
    app
  end


end
