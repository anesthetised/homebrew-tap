class Acplause < Formula
  desc "ACP v2 agent for OpenAI-compatible APIs"
  homepage "https://github.com/anesthetised/acplause"
  url "https://github.com/anesthetised/acplause/releases/download/v0.202610.0/acplause_v0.202610.0_source.tar.gz"
  version "v0.202610.0"
  sha256 "0c505983caa5c4433c1edac553bd182a17dc957f9427e3b4a6d8c8880f2f3015"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = %w[-s -w -X main.buildVersion=v0.202610.0 -X main.buildCommit=81e4a180d29637021030ae4d2d7a5abc40006e87]
    system "go", "build", *std_go_args(ldflags:), "./cmd/acplause"
  end

  test do
    assert_match "acplause v0.202610.0 (commit 81e4a180d29637021030ae4d2d7a5abc40006e87)", shell_output("#{bin}/acplause --version 2>&1")
  end
end
