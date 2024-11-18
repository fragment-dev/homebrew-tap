require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.18-1-darwin-x64.tar.gz"
    sha256 "2971afb454d9c36f1251b3aad5ca572dbea9d19ecf7de99cb3694e52898d8bc2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.18-1-darwin-arm64.tar.gz"
      sha256 "88fa0a9a6db5eef7b141a811e278fba49f578353db52f7de5e939301783c1909"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.18-1-linux-x64.tar.gz"
    sha256 "59e644fec64524385b52cd4cab118724298c75018ddbd0c3fec662a16b0f38b1"
  end
  version "2024.11.18-1"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
