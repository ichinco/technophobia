module StackExchangeHelper
  include HTTParty
  base_uri 'api.stackexchange.com/'

  def get_all_questions_with_tag(from_date, tags)
    has_more = true
    page = 1
    total = 0
    answered = 0
    tags.each do |tag|
      while has_more do
        options = { query: {site: "stackoverflow", page: page, tagged: tag, fromdate: from_date.strftime('%s'), pagesize: 100}}
        questions = HTTParty.get("http://api.stackexchange.com/2.2/questions", options)
        has_more = questions['has_more']
        backoff = questions['backoff']
        page += 1

        questions['items'].each do |item|
          total +=1
          if item['answer_count'] > 0
            answered += 1
          end
        end

        if backoff
          sleep(backoff)
        end
      end
    end

    return {total: total, answered: answered}
  end

end