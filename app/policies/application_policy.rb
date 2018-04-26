class ApplicationPolicy

  attr_reader :context,:record

    def initialize(context,record)
      @user = context.user
      @account = context.account
      @record = record
    end

    #delegate :current_user, to: :context
    #delegate :current_account to: :context
  #
  # attr_reader :user, :record
  #
  # def initialize(user, record)
  #   @user = user
  #   @record = record
  # end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
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

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end
    def resolve
      scope
    end
  end
end
