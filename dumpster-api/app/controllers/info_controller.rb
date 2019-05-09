class InfoController < ActionController::API

  def get
    magic_number = params[:magic_number].to_i

    case magic_number
      # Various 5xx HTTP codes.
      when 1
        random_500 = rand(500..504)
        return head random_500
      when 2
        # Circuit breaker (also useful for fails in general)
        return render body: 'You sent too many requests', status: 429
      when 3
        # How do we distinguish this from a fat-fingered route?
        return head 404
      when 4
        return render body:'Payload must be JSON', status: 400
      when 5
        # Need to provide creds
        return head 401
      when 6
        # Has creds, not granted access
        return head 403
      when 7
        # A 2xx but nothing in it, could cause unexpected behavior
        return head 204
      when 8
        # Slow API
        sleep(10)
      when 9
        # Surprisingly didn't work, nor did raise Exception or raise SystemExit
        # But we can try do a sleep and CTRL+C our docker container while it's in flight
        # return Process.kill(0,0)

        sleep(20)
    end

    render json: '{"magicNumber": ' + magic_number.to_s + '}', status: :ok
  end

  def get_xml
    render xml: '<BestApiEver><Ok Ok="ok">OK!</Ok></BestApiEver>'
  end
end