module Twitter
  class API < Grape::API
    version "v1", using: :header, vendor: "twitter"
    format :json
    prefix :api

    resource :statuses do
      desc "Return a public timeline."
      get :public_timeline do
        [
          {
            status: "ok",
            text: "no1"
          },
          {
            status: "ok",
            text: "no2"
          }
        ]
      end

      desc "Return a persional timeline."
      get :home_timeline do
        [
          {
            status: "fail",
            text: "no way"
          }
        ]        
      end
    end
  end
end
                                  
                                  
                         
