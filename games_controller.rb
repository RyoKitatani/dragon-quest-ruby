class GamesController

  EXP_CONSTANT = 2
  GOLD_CONSTANT = 2

  def battle(**params)
    build_characters(params)

    # ループ処理
    loop do
      @brave.attack(@monster)
      break if battle_end?
      @monster.attack(@brave)
      break if battle_end?

      battle_judgement
    end
  end

  private

  def build_characters(**params)
    @brave = params[:brave]
    @monster = params[:monster]
  end

  def battle_win?
    @brave.hp > 0
  end

  def battle_end?
    @brave.hp <= 0 || @monster.hp <= 0
  end

  def battle_judgement
    if battle_win?
      result = calculate_of_exp_gold
      puts "#{@brave.name}は戦いに勝利した"
      puts "#{result[:exp]}の経験値と#{result[:gold]}ゴールドを獲得した!"
    else
      puts "#{@brave.name}は戦いに負けた"
      puts "目の前が真っ暗になった......"
    end
  end

  def calculate_of_exp_gold
    exp = (@monster.offense + @monster.defense) * EXP_CONSTANT
    gold = (@monster.offense + @monster.defense) * GOLD_CONSTANT
    result = {exp: exp, gold: gold}

    result
  end
end
