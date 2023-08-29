require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.29-darwin-x64.tar.gz"
    sha256 "44c21070938a99639412f4293a17a624950002b45fac3152007487519be826fe"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.29-darwin-arm64.tar.gz"
      sha256 "20fe209a0ed1adbd9b01b3d5e7913b35d86944587ec524cc260c0d1ded87cb51"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.29-linux-x64.tar.gz"
    sha256 "f9b8248d91ca9ad6cb5013f1e8a2db3ad414f00128bbff147037294842e019e6"
  end
  version "2023.8.29"
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
