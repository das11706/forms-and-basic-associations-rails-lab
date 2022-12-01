class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(contents)
    # self.notes = contents.map { |n| Note.new(:content => n) }
    contents.each do |content|
      if content.strip !=""  
      self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.map { |n| n[:content] }
  end

  # def notes_id=(id)
  #   self.notes = Note.find_or_create_by(id: id)
  # end

  # def notes_id
  #   self.notes
  # end
end


# def notes_ids=(ids)
#   ids.each do |id|
#     note = Note.find_or_create_by(id: id)
#     self.notes << note
#   end
# end