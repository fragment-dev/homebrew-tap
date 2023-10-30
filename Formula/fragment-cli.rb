require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.27-darwin-x64.tar.gz"
    sha256 "dc2dfc830500ecfe6610aa6dd174d071c7c048ca1e84924d79700e06aba647af"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.27-darwin-arm64.tar.gz"
      sha256 "11ff06b9fd15beb9744e512feec98b85f515300841feced88d7f0ad480fde77b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.27-linux-x64.tar.gz"
    sha256 "40a38d1d993212c8628871e31df8e9ecb06132f6f973d1af9bec666cc7395908"
  end
  version "2023.10.27"
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
