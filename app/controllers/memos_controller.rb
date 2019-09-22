class MemosController < ApplicationController
  def index
    @newmemo =Memo.new
    @memos = Memo.includes(:user).order("created_at DESC")
    @today = Date.current.strftime("%Y年%m月%d日")
  end

  def show
  end

  def new
    @memo = Memo.new
  end

  def edit
  end

  def create
    Memo.create(memo_params)
    respond_to do |format|
      format.html {redirect_to :root}
      format.json 
    end
  end


  def update
    @memo = Memo.find(params[:id])
    respond_to do |format|
      if @memo.update(memo_params)
        format.html { redirect_to @memo, notice: 'Memo was successfully updated.' }
        format.json { render :show, status: :ok, location: @memo }
      else
        format.html { render :edit }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    memo= Memo.find(params[:id])
    memo.destroy if memo.user_id == current_user.id
    redirect_to :root
  end

  private
    def set_memo
      @memo = Memo.find(params[:id])
    end

    def memo_params
      params.require(:memo).permit(:text,:title,:deadline,:category_id).merge(user_id: current_user.id)
    end
end
