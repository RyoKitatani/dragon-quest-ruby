require './message_dialog.rb'

class GamesController
  include MessageDialog

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
    end

    battle_judgement
  end

  private

  def build_characters(**params)
    @brave = params[:brave]
    @monster = params[:monster]
  end

  def brave_win?
    @brave.hp > 0
  end

  def battle_end?
    @brave.hp <= 0 || @monster.hp <= 0
  end

  def battle_judgement
    result = calculate_of_exp_gold

    end_message(result)
  end

  def calculate_of_exp_gold
    if brave_win?
      brave_win_flag = true
      exp = (@monster.offense + @monster.defense) * EXP_CONSTANT
      gold = (@monster.offense + @monster.defense) * GOLD_CONSTANT
    else
      brave_win_flag = false
      exp = 0
      gold = 0
    end

    {brave_win_flag: brave_win_flag, exp: exp, gold: gold}
  end
end
