class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @record = record
  end

  def policy_name
    self.class.to_s.underscore
  end

  def policy_error_message!(error_key=nil, &block)
    error_key = block.call if block_given?
    if error_key.present?
      @policy_error_message = I18n.t("#{policy_name}.#{error_key}", scope: "pundit", default: :default)
    end
  end

  def index?
    false
  end

  def show?
    true
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
