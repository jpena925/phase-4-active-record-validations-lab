class Post < ApplicationRecord
    

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

    validate :clickbait?


    def clickbait?
        clickbait = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]
        if clickbait.none? {|pattern| pattern.match title }
            errors.add(:title, "Title is not clickbait")
        end
    end
    
    # title inaccessible here
    # def clickbait?
    #     clickbait = ["Won't Believe", "Secret", "Top", "Guess"]
    #     if clickbait.none? {|stg| title.include?(stg) }
    #         errors.add(:title, "Title is not clickbait")
    #     end
    # end
    
end
