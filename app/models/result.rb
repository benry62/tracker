class Result < ApplicationRecord
  belongs_to :student
  belongs_to :question



  def self.to_csv(options = {})
    desired_columns = ["student_id", "question_id", "score"]
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |result|
        csv << result.attributes.values_at(*desired_columns)
      end
    end
  end


  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    # combine the headers
    header = spreadsheet.row(2)[0..2] + spreadsheet.row(1)[3..spreadsheet.row(2).length]
    (3..spreadsheet.last_row).each do |j|
      row = Hash[[header, spreadsheet.row(j)].transpose]
      # result = find_by(student_id: row["student_id"]) || new

      # remove the first and last name before trying to save
      row.delete("first_name")
      row.delete("last_name")
      # now have to step through the array to save them
      # as pairs - taking the student_id and then work
      # through, saving them

      # pop off the first pairs
      student_id = row["student_id"]
      row.delete("student_id")
      att= {}
      row.each { |key, value|
        result = new
        att= {}
        att["student_id"]   = student_id
        att["question_id"]  = key
        att["score"]        = value
        result.attributes = att.to_hash
        result.save!
      }
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
