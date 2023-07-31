require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3200.0.0-darwin-x64.tar.gz"
    sha256 "c6ef0bb00bf2dbc6de6b05510727ae8d1aaf351f0bd46d6c75a4a534f1e3c4a8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3200.0.0-darwin-arm64.tar.gz"
      sha256 "1381e0e620e4cdf6e07877b43f0c350edaf421ee85ac64ffe850cc8b522fe857"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3200.0.0-linux-x64.tar.gz"
    sha256 "0c519819f16f81dd3b079e9d9df85233abfd05f2d8f69170a9de0ca26545bd93"
  end
  version "3200.0.0"
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
