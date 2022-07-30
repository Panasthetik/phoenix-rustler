defmodule RustphoenixWeb.PageController do
  use RustphoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html",
      callput: "Call",
      underlying: 100.0,
      strike: 100.0,
      timetoexpiry: 1.0,
      volatility: 0.3,
      riskfreerate: 0.05,
      price: 0.0,
      delta: 0.0,
      csrf_token: Plug.CSRFProtection.get_csrf_token()
    )
  end

  def calculate(conn, params) do
    cp = Map.fetch!(params, "callput")
    s = Map.fetch!(params, "underlying") |> String.to_float()
    k = Map.fetch!(params, "strike") |> String.to_float()
    t = Map.fetch!(params, "timetoexpiry") |> String.to_float()
    vol = Map.fetch!(params, "volatility") |> String.to_float()
    r = Map.fetch!(params, "riskfreerate") |> String.to_float()

    price = NIF.price(cp, s, k, t, vol, r)
    delta = NIF.delta(cp, s, k, t, vol, r)

    render(conn, "index.html",
      callput: cp,
      underlying: s,
      strike: k,
      timetoexpiry: t,
      volatility: vol,
      riskfreerate: r,
      price: Float.round(price, 2),
      delta: Float.round(delta, 4),
      csrf_token: Plug.CSRFProtection.get_csrf_token()
    )
  end

end
