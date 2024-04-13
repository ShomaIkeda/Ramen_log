class Public::HomesController < ApplicationController
  
  def top
  end
  
  def search
    @model = params['search']['model']
    @content = params['search']['content']
    @method = params['search']['method']
    @result = search_for(@model, @content, @method)
  end

  private

  def search_for(model, content, method)
    if model == 'user'
      if method == 'forward'
        User.where(
          'nickname LIKE ? ',
          "#{content}%"
        )
      elsif method == 'backward'
        User.where(
          'nickname LIKE ? ',
          "%#{content}", 
        )
      elsif method == 'perfect'
        User.where(
          'nickname = ?',
          content, 
        )
      else # partial
        User.where(
          'nickname LIKE ? ',
          "%#{content}%", 
        )
      end
    elsif model == 'shop'
      if method == 'forward'
        Shop.where('shop_name LIKE ?', content + '%')
      elsif method == 'backward'
        Shop.where('shop_name LIKE ?', '%' + content)
      elsif method == 'perfect'
        Shop.where(shop_name: content)
      else # partial
        Shop.where('shop_name LIKE ?', '%' + content + '%')
      end
    else
      [] 
    end
  end
end
