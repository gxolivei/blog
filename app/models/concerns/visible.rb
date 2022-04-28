module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private', 'archived']

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def public_count
      where(status: 'public').count
    end

    def public_count_message
      if public_count == 0
        message = "Our blog has 0 articles!"
      elsif public_count == 1
        message = "Our blog has 1 article!"
      else
        message = "Our blog has #{Article.public_count} articles and counting!"
      end
    end
  end

  def archived?
    status == 'archived'
  end
end