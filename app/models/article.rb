class Article < ApplicationRecord
    include Visible

    has_many :comments, dependent: :destroy
    
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    
    before_save :replace_title_with_subject
    before_update :replace_title_with_subject
    after_find :replace_title_with_subject

    private 
        def replace_title_with_subject
            begin
                self.subject = self.title

            rescue => e
                puts e.message
            end
            
            begin
                self.title = self.subject
            rescue => e
                puts e.message
            end
        end
end
