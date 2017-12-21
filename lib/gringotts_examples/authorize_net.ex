defmodule Kuber.Hex.Examples.AuthorizeNet do

  alias Kuber.Hex.Gateways.AuthorizeNet
  alias Kuber.Hex.CreditCard
  alias Kuber.Hex, as: Billing
  
  @card %CreditCard{
    number: "5424000000000015",
    year: 2020,
    month: 12,
    verification_code: "999"
  }

  @opts [ refId: "123456",
    order: %{invoiceNumber: "INV-12345",
      description: "Product Description"
      },
    lineItem: %{itemId: "1",
      name: "vase",
      description: "Cannes logo",
      quantity: "18",
      unitPrice: "45.00"
    }
  ]
  @amount 20.00

  def authorize() do
    case Billing.authorize(:payment_worker,AuthorizeNet, @amount, @card, @opts) do
      {:ok, response} -> response
      {:error, response} -> response
    end
  end

  def purchase() do
    case Billing.purchase(:payment_worker, AuthorizeNet, @amount, @card, @opts) do
      {:ok, response} -> response
      {:error, response} -> response
    end
  end

  def capture(id) do
    case Billing.capture(:payment_worker, AuthorizeNet, @amount, id, @opts) do
      {:ok, response} -> response
      {:error, response} -> response
    end
  end
end
