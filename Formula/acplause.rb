class Acplause < Formula
  desc "ACP v2 agent for OpenAI-compatible APIs"
  homepage "https://github.com/anesthetised/acplause"
  url "https://github.com/anesthetised/acplause/releases/download/v0.202610.2/acplause_v0.202610.2_source.tar.gz"
  version "v0.202610.2"
  sha256 "ee7d024415d4554e709f1eb7a790f6c2e86916866093abc5385f358c8e90aa32"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = %w[-s -w -X main.buildVersion=v0.202610.2 -X main.buildCommit=2f6bcb85a1f53fecfc001209016662bc5af37fc7]
    system "go", "build", *std_go_args(ldflags:), "./cmd/acplause"
  end

  test do
    assert_match "acplause v0.202610.2 (commit 2f6bcb85a1f53fecfc001209016662bc5af37fc7)", shell_output("#{bin}/acplause --version 2>&1")
  end
end
