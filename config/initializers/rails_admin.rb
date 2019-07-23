RailsAdmin.config do |config|
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  
  config.excluded_models = ["AuthorBook", "BookCategory", "Photo", "Picture"]
  
  config.model 'Book' do
    show do
      exclude_fields :rates
    end
    edit do
      exclude_fields :rates
    end
  end
  
  config.model 'Review' do
    edit do
      exclude_fields :likes, :comments
    end
  end
  
  config.model 'User' do
    edit do
      exclude_fields :reset_password_sent_at, :remember_created_at, :sign_in_count,
        :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip,
        :password, :password_confirmation, :active_relationships,
        :passive_relationships, :following, :followers, :comments, :reviews
    end
  end
end
