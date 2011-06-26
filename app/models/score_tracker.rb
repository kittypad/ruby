class ScoreTracker < ActiveRecord::Base
  belongs_to :child
  belongs_to :client_application
  validates_presence_of :score
  validates_numericality_of :score

  before_save :check_score_count
  after_save :add_score

  attr_accessor :upgrade

  protected
    def check_score_count
      sum = ScoreTracker.sum(:score, :conditions => {:child_id => child.id, :client_application_id => client_application.id})
      if client_application.max_score < sum + score
        self.errors.add(:score, "can't add to this child any more")
        false
      end
    end

    def add_score
      client_application.categories.each do |category|
        achievement = child.achievements.where(:category_id => category.id).order('score desc').first
        if achievement
          achievement.score += score
          new_grade = Grade.by_score(achievement.score).first
          if achievement.grade != new_grade
            self.upgrade = true
            achievement.grade = new_grade
            child.bonus.create
          end
          achievement.save
        else
          grade = Grade.order("min_score asc").first
          achievement = child.achievements.create(:category => category, :grade => grade, :score => score)
        end
      end
    end
end
