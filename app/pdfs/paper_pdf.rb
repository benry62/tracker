class PaperPdf < Prawn::Document
  def initialize(paper, assignment)
    super(top_margin: 70)
    @logo = "#{Rails.root}/app/assets/images/swan_logo.png"
    @paper = paper
    @students = assignment.class_group.students
    @assignment = assignment
    @students.each do |student|
      strap
      sheet_header(student)
      header_row
      line_items(student)
      start_new_page
    end

  end

  def sheet_header(student)
    image @logo, width: 100, position: :right
    move_up 100
    text @paper.test.name, size: 25, style: :bold
    text @paper.name, size: 20
    text student.first_name + " " + student.last_name, size: 18
    text @assignment.class_group.name, size: 18
    y_position = cursor - 20
    bounding_box([180, y_position], :width => 360, :height => 60) do
     transparent(0.5) { stroke_bounds }
     text_box "You are to watch the videos and complete the online tasks for all questions in which you were graded amber or red. Completing this will help you to fill the gaps in your knowledge.",  :at => [10, cursor - 10], :width =>340
    end

  end

  def strap
    ["How you did", "What you need to do now"]
  end

  def header_row
    ["Number", "Max \nScore", "Your \nScore", "MW video", "MW \nnumber", "Date \nCompleted"]
  end


  def line_items(student)
    move_down 20
    table(  [strap ],:column_widths => [132, 407], :cell_style => {:background_color => "ccddff", :font_style => :bold, :size =>11,:align => :center} )
    table(  [header_row ],:column_widths => [52, 40, 40, 289, 48, 70], :cell_style => {:background_color => "80aaff", :size =>11} )
    table(  line_item_rows(student)[0], :column_widths => [52, 40, 40, 289, 48, 70] )

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
      bg_color = "FFBF00"
    end
    bg_color
  end


  def line_item_rows(student)
    app = []
    total_score = 0
    student_score = 0
    student.results.each do |item|
      cell_1 = make_cell(:content => item.question.question_number, :size =>11 )
      cell_2 = make_cell(:content => item.question.max_score.to_s, :align => :center, :size =>11)
      cell_3 = make_cell(:content => item.score.to_s, :align => :center, :background_color => set_bg_colour(item), :size =>11)
      cell_4 = make_cell(:content => item.question.MW_text, :size =>11)
      cell_5 = make_cell(:content => item.question.MW_number, :size =>11)
      cell_6 = make_cell(:content => "")
      app << [cell_1, cell_2, cell_3, cell_4, cell_5, cell_6]
      total_score += item.question.max_score
      student_score += item.score
    end
    [app, total_score, student_score]
  end


end
