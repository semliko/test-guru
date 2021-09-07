class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show ]

  def index
    @contacts = Contact.all
    redirect_to new_contact_path
  end

  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to @contact, notice: t('.success')
      ContactMailer.with(email_data: @contact).contact_us_email.deliver_now
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
