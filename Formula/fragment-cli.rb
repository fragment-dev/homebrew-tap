require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.25-darwin-x64.tar.gz"
    sha256 "334798d9a28ea089607bfbfe64e071656861d07070d594ab85115d90a3a4ad11"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.25-darwin-arm64.tar.gz"
      sha256 "32d86ace4c684e59c8f7e8885c9a8f7f57df16e346844ae441f000bb16623162"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.25-linux-x64.tar.gz"
    sha256 "7a9143a699484fd8ed1772425727c6805133075048feef01c552ea6e49d23c88"
  end
  version "2023.10.25"
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
