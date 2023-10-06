require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3779.0.0-darwin-x64.tar.gz"
    sha256 "ee920656f275d8b71fd000fd9197d6dac485b88badec949b8ff8485931e29ccb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3779.0.0-darwin-arm64.tar.gz"
      sha256 "102ac74f81f886f5268555ff93124da5fa3f744694058b9e79320ff031553153"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3779.0.0-linux-x64.tar.gz"
    sha256 "659fb318da156db0688db9ffca1b01891de443cc0d5afd356ec59bf930c1aa08"
  end
  version "3779.0.0"
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
