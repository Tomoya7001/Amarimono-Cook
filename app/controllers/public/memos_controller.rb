class Public::MemosController < ApplicationController
  def index
    @memo = Memo.new
    @memos = current_customer.memos
  end

  def create
    if current_customer.email == "guest@guest.com"
      redirect_to root_path, notice: 'ゲストログインではこちらの機能は使えません。'
    else
      memo = current_customer.memos.build(memo_params)
      memo.save!
      redirect_to public_customer_memos_path(current_customer.id)
    end
  end

  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    redirect_to public_customer_memos_path(current_customer.id), notice: 'メモを削除しました'
  end

  def destroy_all
    @memos = Memo.all
    @memos.destroy_all
    redirect_to public_customer_memos_path(current_customer.id), notice: '全てのメモを削除しました'
  end

   private

  def memo_params
    params.require(:memo).permit(:name)
  end

end
