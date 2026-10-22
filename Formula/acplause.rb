class Acplause < Formula
  desc "ACP v2 agent for OpenAI-compatible APIs"
  homepage "https://github.com/anesthetised/acplause"
  url "https://github.com/anesthetised/acplause/releases/download/v0.202610.1/acplause_v0.202610.1_source.tar.gz"
  version "v0.202610.1"
  sha256 "61e5ee87fd4a9530f1669323d56d4dfe5c966c991f5d74727aaed7695fd36f48"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = %w[-s -w -X main.buildVersion=v0.202610.1 -X main.buildCommit=e146279db5532be15a17de4ccc747af58f198d77]
    system "go", "build", *std_go_args(ldflags:), "./cmd/acplause"
  end

  test do
    assert_match "acplause v0.202610.1 (commit e146279db5532be15a17de4ccc747af58f198d77)", shell_output("#{bin}/acplause --version 2>&1")
  end
end
