class Student < ApplicationRecord
  belongs_to :class_group
  has_many :results


  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :class_group, presence: true


  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      #are we making a new student or updating existing?
      if row["student_id"]
        student = find_by(student_id: row["student_id"])
      else
        student = Student.new
      end
      class_group = ClassGroup.find_by(name: row["set"])
      # is the data in the right columns, or is it last_name, first_name
      if row["name"]
        names = row["name"].split(",")
        student.first_name = names[1].strip
        student.last_name = names[0].strip
      else
        student.first_name = row["first_name"]
        student.last_name = row["last_name"]
      end
      student.class_group_id = class_group.id
      student.save!
    end
  end


end
