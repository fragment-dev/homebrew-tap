require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3658.0.0-darwin-x64.tar.gz"
    sha256 "0de78bc55153f6a36487c99965f6a88583baf82d82dec7f16546569ae81dd703"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3658.0.0-darwin-arm64.tar.gz"
      sha256 "a6695b94fe0f0de824a6e6c53371ea14d3e10802d07985a3769f0136115dc6f4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3658.0.0-linux-x64.tar.gz"
    sha256 "e8ed91b2deaccb5131a71f8db56a2300fb3991b1f3780a7fbbb9074265e9003f"
  end
  version "3658.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
