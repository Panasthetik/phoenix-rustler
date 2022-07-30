defmodule NIF do
  use Rustler, otp_app: :rustphoenix, crate: "rust_mod"

  def price(_cp, _s, _k, _t, _vol, _r), do: :erlang.nif_error(:nif_not_loaded)
  def delta(_cp, _s, _k, _t, _vol, _r), do: :erlang.nif_error(:nif_not_loaded)

end
