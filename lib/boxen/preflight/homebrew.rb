require "boxen/preflight"

class Boxen::Preflight::Homebrew < Boxen::Preflight
  def run
    warn "You have an existing Homebrew install in /usr/local",
      "The Boxen provides its own Homebrew, so consider deleting yours.",
      "Keeping both will confuse many projects."
  end

  def ok?
    check = ENV['BOXEN_CHECK_HOMEBREW'] || 'yes'
    check != 'yes' || !File.exist?("/usr/local/Library/Homebrew")
  end
end
