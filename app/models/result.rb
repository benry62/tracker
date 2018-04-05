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
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = find_by(id: row["id"]) || new
      product.attributes = row.to_hash
      product.save!
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
