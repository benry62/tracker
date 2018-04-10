class Assignment < ApplicationRecord
  belongs_to :test
  belongs_to :class_group



  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    question_ids = spreadsheet.row(1)
    (3..spreadsheet.last_row).each do |i|
      student_id = spreadsheet.row(i)[0]
      (3..question_ids.count).each do |j|
        result = Result.new
        result.student_id = student_id
        result.question_id = question_ids[j]
        result.score = spreadsheet.row(i)[j]
        result.save
        #puts i.[0]
        #puts q


      end
    end

  end


  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
  end
end

end
