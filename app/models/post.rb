class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: { minimum:250 }
    validates :summary, length: { maximum:250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}


    # def clickbait(author)
    #     unless author.title.include? "Won't Believe", "Secret", "Top [number]", "Guess"
    #         author.errors[:title] << 'Need a title containing "Won't Believe", "Secret", "Top [number]", "Guess"'
    # end

    # validate :clickbait?

    # def clickbait?
        
    #        unless title && title.match(/(Won't Believe)|(Top \d)|(Secret)|(Guess)/)
        
    #         errors.add(:title, "not clickbait")
    #        end
    
    # end

    validate :clickbait?

    def clickbait?
        if title.to_s.include?("Won't Believe")
             true
        elsif title.to_s.include?( "Secret")
             true
        elsif title.to_s.include?("Top #{0..9}")
            true
        elsif title.to_s.include?("Guess")
             true
        else
            errors.add(:title, "not clickbait")
        end
     end
  

    
end
