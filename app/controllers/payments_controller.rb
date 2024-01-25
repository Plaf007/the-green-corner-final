class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:process_payment]
  def new
  end

  def process_payment
    require 'mercadopago'
    sdk = Mercadopago::SDK.new("TEST-6383646141679501-012016-1b9133c42c161f460ca677446d10504d-72535328")
    payment_data = {
      transaction_amount: params[:transaction_amount].to_f,
      token: params[:token],
      description: params[:description],
      installments: params[:installments].to_i,
      payment_method_id: params[:payment_method_id],
      payer: {
        email: params['payer']['email'],
        identification: {
          type: params[:identificationType],
          number: params[:identificationNumber]
        },
        first_name: params[:cardholderName]
      }
    }
    payment_response = sdk.payment.create(payment_data)
    payment = payment_response[:response]
    resultado = JSON.parse(payment.to_json)
    pp resultado
    redirect_to orders_path
    end
  end
