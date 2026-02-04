class SureCli < Formula
  desc "Agent-first CLI for Sure personal finance app"
  homepage "https://github.com/dgilperez/sure-cli"
  url "https://github.com/dgilperez/sure-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "35ce1b4c66943fed77f3bceafeacc4dfb1b1bd12769c5be1751c85e6575a6a92"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/sure-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sure-cli version")
  end
end
