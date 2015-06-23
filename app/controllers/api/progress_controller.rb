class Api::ProgressController < ApplicationController
  respond_to :json

  def add
    @progress = get_or_create_progress(params[:achievement], params[:user])
    @ticks = params[:ticks].to_i

    while @ticks > 0
      if ! @progress.completed?
        if @ticks <= @progress.remaining
          @progress.ticks += @ticks
          @ticks = 0
        else
          @ticks -= @progress.remaining
          @progress.ticks += @progress.remaining
        end

        if @progress.completed?
          @progress.completed = true
          @progress.complete_date = Date.today
        end

        @progress.save
      end

      if @progress.completed? && @ticks > 0 && @progress.achievement.repeatable
        @progress = create_new_progress(params[:achievement], params[:user])
      else
        @ticks = 0
      end
    end

    respond_with @progress
  end

  def subtract
    @progress = get_only_existing_progress(params[:achievement], params[:user])
    @ticks = params[:ticks].to_i

    while @ticks > 0 && ! @progress.nil?
      if @progress.ticks > 0
          if @ticks <= @progress.ticks
            @progress.ticks -= @ticks
            @ticks = 0
          else
            @ticks -= @progress.ticks
            @progress.ticks = 0
          end
      end

      if @progress.completed && ! @progress.completed?
        @progress.completed = false
        @progress.complete_date = nil
      end

      @progress.save

      if @progress.ticks == 0 && @ticks > 0
        if @progress.achievement.repeatable
          @progress.destroy
          @progress = get_only_existing_progress(params[:achievement], params[:user])
        else
          @progress.destroy
          @ticks = 0
        end
      end
    end

    if @progress.nil?
      @progress = create_new_progress(params[:achievement], params[:user])
    end

    respond_with @progress
  end

  def grant
    @progress = get_or_create_progress(params[:achievement], params[:user])
    if @progress.completed? && @progress.achievement.repeatable
      @progress = create_new_progress(params[:achievement], params[:user])
    end

    if ! @progress.completed?
      @progress.grant
    end

    respond_with @progress
  end

  def forfeit
    @progress = get_or_create_progress(params[:achievement], params[:user])
    @progress.forfeit

    respond_with @progress
  end
end
