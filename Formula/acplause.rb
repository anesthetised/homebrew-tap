class Acplause < Formula
  desc "ACP v2 agent for OpenAI-compatible APIs"
  homepage "https://github.com/anesthetised/acplause"
  url "https://github.com/anesthetised/acplause/releases/download/v0.202611.0/acplause_v0.202611.0_source.tar.gz"
  version "v0.202611.0"
  sha256 "917816c1946d6e15d0cf2cfb99450309d266ec4eeeb3ea0c376256540a83f5a2"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = %w[-s -w -X main.buildVersion=v0.202611.0 -X main.buildCommit=e59a50541f8b9ad7378bf39a65b9485e5a84260b]
    system "go", "build", *std_go_args(ldflags:), "./cmd/acplause"
  end

  test do
    assert_match "acplause v0.202611.0 (commit e59a50541f8b9ad7378bf39a65b9485e5a84260b)", shell_output("#{bin}/acplause --version 2>&1")
  end
end
